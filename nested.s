	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	__loop_rowise_optim             ; -- Begin function _loop_rowise_optim
	.p2align	2
__loop_rowise_optim:                    ; @_loop_rowise_optim
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	str	x0, [sp, #104]
	mov	w8, #625
	str	w8, [sp, #100]
	str	wzr, [sp, #96]
	mov	w8, #2500
	str	w8, [sp, #92]
	str	wzr, [sp, #88]
	str	wzr, [sp, #84]
	b	LBB0_1
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_2 Depth 2
                                        ;       Child Loop BB0_3 Depth 3
                                        ;         Child Loop BB0_4 Depth 4
                                        ;       Child Loop BB0_10 Depth 3
	b	LBB0_2
LBB0_2:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_3 Depth 3
                                        ;         Child Loop BB0_4 Depth 4
                                        ;       Child Loop BB0_10 Depth 3
	ldr	x8, [sp, #104]
	ldrsw	x9, [sp, #84]
	mov	x10, #40000
	mul	x9, x9, x10
	add	x8, x8, x9
	str	x8, [sp, #72]
	ldr	x8, [sp, #104]
	ldrsw	x9, [sp, #84]
	mul	x9, x9, x10
	add	x8, x8, x9
	add	x8, x8, #16
	str	x8, [sp, #64]
	ldr	x8, [sp, #104]
	ldrsw	x9, [sp, #84]
	mul	x9, x9, x10
	add	x8, x8, x9
	add	x8, x8, #32
	str	x8, [sp, #56]
	ldr	x8, [sp, #104]
	ldrsw	x9, [sp, #84]
	mul	x9, x9, x10
	add	x8, x8, x9
	add	x8, x8, #48
	str	x8, [sp, #48]
	ldr	x10, [sp, #104]
	ldr	w8, [sp, #84]
	add	w8, w8, #2
	mov	w9, #40000
	smaddl	x8, w8, w9, x10
	str	x8, [sp, #40]
	ldr	x10, [sp, #104]
	ldr	w8, [sp, #84]
	add	w8, w8, #2
	mov	w9, #40000
	smaddl	x8, w8, w9, x10
	add	x8, x8, #16
	str	x8, [sp, #32]
	ldr	x10, [sp, #104]
	ldr	w8, [sp, #84]
	add	w8, w8, #2
	mov	w9, #40000
	smaddl	x8, w8, w9, x10
	add	x8, x8, #32
	str	x8, [sp, #24]
	ldr	x10, [sp, #104]
	ldr	w8, [sp, #84]
	add	w8, w8, #2
	mov	w9, #40000
	smaddl	x8, w8, w9, x10
	add	x8, x8, #48
	str	x8, [sp, #16]
	ldr	w8, [sp, #100]
	str	w8, [sp, #12]
	str	wzr, [sp, #8]
	b	LBB0_3
LBB0_3:                                 ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_2 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB0_4 Depth 4
	b	LBB0_4
LBB0_4:                                 ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_2 Depth=2
                                        ;       Parent Loop BB0_3 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ldr	x9, [sp, #72]
	ldrsw	x10, [sp, #8]
	mov	w8, #1
	str	w8, [sp, #4]                    ; 4-byte Folded Spill
	str	w8, [x9, x10, lsl #2]
	ldr	x9, [sp, #64]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	ldr	x9, [sp, #56]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	ldr	x9, [sp, #48]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	ldr	x9, [sp, #40]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	ldr	x9, [sp, #32]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	ldr	x9, [sp, #24]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	ldr	x9, [sp, #16]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_4 Depth=4
	ldr	w8, [sp, #8]
	and	w8, w8, #0x3
	cbnz	w8, LBB0_4
	b	LBB0_6
LBB0_6:                                 ;   in Loop: Header=BB0_3 Depth=3
	ldr	w8, [sp, #8]
	add	w8, w8, #12
	str	w8, [sp, #8]
	ldr	w8, [sp, #12]
	subs	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB0_7
LBB0_7:                                 ;   in Loop: Header=BB0_3 Depth=3
	ldr	w8, [sp, #12]
	cbnz	w8, LBB0_3
	b	LBB0_8
LBB0_8:                                 ;   in Loop: Header=BB0_2 Depth=2
	ldr	w8, [sp, #96]
	cbz	w8, LBB0_13
	b	LBB0_9
LBB0_9:                                 ;   in Loop: Header=BB0_2 Depth=2
	ldr	w8, [sp, #96]
	str	w8, [sp, #12]
	b	LBB0_10
LBB0_10:                                ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	x9, [sp, #72]
	ldrsw	x10, [sp, #8]
	mov	w8, #1
	str	w8, [x9, x10, lsl #2]
	ldr	x9, [sp, #64]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	ldr	x9, [sp, #40]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	ldr	x9, [sp, #32]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	ldr	w8, [sp, #12]
	subs	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB0_11
LBB0_11:                                ;   in Loop: Header=BB0_10 Depth=3
	ldr	w8, [sp, #12]
	cbnz	w8, LBB0_10
	b	LBB0_12
LBB0_12:                                ;   in Loop: Header=BB0_2 Depth=2
	b	LBB0_13
LBB0_13:                                ;   in Loop: Header=BB0_2 Depth=2
	ldr	w8, [sp, #84]
	add	w8, w8, #1
	str	w8, [sp, #84]
	b	LBB0_14
LBB0_14:                                ;   in Loop: Header=BB0_2 Depth=2
	ldr	w8, [sp, #84]
	tbnz	w8, #0, LBB0_2
	b	LBB0_15
LBB0_15:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #84]
	add	w8, w8, #2
	str	w8, [sp, #84]
	ldr	w8, [sp, #92]
	subs	w8, w8, #1
	str	w8, [sp, #92]
	b	LBB0_16
LBB0_16:                                ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #92]
	cbnz	w8, LBB0_1
	b	LBB0_17
LBB0_17:
	add	sp, sp, #112
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
	mov	w9, #10000
	subs	w8, w8, w9
	b.ge	LBB1_8
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	str	wzr, [sp, #12]
	b	LBB1_3
LBB1_3:                                 ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #12]
	mov	w9, #10000
	subs	w8, w8, w9
	b.ge	LBB1_6
	b	LBB1_4
LBB1_4:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldrsw	x8, [sp, #12]
	mov	x9, #40000
	mul	x9, x8, x9
	adrp	x8, _ia@GOTPAGE
	ldr	x8, [x8, _ia@GOTPAGEOFF]
	add	x9, x8, x9
	ldrsw	x10, [sp, #8]
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
	.globl	__loop_rowise_baseline          ; -- Begin function _loop_rowise_baseline
	.p2align	2
__loop_rowise_baseline:                 ; @_loop_rowise_baseline
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	wzr, [sp, #8]
	b	LBB2_1
LBB2_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_3 Depth 2
	ldr	w8, [sp, #8]
	mov	w9, #10000
	subs	w8, w8, w9
	b.ge	LBB2_8
	b	LBB2_2
LBB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
	str	wzr, [sp, #12]
	b	LBB2_3
LBB2_3:                                 ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #12]
	mov	w9, #10000
	subs	w8, w8, w9
	b.ge	LBB2_6
	b	LBB2_4
LBB2_4:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldrsw	x8, [sp, #8]
	mov	x9, #40000
	mul	x9, x8, x9
	adrp	x8, _ia@GOTPAGE
	ldr	x8, [x8, _ia@GOTPAGEOFF]
	add	x9, x8, x9
	ldrsw	x10, [sp, #12]
	mov	w8, #1
	str	w8, [x9, x10, lsl #2]
	b	LBB2_5
LBB2_5:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB2_3
LBB2_6:                                 ;   in Loop: Header=BB2_1 Depth=1
	b	LBB2_7
LBB2_7:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB2_1
LBB2_8:
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI3_0:
	.quad	0x412e848000000000              ; double 1.0E+6
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #0
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	bl	_clock
	stur	x0, [x29, #-24]
	adrp	x0, _ia@GOTPAGE
	ldr	x0, [x0, _ia@GOTPAGEOFF]
	bl	__loop_rowise_optim
	bl	_clock
	str	x0, [sp, #32]
	ldr	x8, [sp, #32]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	ucvtf	d0, x8
	adrp	x8, lCPI3_0@PAGE
	ldr	d1, [x8, lCPI3_0@PAGEOFF]
	fdiv	d0, d0, d1
	str	d0, [sp, #24]
	ldr	d0, [sp, #24]
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #20]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.comm	_ia,400000000,2                 ; @ia
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Elapsed = %.20lf\n"

.subsections_via_symbols
