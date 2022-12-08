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
	adrp	x8, _ia@GOTPAGE
	ldr	x8, [x8, _ia@GOTPAGEOFF]
	str	x8, [sp, #24]
	mov	w8, #256
	str	w8, [sp, #20]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #20]
	subs	w8, w8, #1
	str	w8, [sp, #20]
	tbnz	w8, #31, LBB0_3
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #20]
	ldr	x9, [sp, #24]
	ldrsw	x10, [sp, #20]
	str	w8, [x9, x10, lsl #2]
	b	LBB0_1
LBB0_3:
	mov	w8, #200
	str	w8, [sp, #16]
	mov	w8, #256
	str	w8, [sp, #20]
	b	LBB0_4
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #20]
	subs	w8, w8, #1
	str	w8, [sp, #20]
	mov	w9, #0
	str	w9, [sp, #12]                   ; 4-byte Folded Spill
	tbnz	w8, #31, LBB0_6
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_4 Depth=1
	ldr	x8, [sp, #24]
	ldrsw	x9, [sp, #20]
	ldr	w8, [x8, x9, lsl #2]
	ldr	w9, [sp, #16]
	eor	w8, w8, w9
	subs	w8, w8, #0
	cset	w8, ne
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	b	LBB0_6
LBB0_6:                                 ;   in Loop: Header=BB0_4 Depth=1
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	tbz	w8, #0, LBB0_8
	b	LBB0_7
LBB0_7:                                 ;   in Loop: Header=BB0_4 Depth=1
	b	LBB0_4
LBB0_8:
	mov	w0, #0
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.comm	_ia,1024,2                      ; @ia
.subsections_via_symbols
