	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	adrp	x9, _ia@GOTPAGE
	ldr	x9, [x9, _ia@GOTPAGEOFF]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x8, x9, #1024
	str	wzr, [sp, #44]
	str	w0, [sp, #40]
	str	x1, [sp, #32]
	str	x9, [sp, #24]
	str	x8, [sp, #16]
	str	wzr, [sp, #12]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #24]
	ldr	x9, [sp, #16]
	subs	x8, x8, x9
	b.hs	LBB0_3
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #12]
	add	w9, w8, #1
	str	w9, [sp, #12]
	ldr	x9, [sp, #24]
	add	x10, x9, #4
	str	x10, [sp, #24]
	str	w8, [x9]
	b	LBB0_1
LBB0_3:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	str	x8, [sp, #24]
	mov	w8, #74
	str	w8, [sp, #8]
	b	LBB0_4
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #24]
	ldr	w8, [x8]
	ldr	w9, [sp, #8]
	eor	w8, w8, w9
	cbz	w8, LBB0_6
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #24]
	add	x8, x8, #4
	str	x8, [sp, #24]
	b	LBB0_4
LBB0_6:
	mov	w0, #0
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.comm	_ia,1024,2                      ; @ia
.subsections_via_symbols
