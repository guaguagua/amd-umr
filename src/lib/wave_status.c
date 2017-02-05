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
#include "umr.h"

static int umr_get_wave_sq_info_vi(struct umr_asic *asic, unsigned se, unsigned sh, unsigned cu, struct umr_wave_status *ws)
{
	uint32_t value;
	uint64_t index, data, bank;

	index = umr_find_reg(asic, "mmSQ_IND_INDEX") * 4;
	data = umr_find_reg(asic, "mmSQ_IND_DATA") * 4;
	bank =
		(1ULL << 62) |
		(((uint64_t)se) << 24) |
		(((uint64_t)sh) << 34) |
		(((uint64_t)cu) << 44);

	if (!index || !data) {
		fprintf(stderr, "Cannot find SQ indirect registers on this asic!\n");
		return -1;
	}

	umr_write_reg(asic, index|bank, 8 << 16);
	value = umr_read_reg(asic, data|bank);
	ws->sq_info.busy = value & 1;
	ws->sq_info.wave_level = (value >> 4) & 0x3F;
	return 0;
}

static int umr_get_wave_status_vi(struct umr_asic *asic, unsigned se, unsigned sh, unsigned cu, unsigned simd, unsigned wave, struct umr_wave_status *ws)
{
	uint32_t x, value, buf[32];

	memset(buf, 0, sizeof buf);

	lseek(asic->fd.wave,
		0 |
		((uint64_t)se << 7) |
		((uint64_t)sh << 15) |
		((uint64_t)cu << 23) |
		((uint64_t)wave << 31) |
		((uint64_t)simd << 37), SEEK_SET);
	read(asic->fd.wave, &buf, 32*4);

	if (buf[0] != 0) {
		fprintf(stderr, "Was expecting type 0 wave data on a CZ/VI part!\n");
		return -1;
	}

	x = 1;
	ws->wave_status.value = value = buf[x++];
		ws->wave_status.scc = (value & 1);
		ws->wave_status.execz = (value >> 9) & 1;
		ws->wave_status.vccz  = (value >> 10) & 1;
		ws->wave_status.in_tg = (value >> 11) & 1;
		ws->wave_status.halt = (value >> 13) & 1;
		ws->wave_status.valid = (value >> 16) & 1;
		ws->wave_status.spi_prio = (value >> 1) & 3;
		ws->wave_status.wave_prio = (value >> 3) & 3;
		ws->wave_status.trap_en = (value >> 6) & 1;
		ws->wave_status.ttrace_en = (value >> 7) & 1;
		ws->wave_status.export_rdy = (value >> 8) & 1;
		ws->wave_status.in_barrier = (value >> 0xc) & 1;
		ws->wave_status.trap = (value >> 0xe) & 1;
		ws->wave_status.ecc_err = (value >> 0x11) & 1;
		ws->wave_status.skip_export = (value >> 0x12) & 1;
		ws->wave_status.perf_en = (value >> 0x13) & 1;
		ws->wave_status.cond_dbg_user = (value >> 0x14) & 1;
		ws->wave_status.cond_dbg_sys = (value >> 0x15) & 1;
		ws->wave_status.data_atc = (value >> 0x16) & 1;
		ws->wave_status.inst_atc = (value >> 0x17) & 1;
		ws->wave_status.dispatch_cache_ctrl = (value >> 0x18) & 3;
		ws->wave_status.must_export = (value >> 0x1b) & 1;

	ws->pc_lo = buf[x++];
	ws->pc_hi = buf[x++];
	ws->exec_lo = buf[x++];
	ws->exec_hi = buf[x++];

	ws->hw_id.value = value = buf[x++];
		ws->hw_id.wave_id = (value & 0xf);
		ws->hw_id.simd_id = (value >> 4) & 3;
		ws->hw_id.pipe_id = (value >> 6) & 3;
		ws->hw_id.cu_id   = (value >> 8) & 0xF;
		ws->hw_id.sh_id   = (value >> 12) & 1;
		ws->hw_id.se_id   = (value >> 13) & 3;
		ws->hw_id.tg_id   = (value >> 16) & 0xf;
		ws->hw_id.vm_id   = (value >> 20) & 0xF;
		ws->hw_id.queue_id = (value >> 24) & 7;
		ws->hw_id.state_id = (value >> 27) & 7;
		ws->hw_id.me_id    = (value >> 30) & 3;

	ws->wave_inst_dw0 = buf[x++];
	ws->wave_inst_dw1 = buf[x++];

	ws->gpr_alloc.value = value = buf[x++];
		ws->gpr_alloc.vgpr_base = (value & 0x3f);
		ws->gpr_alloc.vgpr_size = (value >> 8) & 0x3f;
		ws->gpr_alloc.sgpr_base = (value >> 0x10) & 0x3f;
		ws->gpr_alloc.sgpr_size = (value >> 0x18) & 0xf;

	ws->lds_alloc.value = value = buf[x++];
		ws->lds_alloc.lds_base = (value >> 0) & 0xFF;
		ws->lds_alloc.lds_size = (value >> 0xc) & 0x1FF;

	ws->trapsts.value = value = buf[x++];
		ws->trapsts.excp = (value >> 0) & 0x1ff;
		ws->trapsts.excp_cycle = (value >> 0x10) & 0x3f;
		ws->trapsts.dp_rate = (value >> 0x1d) & 0xe;
		
	ws->ib_sts.value = value = buf[x++];
		ws->ib_sts.vm_cnt = (value >> 0) & 0xF;
		ws->ib_sts.exp_cnt = (value >> 4) & 0x7;
		ws->ib_sts.lgkm_cnt = (value >> 8) & 0xF;
		ws->ib_sts.valu_cnt = (value >> 0xc) & 0x7;

	ws->tba_lo = buf[x++];
	ws->tba_hi = buf[x++];
	ws->tma_lo = buf[x++];
	ws->tma_hi = buf[x++];
	ws->ib_dbg0 = buf[x++];
	ws->m0 = buf[x++];

	return 0;
}

int umr_get_wave_status(struct umr_asic *asic, unsigned se, unsigned sh, unsigned cu, unsigned simd, unsigned wave, struct umr_wave_status *ws)
{
	if (asic->family <= FAMILY_VI)
		return umr_get_wave_status_vi(asic, se, sh, cu, simd, wave, ws);
	return -1;
}

int umr_get_wave_sq_info(struct umr_asic *asic, unsigned se, unsigned sh, unsigned cu, struct umr_wave_status *ws)
{
	if (asic->family <= FAMILY_VI)
		return umr_get_wave_sq_info_vi(asic, se, sh, cu, ws);
	return -1;
}