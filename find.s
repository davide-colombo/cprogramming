	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	wzr, [sp, #28]
	str	w0, [sp, #24]
	str	x1, [sp, #16]
	adrp	x8, _ia@GOTPAGE
	ldr	x8, [x8, _ia@GOTPAGEOFF]
	str	x8, [sp, #8]
	mov	w8, #256
	str	w8, [sp, #4]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	subs	w8, w8, #1
	str	w8, [sp, #4]
	tbnz	w8, #31, LBB0_3
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #4]
	ldr	x9, [sp, #8]
	ldrsw	x10, [sp, #4]
	str	w8, [x9, x10, lsl #2]
	b	LBB0_1
LBB0_3:
	mov	w8, #74
	str	w8, [sp]
	b	LBB0_4
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	ldr	w8, [x8]
	ldr	w9, [sp]
	eor	w8, w8, w9
	cbz	w8, LBB0_6
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #8]
	add	x8, x8, #4
	str	x8, [sp, #8]
	b	LBB0_4
LBB0_6:
	mov	w0, #0
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.comm	_ia,1024,2                      ; @ia
.subsections_via_symbols
