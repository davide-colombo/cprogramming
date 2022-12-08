	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	str	wzr, [sp, #60]
	str	w0, [sp, #56]
	str	x1, [sp, #48]
	adrp	x8, _ia@GOTPAGE
	ldr	x8, [x8, _ia@GOTPAGEOFF]
	str	x8, [sp, #40]
	str	wzr, [sp, #36]
	b	LBB0_1
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
	ldr	w8, [sp, #36]
	subs	w8, w8, #256
	b.ge	LBB0_8
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	str	wzr, [sp, #32]
	ldr	x8, [sp, #40]
	ldrsw	x9, [sp, #36]
	add	x8, x8, x9, lsl #2
	str	x8, [sp, #24]
	b	LBB0_3
LBB0_3:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #32]
	subs	w8, w8, #4
	b.ge	LBB0_6
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_3 Depth=2
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #32]
	add	w8, w8, w9
	ldr	x9, [sp, #24]
	ldrsw	x10, [sp, #32]
	str	w8, [x9, x10, lsl #2]
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_3 Depth=2
	ldr	w8, [sp, #32]
	add	w8, w8, #1
	str	w8, [sp, #32]
	b	LBB0_3
LBB0_6:                                 ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_7
LBB0_7:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #36]
	add	w8, w8, #4
	str	w8, [sp, #36]
	b	LBB0_1
LBB0_8:
	mov	w8, #200
	str	w8, [sp, #20]
	mov	w8, #256
	str	w8, [sp, #16]
	b	LBB0_9
LBB0_9:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #16]
	subs	w8, w8, #1
	str	w8, [sp, #16]
	mov	w9, #0
	str	w9, [sp, #12]                   ; 4-byte Folded Spill
	tbnz	w8, #31, LBB0_11
	b	LBB0_10
LBB0_10:                                ;   in Loop: Header=BB0_9 Depth=1
	ldr	x8, [sp, #40]
	ldrsw	x9, [sp, #16]
	ldr	w8, [x8, x9, lsl #2]
	ldr	w9, [sp, #20]
	eor	w8, w8, w9
	subs	w8, w8, #0
	cset	w8, ne
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	b	LBB0_11
LBB0_11:                                ;   in Loop: Header=BB0_9 Depth=1
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	tbz	w8, #0, LBB0_13
	b	LBB0_12
LBB0_12:                                ;   in Loop: Header=BB0_9 Depth=1
	b	LBB0_9
LBB0_13:
	mov	w0, #0
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.comm	_ia,1024,2                      ; @ia
.subsections_via_symbols
