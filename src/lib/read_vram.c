/*
 * Copyright 2017 Advanced Micro Devices, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 *
 * Authors: Tom St Denis <tom.stdenis@amd.com>
 *
 */
#include "umrapp.h"
#include <inttypes.h>

static void read_via_mmio(struct umr_asic *asic, uint64_t address, uint32_t size, void *dst)
{
	uint32_t MM_INDEX, MM_INDEX_HI, MM_DATA;
	uint32_t *out = dst;

	// find registers
	MM_INDEX    = umr_find_reg(asic, "mmMM_INDEX") * 4;
	MM_INDEX_HI = umr_find_reg(asic, "mmMM_INDEX_HI") * 4;
	MM_DATA     = umr_find_reg(asic, "mmMM_DATA") * 4;

	if (MM_INDEX == 0xFFFFFFFF    ||
	    MM_INDEX_HI == 0xFFFFFFFF ||
	    MM_DATA == 0xFFFFFFFF) {
		fprintf(stderr, "[BUG] Cannot find MM access registers for this asic!\n");
		return;
	}

	while (size) {
		umr_write_reg(asic, MM_INDEX, address | 0x80000000);
		umr_write_reg(asic, MM_INDEX_HI, address >> 31);
		*out++ = umr_read_reg(asic, MM_DATA);
		size -= 4;
		address += 4;
	}
}

#define DEBUG printf

static int umr_read_sram(uint64_t address, uint32_t size, void *dst)
{
	int fd;

	fd = open("/dev/mem", O_RDWR);
	if (fd >= 0) {
		memset(dst, 0, size);
		lseek(fd, address, SEEK_SET);
		if (read(fd, dst, size) != size) {
			close(fd);
			return -1;
		}
		close(fd);
		return 0;
	}
	return -1;
}


static int umr_read_vram_vi(struct umr_asic *asic, uint32_t vmid, uint64_t address, uint32_t size, void *dst)
{
	uint64_t start_addr, page_table_start_addr, page_table_base_addr,
		 page_table_size, pte_idx, pde_idx, pte_entry, pde_entry;
	uint32_t chunk_size, tmp;
	int page_table_depth;
	struct {
		uint64_t
			frag_size,
			pte_base_addr,
			valid;
	} pde_fields;
	struct {
		uint64_t
			page_base_addr,
			fragment,
			system;
	} pte_fields;
	char buf[64];
	unsigned char *pdst = dst;

	/*
	 * PTE format on VI:
	 * 63:40 reserved
	 * 39:12 4k physical page base address
	 * 11:7 fragment
	 * 6 write
	 * 5 read
	 * 4 exe
	 * 3 reserved
	 * 2 snooped
	 * 1 system
	 * 0 valid
	 *
	 * PDE format on VI:
	 * 63:59 block fragment size
	 * 58:40 reserved
	 * 39:1 physical base address of PTE
	 * bits 5:1 must be 0.
	 * 0 valid
	 */

	// read vm registers
	sprintf(buf, "mmVM_CONTEXT%d_PAGE_TABLE_START_ADDR", (int)vmid ? 1 : 0);
		page_table_start_addr = (uint64_t)umr_read_reg_by_name(asic, buf) << 12;

	sprintf(buf, "mmVM_CONTEXT%d_CNTL", (int)vmid ? 1 : 0);
		tmp = umr_read_reg_by_name(asic, buf);
		page_table_depth      = umr_bitslice_reg_by_name(asic, buf, "PAGE_TABLE_DEPTH", tmp);
		page_table_size       = umr_bitslice_reg_by_name(asic, buf, "PAGE_TABLE_BLOCK_SIZE", tmp);

	sprintf(buf, "mmVM_CONTEXT%d_PAGE_TABLE_BASE_ADDR", (int)vmid);
		page_table_base_addr  = (uint64_t)umr_read_reg_by_name(asic, buf) << 12;

	DEBUG("PAGE_START_ADDR = %08llx\n", (unsigned long long)page_table_start_addr);
	DEBUG("BASE_ADDR = 0x%08llx\n", (unsigned long long)page_table_base_addr);
	DEBUG("BASE_SIZE = %lu\n", page_table_size);
	DEBUG("PAGE_TABLE_DEPTH = %d\n", page_table_depth);

	address -= page_table_start_addr;

	while (size) {
		if (page_table_depth == 1) {
			// decode addr into pte and pde selectors...
			pde_idx = (address >> (12 + 9 + page_table_size)) & ((1UL << (19 - page_table_size)) - 1);
			pte_idx = (address >> 12) & ((1UL << (9 + page_table_size)) - 1);

			// read PDE entry
			umr_read_vram(asic, 0xFFFF, page_table_base_addr + pde_idx * 8, 8, &pde_entry);

			// decode PDE values
			pde_fields.frag_size     = (pde_entry >> 59) & 0x1F;
			pde_fields.pte_base_addr = pde_entry & 0xFFFFFFF000;
			pde_fields.valid         = pde_entry & 1;
			DEBUG("pde_idx=%llx, frag_size=%u, pte_base_addr=0x%llx, valid=%d\n", (unsigned long long)pde_idx, (unsigned)pde_fields.frag_size, (unsigned long long)pde_fields.pte_base_addr, (int)pde_fields.valid);

			// now read PTE entry for this page
			umr_read_vram(asic, 0xFFFF, pde_fields.pte_base_addr + pte_idx*8, 8, &pte_entry);

			// decode PTE values
			pte_fields.page_base_addr = pte_entry & 0xFFFFFFF000;
			pte_fields.fragment       = (pte_entry >> 7)  & 0x1F;
			pte_fields.system         = (pte_entry >> 1) & 1;
			DEBUG("pte_idx=%llx, page_base_addr=0x%llx, fragment=%u, system=%d\n", (unsigned long long)pte_idx, (unsigned long long)pte_fields.page_base_addr, (unsigned)pte_fields.fragment, (int)pte_fields.system);

			// compute starting address
			start_addr = pte_fields.page_base_addr + (address & 0xFFF);
		} else {
			fprintf(stderr, "[BUG] depth 0 page tables are not yet supported\n");
			return -1;
		}

		// read upto 4K from it
		if (((start_addr & 0xFFF) + size) & ~0xFFF) {
			chunk_size = 0x1000 - (start_addr & 0xFFF);
		} else {
			chunk_size = size;
		}
		DEBUG("Computed address we will read from: %s:%llx (reading: %lu bytes)\n", pte_fields.system ? "sys" : "vram", (unsigned long long)start_addr, (unsigned long)chunk_size);
		if (pte_fields.system) {
			if (umr_read_sram(start_addr, chunk_size, pdst) < 0) {
				fprintf(stderr, "[ERROR] Cannot read system ram, perhaps CONFIG_STRICT_DEVMEM is set in your kernel config?\n");
				return -1;
			}
		} else {
			if (umr_read_vram(asic, 0xFFFF, start_addr, chunk_size, pdst) < 0) {
				fprintf(stderr, "[ERROR] Cannot read from VRAM\n");
				return -1;
			}
		}
		pdst += chunk_size;
		size -= chunk_size;
		address += chunk_size;
	}
	return 0;
}


int umr_read_vram(struct umr_asic *asic, uint32_t vmid, uint64_t address, uint32_t size, void *dst)
{
	// only aligned reads
	if ((address & 3) || (size & 3))
		return -1;

	// only aligned destinations
	if (((intptr_t)dst) & 3) {
		fprintf(stderr, "[BUG] vram read destination is not 4-byte aligned\n");
		return -1;
	}

	if (vmid == 0xFFFF) {
		// addressing is physical
		if (asic->options.use_pci == 0) {
			lseek(asic->fd.vram, address, SEEK_SET);
			read(asic->fd.vram, dst, size);
		} else {
			read_via_mmio(asic, address, size, dst);
		}
		return 0;
	}

	if (asic->family == FAMILY_VI)
		return umr_read_vram_vi(asic, vmid, address, size, dst);

	return 0;
}