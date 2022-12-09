	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	__loop_rowise                   ; -- Begin function _loop_rowise
	.p2align	2
__loop_rowise:                          ; @_loop_rowise
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	adrp	x10, _ia@GOTPAGE
	ldr	x10, [x10, _ia@GOTPAGEOFF]
	add	x9, x10, #16, lsl #12           ; =65536
	add	x8, x10, #512
	str	x10, [sp, #24]
	str	x9, [sp, #16]
	str	x8, [sp, #8]
	b	LBB0_1
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_2 Depth 2
	b	LBB0_2
LBB0_2:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x8, [sp, #24]
	ldr	x9, [sp, #8]
	subs	x8, x8, x9
	b.hs	LBB0_4
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_2 Depth=2
	ldr	x9, [sp, #24]
	mov	w8, #1
	str	w8, [sp, #4]                    ; 4-byte Folded Spill
	str	w8, [x9]
	ldr	x9, [sp, #24]
	str	w8, [x9, #4]
	ldr	x9, [sp, #24]
	str	w8, [x9, #8]
	ldr	x9, [sp, #24]
	str	w8, [x9, #12]
	ldr	x9, [sp, #24]
	str	w8, [x9, #16]
	ldr	x9, [sp, #24]
	str	w8, [x9, #20]
	ldr	x9, [sp, #24]
	str	w8, [x9, #24]
	ldr	x9, [sp, #24]
	str	w8, [x9, #28]
	ldr	x8, [sp, #24]
	add	x8, x8, #32
	str	x8, [sp, #24]
	b	LBB0_2
LBB0_4:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #24]
	add	x8, x8, #512
	str	x8, [sp, #8]
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #24]
	ldr	x9, [sp, #16]
	subs	x8, x8, x9
	b.ne	LBB0_1
	b	LBB0_6
LBB0_6:
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
