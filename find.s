	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	wzr, [sp, #44]
	str	w0, [sp, #40]
	str	x1, [sp, #32]
	str	wzr, [sp, #28]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #28]
	subs	w8, w8, #256
	b.ge	LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #28]
	ldrsw	x10, [sp, #28]
	adrp	x9, _ia@GOTPAGE
	ldr	x9, [x9, _ia@GOTPAGEOFF]
	str	w8, [x9, x10, lsl #2]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	LBB0_1
LBB0_4:
	strb	wzr, [sp, #27]
	mov	w8, #74
	str	w8, [sp, #20]
	adrp	x8, _ia@GOTPAGE
	ldr	x8, [x8, _ia@GOTPAGEOFF]
	str	x8, [sp, #8]
	mov	w8, #256
	str	w8, [sp, #4]
	b	LBB0_5
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	cbz	w8, LBB0_10
	b	LBB0_6
LBB0_6:                                 ;   in Loop: Header=BB0_5 Depth=1
	ldr	w8, [sp, #20]
	ldr	x9, [sp, #8]
	add	x10, x9, #4
	str	x10, [sp, #8]
	ldr	w9, [x9]
	subs	w8, w8, w9
	b.ne	LBB0_8
	b	LBB0_7
LBB0_7:
	mov	w8, #1
	strb	w8, [sp, #27]
	b	LBB0_10
LBB0_8:                                 ;   in Loop: Header=BB0_5 Depth=1
	b	LBB0_9
LBB0_9:                                 ;   in Loop: Header=BB0_5 Depth=1
	ldr	w8, [sp, #4]
	subs	w8, w8, #1
	str	w8, [sp, #4]
	b	LBB0_5
LBB0_10:
	mov	w0, #0
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.comm	_ia,1024,2                      ; @ia
.subsections_via_symbols
