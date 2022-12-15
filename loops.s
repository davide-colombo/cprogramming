	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_for1_inc                       ; -- Begin function for1_inc
	.p2align	2
_for1_inc:                              ; @for1_inc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	xzr, [sp, #8]
	str	xzr, [sp]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp]
	mov	x9, #57600
	movk	x9, #1525, lsl #16
	subs	x8, x8, x9
	b.hs	LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]
	add	x8, x8, #1
	str	x8, [sp, #8]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp]
	add	x8, x8, #1
	str	x8, [sp]
	b	LBB0_1
LBB0_4:
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
