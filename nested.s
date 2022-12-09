	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	__loop_rowise                   ; -- Begin function _loop_rowise
	.p2align	2
__loop_rowise:                          ; @_loop_rowise
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	wzr, [sp, #20]
	b	LBB0_1
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
                                        ;       Child Loop BB0_5 Depth 3
                                        ;         Child Loop BB0_7 Depth 4
	ldr	w8, [sp, #20]
	subs	w8, w8, #128
	b.ge	LBB0_16
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	str	wzr, [sp, #16]
	b	LBB0_3
LBB0_3:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_5 Depth 3
                                        ;         Child Loop BB0_7 Depth 4
	ldr	w8, [sp, #16]
	subs	w8, w8, #128
	b.ge	LBB0_14
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_3 Depth=2
	str	wzr, [sp, #12]
	ldrsw	x9, [sp, #20]
	adrp	x8, _ia@GOTPAGE
	ldr	x8, [x8, _ia@GOTPAGEOFF]
	add	x8, x8, x9, lsl #9
	ldrsw	x9, [sp, #16]
	add	x8, x8, x9, lsl #2
	str	x8, [sp, #24]
	b	LBB0_5
LBB0_5:                                 ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_3 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_7 Depth 4
	ldrsw	x8, [sp, #12]
	subs	x8, x8, #32
	b.hs	LBB0_12
	b	LBB0_6
LBB0_6:                                 ;   in Loop: Header=BB0_5 Depth=3
	str	wzr, [sp, #8]
	b	LBB0_7
LBB0_7:                                 ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_3 Depth=2
                                        ;       Parent Loop BB0_5 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldrsw	x8, [sp, #8]
	subs	x8, x8, #32
	b.hs	LBB0_10
	b	LBB0_8
LBB0_8:                                 ;   in Loop: Header=BB0_7 Depth=4
	ldr	x9, [sp, #24]
	ldrsw	x10, [sp, #8]
	mov	w8, #1
	str	w8, [x9, x10, lsl #2]
	b	LBB0_9
LBB0_9:                                 ;   in Loop: Header=BB0_7 Depth=4
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB0_7
LBB0_10:                                ;   in Loop: Header=BB0_5 Depth=3
	b	LBB0_11
LBB0_11:                                ;   in Loop: Header=BB0_5 Depth=3
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	ldr	x8, [sp, #24]
	add	x8, x8, #512
	str	x8, [sp, #24]
	b	LBB0_5
LBB0_12:                                ;   in Loop: Header=BB0_3 Depth=2
	b	LBB0_13
LBB0_13:                                ;   in Loop: Header=BB0_3 Depth=2
	ldrsw	x8, [sp, #16]
	add	x8, x8, #32
                                        ; kill: def $w8 killed $w8 killed $x8
	str	w8, [sp, #16]
	b	LBB0_3
LBB0_14:                                ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_15
LBB0_15:                                ;   in Loop: Header=BB0_1 Depth=1
	ldrsw	x8, [sp, #20]
	add	x8, x8, #32
                                        ; kill: def $w8 killed $w8 killed $x8
	str	w8, [sp, #20]
	b	LBB0_1
LBB0_16:
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__loop_colwise                  ; -- Begin function _loop_colwise
	.p2align	2
__loop_colwise:                         ; @_loop_colwise
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	wzr, [sp, #8]
	b	LBB1_1
LBB1_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_3 Depth 2
	ldr	w8, [sp, #8]
	subs	w8, w8, #128
	b.ge	LBB1_8
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	str	wzr, [sp, #12]
	b	LBB1_3
LBB1_3:                                 ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #12]
	subs	w8, w8, #128
	b.ge	LBB1_6
	b	LBB1_4
LBB1_4:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldrsw	x9, [sp, #8]
	adrp	x8, _ia@GOTPAGE
	ldr	x8, [x8, _ia@GOTPAGEOFF]
	add	x9, x8, x9, lsl #9
	ldrsw	x10, [sp, #12]
	mov	w8, #1
	str	w8, [x9, x10, lsl #2]
	b	LBB1_5
LBB1_5:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB1_3
LBB1_6:                                 ;   in Loop: Header=BB1_1 Depth=1
	b	LBB1_7
LBB1_7:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB1_1
LBB1_8:
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #0
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	str	x1, [sp, #16]
	bl	__loop_rowise
	ldr	w0, [sp, #12]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.comm	_ia,65536,2                     ; @ia
.subsections_via_symbols
