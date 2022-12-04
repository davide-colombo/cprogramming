	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	__order_sum_priced              ; -- Begin function _order_sum_priced
	.p2align	2
__order_sum_priced:                     ; @_order_sum_priced
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	movi	d0, #0000000000000000
	str	d0, [sp, #8]
	str	xzr, [sp]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp]
	ldr	x9, [sp, #16]
	subs	x8, x8, x9
	b.hs	LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #24]
	ldr	x9, [sp]
	lsl	x9, x9, #7
	ldr	d1, [x8, x9]
	ldr	d0, [sp, #8]
	fadd	d0, d0, d1
	str	d0, [sp, #8]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp]
	add	x8, x8, #1
	str	x8, [sp]
	b	LBB0_1
LBB0_4:
	ldr	d0, [sp, #8]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI1_0:
	.quad	0x408f400000000000              ; double 1000
lCPI1_1:
	.quad	0x41dfffffffc00000              ; double 2147483647
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #368
	stp	x28, x27, [sp, #336]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #352]            ; 16-byte Folded Spill
	add	x29, sp, #352
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	str	wzr, [sp, #124]
	str	w0, [sp, #120]
	str	x1, [sp, #112]
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	bl	_clock
	str	x0, [sp, #104]
	str	xzr, [sp, #88]
	str	xzr, [sp, #80]
	b	LBB1_1
LBB1_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_5 Depth 2
                                        ;     Child Loop BB1_11 Depth 2
	ldr	x8, [sp, #80]
	subs	x8, x8, #5
	b.hs	LBB1_16
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	mov	x0, #12800
	bl	_malloc
	str	x0, [sp, #88]
	ldr	x8, [sp, #88]
	cbnz	x8, LBB1_4
	b	LBB1_3
LBB1_3:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	ldr	x8, [sp, #80]
	mov	x9, sp
	str	x8, [x9]
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	bl	_fprintf
	mov	w8, #-1
	str	w8, [sp, #124]
	b	LBB1_21
LBB1_4:                                 ;   in Loop: Header=BB1_1 Depth=1
	str	wzr, [sp, #76]
	b	LBB1_5
LBB1_5:                                 ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #76]
	subs	w8, w8, #100
	b.ge	LBB1_8
	b	LBB1_6
LBB1_6:                                 ;   in Loop: Header=BB1_5 Depth=2
	bl	_rand
	scvtf	d0, w0
	adrp	x8, lCPI1_1@PAGE
	ldr	d1, [x8, lCPI1_1@PAGEOFF]
	fdiv	d0, d0, d1
	adrp	x8, lCPI1_0@PAGE
	ldr	d1, [x8, lCPI1_0@PAGEOFF]
	fmul	d0, d0, d1
	fmov	d1, #10.00000000
	fadd	d0, d0, d1
	ldr	x8, [sp, #88]
	ldrsw	x9, [sp, #76]
	lsl	x9, x9, #7
	str	d0, [x8, x9]
	b	LBB1_7
LBB1_7:                                 ;   in Loop: Header=BB1_5 Depth=2
	ldr	w8, [sp, #76]
	add	w8, w8, #1
	str	w8, [sp, #76]
	b	LBB1_5
LBB1_8:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [sp, #88]
	ldr	x9, [sp, #80]
	mov	x10, #40
	mul	x10, x9, x10
	add	x9, sp, #128
	add	x9, x9, x10
	str	x8, [x9, #8]
                                        ; kill: def $x8 killed $xzr
	str	xzr, [sp, #88]
	mov	x0, #12800
	bl	_malloc
	str	x0, [sp, #88]
	ldr	x8, [sp, #88]
	cbnz	x8, LBB1_10
	b	LBB1_9
LBB1_9:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	ldr	x8, [sp, #80]
	mov	x9, sp
	str	x8, [x9]
	adrp	x1, l_.str.1@PAGE
	add	x1, x1, l_.str.1@PAGEOFF
	bl	_fprintf
	mov	w8, #-1
	str	w8, [sp, #124]
	b	LBB1_21
LBB1_10:                                ;   in Loop: Header=BB1_1 Depth=1
	str	wzr, [sp, #72]
	b	LBB1_11
LBB1_11:                                ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #72]
	subs	w8, w8, #100
	b.ge	LBB1_14
	b	LBB1_12
LBB1_12:                                ;   in Loop: Header=BB1_11 Depth=2
	bl	_rand
	scvtf	d0, w0
	adrp	x8, lCPI1_1@PAGE
	ldr	d1, [x8, lCPI1_1@PAGEOFF]
	fdiv	d0, d0, d1
	adrp	x8, lCPI1_0@PAGE
	ldr	d1, [x8, lCPI1_0@PAGEOFF]
	fmul	d0, d0, d1
	fmov	d1, #10.00000000
	fadd	d0, d0, d1
	ldr	x8, [sp, #88]
	ldrsw	x9, [sp, #72]
	lsl	x9, x9, #7
	str	d0, [x8, x9]
	b	LBB1_13
LBB1_13:                                ;   in Loop: Header=BB1_11 Depth=2
	ldr	w8, [sp, #72]
	add	w8, w8, #1
	str	w8, [sp, #72]
	b	LBB1_11
LBB1_14:                                ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [sp, #88]
	ldr	x9, [sp, #80]
	mov	x11, #40
	mul	x12, x9, x11
	add	x9, sp, #128
	mov	x10, x9
	add	x10, x10, x12
	str	x8, [x10, #24]
	ldr	x8, [sp, #80]
	ldr	x10, [sp, #80]
	mul	x10, x10, x11
	str	x8, [x9, x10]
	ldr	x8, [sp, #80]
	mul	x10, x8, x11
	mov	x8, x9
	add	x10, x8, x10
	mov	x8, #100
	str	x8, [x10, #16]
	ldr	x10, [sp, #80]
	mul	x10, x10, x11
	add	x9, x9, x10
	str	x8, [x9, #32]
                                        ; kill: def $x8 killed $xzr
	str	xzr, [sp, #88]
	b	LBB1_15
LBB1_15:                                ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [sp, #80]
	add	x8, x8, #1
	str	x8, [sp, #80]
	b	LBB1_1
LBB1_16:
	bl	_clock
	str	x0, [sp, #96]
	ldr	x8, [sp, #96]
	ldr	x9, [sp, #104]
	subs	x8, x8, x9
	str	x8, [sp, #64]
	ldr	x8, [sp, #64]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	bl	_clock
	str	x0, [sp, #104]
	str	xzr, [sp, #56]
	b	LBB1_17
LBB1_17:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #56]
	subs	x8, x8, #5
	b.hs	LBB1_20
	b	LBB1_18
LBB1_18:                                ;   in Loop: Header=BB1_17 Depth=1
	ldr	x8, [sp, #56]
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #56]
	mov	x10, #40
	str	x10, [sp, #32]                  ; 8-byte Folded Spill
	mul	x11, x8, x10
	add	x8, sp, #128
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	mov	x9, x8
	add	x9, x9, x11
	ldr	x0, [x9, #8]
	ldr	x9, [sp, #56]
	mul	x9, x9, x10
	add	x8, x8, x9
	ldr	x1, [x8, #16]
	bl	__order_sum_priced
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	mov	x8, sp
	str	x9, [x8]
	str	d0, [x8, #8]
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	ldr	x10, [sp, #32]                  ; 8-byte Folded Reload
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #56]
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	ldr	x9, [sp, #56]
	mul	x11, x9, x10
	mov	x9, x8
	add	x9, x9, x11
	ldr	x0, [x9, #24]
	ldr	x9, [sp, #56]
	mul	x9, x9, x10
	add	x8, x8, x9
	ldr	x1, [x8, #32]
	bl	__order_sum_priced
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	mov	x8, sp
	str	x9, [x8]
	str	d0, [x8, #8]
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	b	LBB1_19
LBB1_19:                                ;   in Loop: Header=BB1_17 Depth=1
	ldr	x8, [sp, #56]
	add	x8, x8, #1
	str	x8, [sp, #56]
	b	LBB1_17
LBB1_20:
	bl	_clock
	str	x0, [sp, #96]
	ldr	x8, [sp, #96]
	ldr	x9, [sp, #104]
	subs	x8, x8, x9
	str	x8, [sp, #64]
	ldr	x8, [sp, #64]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	str	wzr, [sp, #124]
	b	LBB1_21
LBB1_21:
	ldr	w8, [sp, #124]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	ldur	x9, [x29, #-24]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	b.eq	LBB1_23
	b	LBB1_22
LBB1_22:
	bl	___stack_chk_fail
LBB1_23:
	ldr	w0, [sp, #20]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #352]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #336]            ; 16-byte Folded Reload
	add	sp, sp, #368
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"[paid orders] buyer_id = %lu\n"

l_.str.1:                               ; @.str.1
	.asciz	"[unpaid orders] buyer_id = %lu\n"

l_.str.2:                               ; @.str.2
	.asciz	"elapsed_clock = %lu\n"

l_.str.3:                               ; @.str.3
	.asciz	"[`buyer_id` = %ld]\ttotal paid = %.4f\n"

l_.str.4:                               ; @.str.4
	.asciz	"[`buyer_id` = %ld]\ttotal NOT paid = %.4f\n"

.subsections_via_symbols
