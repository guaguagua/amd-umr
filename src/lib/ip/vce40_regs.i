	{ "mmVCE_STATUS", REG_MMIO, 0x0a01, 0, &mmVCE_STATUS[0], sizeof(mmVCE_STATUS)/sizeof(mmVCE_STATUS[0]), 0, 0 },
	{ "mmVCE_VCPU_CNTL", REG_MMIO, 0x0a05, 0, &mmVCE_VCPU_CNTL[0], sizeof(mmVCE_VCPU_CNTL)/sizeof(mmVCE_VCPU_CNTL[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_OFFSET0", REG_MMIO, 0x0a09, 0, &mmVCE_VCPU_CACHE_OFFSET0[0], sizeof(mmVCE_VCPU_CACHE_OFFSET0)/sizeof(mmVCE_VCPU_CACHE_OFFSET0[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_SIZE0", REG_MMIO, 0x0a0a, 0, &mmVCE_VCPU_CACHE_SIZE0[0], sizeof(mmVCE_VCPU_CACHE_SIZE0)/sizeof(mmVCE_VCPU_CACHE_SIZE0[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_OFFSET1", REG_MMIO, 0x0a0b, 0, &mmVCE_VCPU_CACHE_OFFSET1[0], sizeof(mmVCE_VCPU_CACHE_OFFSET1)/sizeof(mmVCE_VCPU_CACHE_OFFSET1[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_SIZE1", REG_MMIO, 0x0a0c, 0, &mmVCE_VCPU_CACHE_SIZE1[0], sizeof(mmVCE_VCPU_CACHE_SIZE1)/sizeof(mmVCE_VCPU_CACHE_SIZE1[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_OFFSET2", REG_MMIO, 0x0a0d, 0, &mmVCE_VCPU_CACHE_OFFSET2[0], sizeof(mmVCE_VCPU_CACHE_OFFSET2)/sizeof(mmVCE_VCPU_CACHE_OFFSET2[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_SIZE2", REG_MMIO, 0x0a0e, 0, &mmVCE_VCPU_CACHE_SIZE2[0], sizeof(mmVCE_VCPU_CACHE_SIZE2)/sizeof(mmVCE_VCPU_CACHE_SIZE2[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_OFFSET3", REG_MMIO, 0x0a0f, 0, &mmVCE_VCPU_CACHE_OFFSET3[0], sizeof(mmVCE_VCPU_CACHE_OFFSET3)/sizeof(mmVCE_VCPU_CACHE_OFFSET3[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_SIZE3", REG_MMIO, 0x0a10, 0, &mmVCE_VCPU_CACHE_SIZE3[0], sizeof(mmVCE_VCPU_CACHE_SIZE3)/sizeof(mmVCE_VCPU_CACHE_SIZE3[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_OFFSET4", REG_MMIO, 0x0a11, 0, &mmVCE_VCPU_CACHE_OFFSET4[0], sizeof(mmVCE_VCPU_CACHE_OFFSET4)/sizeof(mmVCE_VCPU_CACHE_OFFSET4[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_SIZE4", REG_MMIO, 0x0a12, 0, &mmVCE_VCPU_CACHE_SIZE4[0], sizeof(mmVCE_VCPU_CACHE_SIZE4)/sizeof(mmVCE_VCPU_CACHE_SIZE4[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_OFFSET5", REG_MMIO, 0x0a13, 0, &mmVCE_VCPU_CACHE_OFFSET5[0], sizeof(mmVCE_VCPU_CACHE_OFFSET5)/sizeof(mmVCE_VCPU_CACHE_OFFSET5[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_SIZE5", REG_MMIO, 0x0a14, 0, &mmVCE_VCPU_CACHE_SIZE5[0], sizeof(mmVCE_VCPU_CACHE_SIZE5)/sizeof(mmVCE_VCPU_CACHE_SIZE5[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_OFFSET6", REG_MMIO, 0x0a15, 0, &mmVCE_VCPU_CACHE_OFFSET6[0], sizeof(mmVCE_VCPU_CACHE_OFFSET6)/sizeof(mmVCE_VCPU_CACHE_OFFSET6[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_SIZE6", REG_MMIO, 0x0a16, 0, &mmVCE_VCPU_CACHE_SIZE6[0], sizeof(mmVCE_VCPU_CACHE_SIZE6)/sizeof(mmVCE_VCPU_CACHE_SIZE6[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_OFFSET7", REG_MMIO, 0x0a17, 0, &mmVCE_VCPU_CACHE_OFFSET7[0], sizeof(mmVCE_VCPU_CACHE_OFFSET7)/sizeof(mmVCE_VCPU_CACHE_OFFSET7[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_SIZE7", REG_MMIO, 0x0a18, 0, &mmVCE_VCPU_CACHE_SIZE7[0], sizeof(mmVCE_VCPU_CACHE_SIZE7)/sizeof(mmVCE_VCPU_CACHE_SIZE7[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_OFFSET8", REG_MMIO, 0x0a19, 0, &mmVCE_VCPU_CACHE_OFFSET8[0], sizeof(mmVCE_VCPU_CACHE_OFFSET8)/sizeof(mmVCE_VCPU_CACHE_OFFSET8[0]), 0, 0 },
	{ "mmVCE_VCPU_CACHE_SIZE8", REG_MMIO, 0x0a1a, 0, &mmVCE_VCPU_CACHE_SIZE8[0], sizeof(mmVCE_VCPU_CACHE_SIZE8)/sizeof(mmVCE_VCPU_CACHE_SIZE8[0]), 0, 0 },
	{ "mmVCE_SOFT_RESET", REG_MMIO, 0x0a48, 0, &mmVCE_SOFT_RESET[0], sizeof(mmVCE_SOFT_RESET)/sizeof(mmVCE_SOFT_RESET[0]), 0, 0 },
	{ "mmVCE_RB_BASE_LO2", REG_MMIO, 0x0a5b, 0, &mmVCE_RB_BASE_LO2[0], sizeof(mmVCE_RB_BASE_LO2)/sizeof(mmVCE_RB_BASE_LO2[0]), 0, 0 },
	{ "mmVCE_RB_BASE_HI2", REG_MMIO, 0x0a5c, 0, &mmVCE_RB_BASE_HI2[0], sizeof(mmVCE_RB_BASE_HI2)/sizeof(mmVCE_RB_BASE_HI2[0]), 0, 0 },
	{ "mmVCE_RB_SIZE2", REG_MMIO, 0x0a5d, 0, &mmVCE_RB_SIZE2[0], sizeof(mmVCE_RB_SIZE2)/sizeof(mmVCE_RB_SIZE2[0]), 0, 0 },
	{ "mmVCE_RB_RPTR2", REG_MMIO, 0x0a5e, 0, &mmVCE_RB_RPTR2[0], sizeof(mmVCE_RB_RPTR2)/sizeof(mmVCE_RB_RPTR2[0]), 0, 0 },
	{ "mmVCE_RB_WPTR2", REG_MMIO, 0x0a5f, 0, &mmVCE_RB_WPTR2[0], sizeof(mmVCE_RB_WPTR2)/sizeof(mmVCE_RB_WPTR2[0]), 0, 0 },
	{ "mmVCE_RB_BASE_LO", REG_MMIO, 0x0a60, 0, &mmVCE_RB_BASE_LO[0], sizeof(mmVCE_RB_BASE_LO)/sizeof(mmVCE_RB_BASE_LO[0]), 0, 0 },
	{ "mmVCE_RB_BASE_HI", REG_MMIO, 0x0a61, 0, &mmVCE_RB_BASE_HI[0], sizeof(mmVCE_RB_BASE_HI)/sizeof(mmVCE_RB_BASE_HI[0]), 0, 0 },
	{ "mmVCE_RB_SIZE", REG_MMIO, 0x0a62, 0, &mmVCE_RB_SIZE[0], sizeof(mmVCE_RB_SIZE)/sizeof(mmVCE_RB_SIZE[0]), 0, 0 },
	{ "mmVCE_RB_RPTR", REG_MMIO, 0x0a63, 0, &mmVCE_RB_RPTR[0], sizeof(mmVCE_RB_RPTR)/sizeof(mmVCE_RB_RPTR[0]), 0, 0 },
	{ "mmVCE_RB_WPTR", REG_MMIO, 0x0a64, 0, &mmVCE_RB_WPTR[0], sizeof(mmVCE_RB_WPTR)/sizeof(mmVCE_RB_WPTR[0]), 0, 0 },
	{ "mmVCE_RB_ARB_CTRL", REG_MMIO, 0x0a9f, 0, &mmVCE_RB_ARB_CTRL[0], sizeof(mmVCE_RB_ARB_CTRL)/sizeof(mmVCE_RB_ARB_CTRL[0]), 0, 0 },
	{ "mmVCE_CLOCK_GATING_A", REG_MMIO, 0x0abe, 0, &mmVCE_CLOCK_GATING_A[0], sizeof(mmVCE_CLOCK_GATING_A)/sizeof(mmVCE_CLOCK_GATING_A[0]), 0, 0 },
	{ "mmVCE_CLOCK_GATING_B", REG_MMIO, 0x0abf, 0, &mmVCE_CLOCK_GATING_B[0], sizeof(mmVCE_CLOCK_GATING_B)/sizeof(mmVCE_CLOCK_GATING_B[0]), 0, 0 },
	{ "mmVCE_RB_BASE_LO3", REG_MMIO, 0x0ad4, 0, &mmVCE_RB_BASE_LO3[0], sizeof(mmVCE_RB_BASE_LO3)/sizeof(mmVCE_RB_BASE_LO3[0]), 0, 0 },
	{ "mmVCE_RB_BASE_HI3", REG_MMIO, 0x0ad5, 0, &mmVCE_RB_BASE_HI3[0], sizeof(mmVCE_RB_BASE_HI3)/sizeof(mmVCE_RB_BASE_HI3[0]), 0, 0 },
	{ "mmVCE_RB_SIZE3", REG_MMIO, 0x0ad6, 0, &mmVCE_RB_SIZE3[0], sizeof(mmVCE_RB_SIZE3)/sizeof(mmVCE_RB_SIZE3[0]), 0, 0 },
	{ "mmVCE_RB_RPTR3", REG_MMIO, 0x0ad7, 0, &mmVCE_RB_RPTR3[0], sizeof(mmVCE_RB_RPTR3)/sizeof(mmVCE_RB_RPTR3[0]), 0, 0 },
	{ "mmVCE_RB_WPTR3", REG_MMIO, 0x0ad8, 0, &mmVCE_RB_WPTR3[0], sizeof(mmVCE_RB_WPTR3)/sizeof(mmVCE_RB_WPTR3[0]), 0, 0 },
	{ "mmVCE_SYS_INT_EN", REG_MMIO, 0x0b00, 0, &mmVCE_SYS_INT_EN[0], sizeof(mmVCE_SYS_INT_EN)/sizeof(mmVCE_SYS_INT_EN[0]), 0, 0 },
	{ "mmVCE_SYS_INT_ACK", REG_MMIO, 0x0b01, 0, &mmVCE_SYS_INT_ACK[0], sizeof(mmVCE_SYS_INT_ACK)/sizeof(mmVCE_SYS_INT_ACK[0]), 0, 0 },
	{ "mmVCE_SYS_INT_STATUS", REG_MMIO, 0x0b01, 0, &mmVCE_SYS_INT_STATUS[0], sizeof(mmVCE_SYS_INT_STATUS)/sizeof(mmVCE_SYS_INT_STATUS[0]), 0, 0 },
	{ "mmVCE_UENC_CLOCK_GATING", REG_MMIO, 0x0bef, 0, &mmVCE_UENC_CLOCK_GATING[0], sizeof(mmVCE_UENC_CLOCK_GATING)/sizeof(mmVCE_UENC_CLOCK_GATING[0]), 0, 0 },
	{ "mmVCE_UENC_REG_CLOCK_GATING", REG_MMIO, 0x0bf0, 0, &mmVCE_UENC_REG_CLOCK_GATING[0], sizeof(mmVCE_UENC_REG_CLOCK_GATING)/sizeof(mmVCE_UENC_REG_CLOCK_GATING[0]), 0, 0 },
	{ "mmVCE_UENC_CLOCK_GATING_2", REG_MMIO, 0x0c10, 0, &mmVCE_UENC_CLOCK_GATING_2[0], sizeof(mmVCE_UENC_CLOCK_GATING_2)/sizeof(mmVCE_UENC_CLOCK_GATING_2[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_40BIT_BAR", REG_MMIO, 0x0fcc, 0, &mmVCE_LMI_VCPU_CACHE_40BIT_BAR[0], sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR)/sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR[0]), 0, 0 },
	{ "mmVCE_LMI_CTRL2", REG_MMIO, 0x0fcf, 0, &mmVCE_LMI_CTRL2[0], sizeof(mmVCE_LMI_CTRL2)/sizeof(mmVCE_LMI_CTRL2[0]), 0, 0 },
	{ "mmVCE_LMI_SWAP_CNTL3", REG_MMIO, 0x0fd0, 0, &mmVCE_LMI_SWAP_CNTL3[0], sizeof(mmVCE_LMI_SWAP_CNTL3)/sizeof(mmVCE_LMI_SWAP_CNTL3[0]), 0, 0 },
	{ "mmVCE_LMI_CTRL", REG_MMIO, 0x0fd6, 0, &mmVCE_LMI_CTRL[0], sizeof(mmVCE_LMI_CTRL)/sizeof(mmVCE_LMI_CTRL[0]), 0, 0 },
	{ "mmVCE_LMI_STATUS", REG_MMIO, 0x0fd7, 0, NULL, 0, 0, 0 },
	{ "mmVCE_LMI_VM_CTRL", REG_MMIO, 0x0fd8, 0, NULL, 0, 0, 0 },
	{ "mmVCE_LMI_SWAP_CNTL", REG_MMIO, 0x0fdd, 0, &mmVCE_LMI_SWAP_CNTL[0], sizeof(mmVCE_LMI_SWAP_CNTL)/sizeof(mmVCE_LMI_SWAP_CNTL[0]), 0, 0 },
	{ "mmVCE_LMI_SWAP_CNTL1", REG_MMIO, 0x0fde, 0, &mmVCE_LMI_SWAP_CNTL1[0], sizeof(mmVCE_LMI_SWAP_CNTL1)/sizeof(mmVCE_LMI_SWAP_CNTL1[0]), 0, 0 },
	{ "mmVCE_LMI_SWAP_CNTL2", REG_MMIO, 0x0fe2, 0, &mmVCE_LMI_SWAP_CNTL2[0], sizeof(mmVCE_LMI_SWAP_CNTL2)/sizeof(mmVCE_LMI_SWAP_CNTL2[0]), 0, 0 },
	{ "mmVCE_LMI_CACHE_CTRL", REG_MMIO, 0x0fec, 0, &mmVCE_LMI_CACHE_CTRL[0], sizeof(mmVCE_LMI_CACHE_CTRL)/sizeof(mmVCE_LMI_CACHE_CTRL[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_64BIT_BAR0", REG_MMIO, 0x1086, 0, &mmVCE_LMI_VCPU_CACHE_64BIT_BAR0[0], sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR0)/sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR0[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_64BIT_BAR1", REG_MMIO, 0x1087, 0, &mmVCE_LMI_VCPU_CACHE_64BIT_BAR1[0], sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR1)/sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR1[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_64BIT_BAR2", REG_MMIO, 0x1088, 0, &mmVCE_LMI_VCPU_CACHE_64BIT_BAR2[0], sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR2)/sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR2[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_64BIT_BAR3", REG_MMIO, 0x1089, 0, &mmVCE_LMI_VCPU_CACHE_64BIT_BAR3[0], sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR3)/sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR3[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_64BIT_BAR4", REG_MMIO, 0x108a, 0, &mmVCE_LMI_VCPU_CACHE_64BIT_BAR4[0], sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR4)/sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR4[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_64BIT_BAR5", REG_MMIO, 0x108b, 0, &mmVCE_LMI_VCPU_CACHE_64BIT_BAR5[0], sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR5)/sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR5[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_64BIT_BAR6", REG_MMIO, 0x108c, 0, &mmVCE_LMI_VCPU_CACHE_64BIT_BAR6[0], sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR6)/sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR6[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_64BIT_BAR7", REG_MMIO, 0x108d, 0, &mmVCE_LMI_VCPU_CACHE_64BIT_BAR7[0], sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR7)/sizeof(mmVCE_LMI_VCPU_CACHE_64BIT_BAR7[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_40BIT_BAR0", REG_MMIO, 0x1096, 0, &mmVCE_LMI_VCPU_CACHE_40BIT_BAR0[0], sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR0)/sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR0[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_40BIT_BAR1", REG_MMIO, 0x1097, 0, &mmVCE_LMI_VCPU_CACHE_40BIT_BAR1[0], sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR1)/sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR1[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_40BIT_BAR2", REG_MMIO, 0x1098, 0, &mmVCE_LMI_VCPU_CACHE_40BIT_BAR2[0], sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR2)/sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR2[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_40BIT_BAR3", REG_MMIO, 0x1099, 0, &mmVCE_LMI_VCPU_CACHE_40BIT_BAR3[0], sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR3)/sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR3[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_40BIT_BAR4", REG_MMIO, 0x109a, 0, &mmVCE_LMI_VCPU_CACHE_40BIT_BAR4[0], sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR4)/sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR4[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_40BIT_BAR5", REG_MMIO, 0x109b, 0, &mmVCE_LMI_VCPU_CACHE_40BIT_BAR5[0], sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR5)/sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR5[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_40BIT_BAR6", REG_MMIO, 0x109c, 0, &mmVCE_LMI_VCPU_CACHE_40BIT_BAR6[0], sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR6)/sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR6[0]), 0, 0 },
	{ "mmVCE_LMI_VCPU_CACHE_40BIT_BAR7", REG_MMIO, 0x109d, 0, &mmVCE_LMI_VCPU_CACHE_40BIT_BAR7[0], sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR7)/sizeof(mmVCE_LMI_VCPU_CACHE_40BIT_BAR7[0]), 0, 0 },
	{ "mmVCE_MMSCH_VF_VMID", REG_MMIO, 0x10cb, 0, &mmVCE_MMSCH_VF_VMID[0], sizeof(mmVCE_MMSCH_VF_VMID)/sizeof(mmVCE_MMSCH_VF_VMID[0]), 0, 0 },
	{ "mmVCE_MMSCH_VF_CTX_ADDR_LO", REG_MMIO, 0x10cc, 0, &mmVCE_MMSCH_VF_CTX_ADDR_LO[0], sizeof(mmVCE_MMSCH_VF_CTX_ADDR_LO)/sizeof(mmVCE_MMSCH_VF_CTX_ADDR_LO[0]), 0, 0 },
	{ "mmVCE_MMSCH_VF_CTX_ADDR_HI", REG_MMIO, 0x10cd, 0, &mmVCE_MMSCH_VF_CTX_ADDR_HI[0], sizeof(mmVCE_MMSCH_VF_CTX_ADDR_HI)/sizeof(mmVCE_MMSCH_VF_CTX_ADDR_HI[0]), 0, 0 },
	{ "mmVCE_MMSCH_VF_CTX_SIZE", REG_MMIO, 0x10ce, 0, &mmVCE_MMSCH_VF_CTX_SIZE[0], sizeof(mmVCE_MMSCH_VF_CTX_SIZE)/sizeof(mmVCE_MMSCH_VF_CTX_SIZE[0]), 0, 0 },
	{ "mmVCE_MMSCH_VF_GPCOM_ADDR_LO", REG_MMIO, 0x10cf, 0, &mmVCE_MMSCH_VF_GPCOM_ADDR_LO[0], sizeof(mmVCE_MMSCH_VF_GPCOM_ADDR_LO)/sizeof(mmVCE_MMSCH_VF_GPCOM_ADDR_LO[0]), 0, 0 },
	{ "mmVCE_MMSCH_VF_GPCOM_ADDR_HI", REG_MMIO, 0x10d0, 0, &mmVCE_MMSCH_VF_GPCOM_ADDR_HI[0], sizeof(mmVCE_MMSCH_VF_GPCOM_ADDR_HI)/sizeof(mmVCE_MMSCH_VF_GPCOM_ADDR_HI[0]), 0, 0 },
	{ "mmVCE_MMSCH_VF_GPCOM_SIZE", REG_MMIO, 0x10d1, 0, &mmVCE_MMSCH_VF_GPCOM_SIZE[0], sizeof(mmVCE_MMSCH_VF_GPCOM_SIZE)/sizeof(mmVCE_MMSCH_VF_GPCOM_SIZE[0]), 0, 0 },
	{ "mmVCE_MMSCH_VF_MAILBOX_HOST", REG_MMIO, 0x10d2, 0, &mmVCE_MMSCH_VF_MAILBOX_HOST[0], sizeof(mmVCE_MMSCH_VF_MAILBOX_HOST)/sizeof(mmVCE_MMSCH_VF_MAILBOX_HOST[0]), 0, 0 },
	{ "mmVCE_MMSCH_VF_MAILBOX_RESP", REG_MMIO, 0x10d3, 0, &mmVCE_MMSCH_VF_MAILBOX_RESP[0], sizeof(mmVCE_MMSCH_VF_MAILBOX_RESP)/sizeof(mmVCE_MMSCH_VF_MAILBOX_RESP[0]), 0, 0 },
	{ "mmVCE_HW_VERSION", REG_MMIO, 0x11e8, 0, &mmVCE_HW_VERSION[0], sizeof(mmVCE_HW_VERSION)/sizeof(mmVCE_HW_VERSION[0]), 0, 0 },
