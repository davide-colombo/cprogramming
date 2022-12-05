	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	__order_sum_priced              ; -- Begin function _order_sum_priced
	.p2align	2
__order_sum_priced:                     ; @_order_sum_priced
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x0, [sp, #40]
	str	x1, [sp, #32]
	movi	d0, #0000000000000000
	str	d0, [sp, #24]
	str	xzr, [sp, #8]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	ldr	x9, [sp, #32]
	subs	x8, x8, x9
	b.hs	LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #40]
	ldr	x9, [sp, #8]
	ldr	x8, [x8, x9, lsl #3]
	str	x8, [sp, #16]
	ldr	d1, [sp, #16]
	ldr	d0, [sp, #24]
	fadd	d0, d0, d1
	str	d0, [sp, #24]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]
	add	x8, x8, #1
	str	x8, [sp, #8]
	b	LBB0_1
LBB0_4:
	ldr	d0, [sp, #24]
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__order_aligned_alloc_array_of_orders ; -- Begin function _order_aligned_alloc_array_of_orders
	.p2align	2
__order_aligned_alloc_array_of_orders:  ; @_order_aligned_alloc_array_of_orders
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x8, [x29, #-16]
	subs	x8, x8, #0
	cset	w8, eq
	tbz	w8, #0, LBB1_2
	b	LBB1_1
LBB1_1:
	adrp	x0, l___func__._order_aligned_alloc_array_of_orders@PAGE
	add	x0, x0, l___func__._order_aligned_alloc_array_of_orders@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #188
	adrp	x3, l_.str.1@PAGE
	add	x3, x3, l_.str.1@PAGEOFF
	bl	___assert_rtn
LBB1_2:
	b	LBB1_3
LBB1_3:
	ldur	x9, [x29, #-16]
	mov	x8, #8
	mul	x8, x8, x9
	str	x8, [sp, #24]
	ldr	x8, [sp, #24]
	and	x8, x8, #0x7f
	cbz	x8, LBB1_5
	b	LBB1_4
LBB1_4:
	ldr	x8, [sp, #24]
	add	x8, x8, #127
	and	x8, x8, #0xffffffffffffff80
	str	x8, [sp, #24]
	b	LBB1_5
LBB1_5:
	ldr	x8, [sp, #24]
	ands	x8, x8, #0x7f
	cset	w8, ne
	tbz	w8, #0, LBB1_7
	b	LBB1_6
LBB1_6:
	adrp	x0, l___func__._order_aligned_alloc_array_of_orders@PAGE
	add	x0, x0, l___func__._order_aligned_alloc_array_of_orders@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #203
	adrp	x3, l_.str.2@PAGE
	add	x3, x3, l_.str.2@PAGEOFF
	bl	___assert_rtn
LBB1_7:
	b	LBB1_8
LBB1_8:
	ldr	x1, [sp, #24]
	mov	x0, #128
	bl	_aligned_alloc
	ldur	x8, [x29, #-8]
	str	x0, [x8]
	ldur	x8, [x29, #-8]
	ldr	x8, [x8]
	cbnz	x8, LBB1_10
	b	LBB1_9
LBB1_9:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	ldr	x8, [sp, #24]
	mov	x9, sp
	mov	x10, #128
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x1, l_.str.3@PAGE
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fprintf
	b	LBB1_10
LBB1_10:
	ldur	x8, [x29, #-8]
	ldr	x8, [x8]
	subs	x8, x8, #0
	cset	w8, eq
	tbz	w8, #0, LBB1_12
	b	LBB1_11
LBB1_11:
	adrp	x0, l___func__._order_aligned_alloc_array_of_orders@PAGE
	add	x0, x0, l___func__._order_aligned_alloc_array_of_orders@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #214
	adrp	x3, l_.str.4@PAGE
	add	x3, x3, l_.str.4@PAGEOFF
	bl	___assert_rtn
LBB1_12:
	b	LBB1_13
LBB1_13:
	ldur	x0, [x29, #-16]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI2_0:
	.quad	0x408f400000000000              ; double 1000
lCPI2_1:
	.quad	0x41dfffffffc00000              ; double 2147483647
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, _bo@GOTPAGE
	ldr	x8, [x8, _bo@GOTPAGEOFF]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	adrp	x8, _optr@GOTPAGE
	ldr	x8, [x8, _optr@GOTPAGEOFF]
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	bl	_clock
	stur	x0, [x29, #-24]
	stur	xzr, [x29, #-40]
	b	LBB2_1
LBB2_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_3 Depth 2
                                        ;     Child Loop BB2_7 Depth 2
	ldur	x8, [x29, #-40]
	subs	x8, x8, #5
	b.hs	LBB2_12
	b	LBB2_2
LBB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x10, [x29, #-40]
	mov	x11, #24
	mul	x11, x10, x11
	adrp	x10, _orders_per_buyer@GOTPAGE
	ldr	x10, [x10, _orders_per_buyer@GOTPAGEOFF]
	add	x10, x10, x11
	str	x10, [x9]
	ldur	x10, [x29, #-40]
	ldr	x11, [x9]
	str	x10, [x11]
	ldr	x9, [x9]
	add	x9, x9, #8
	str	x9, [x8]
	ldr	x0, [x8]
	mov	x1, #100
	bl	__order_aligned_alloc_array_of_orders
	stur	wzr, [x29, #-44]
	b	LBB2_3
LBB2_3:                                 ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-44]
	subs	w8, w8, #100
	b.ge	LBB2_6
	b	LBB2_4
LBB2_4:                                 ;   in Loop: Header=BB2_3 Depth=2
	bl	_rand
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	scvtf	d0, w0
	adrp	x9, lCPI2_1@PAGE
	ldr	d1, [x9, lCPI2_1@PAGEOFF]
	fdiv	d0, d0, d1
	adrp	x9, lCPI2_0@PAGE
	ldr	d1, [x9, lCPI2_0@PAGEOFF]
	fmul	d0, d0, d1
	fmov	d1, #10.00000000
	fadd	d0, d0, d1
	ldr	x8, [x8]
	ldr	x8, [x8]
	ldursw	x9, [x29, #-44]
	str	d0, [x8, x9, lsl #3]
	b	LBB2_5
LBB2_5:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldur	w8, [x29, #-44]
	add	w8, w8, #1
	stur	w8, [x29, #-44]
	b	LBB2_3
LBB2_6:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x9]
	add	x9, x9, #16
	str	x9, [x8]
	ldr	x0, [x8]
	mov	x1, #100
	bl	__order_aligned_alloc_array_of_orders
	str	wzr, [sp, #48]
	b	LBB2_7
LBB2_7:                                 ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #48]
	subs	w8, w8, #100
	b.ge	LBB2_10
	b	LBB2_8
LBB2_8:                                 ;   in Loop: Header=BB2_7 Depth=2
	bl	_rand
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	scvtf	d0, w0
	adrp	x9, lCPI2_1@PAGE
	ldr	d1, [x9, lCPI2_1@PAGEOFF]
	fdiv	d0, d0, d1
	adrp	x9, lCPI2_0@PAGE
	ldr	d1, [x9, lCPI2_0@PAGEOFF]
	fmul	d0, d0, d1
	fmov	d1, #10.00000000
	fadd	d0, d0, d1
	ldr	x8, [x8]
	ldr	x8, [x8]
	ldrsw	x9, [sp, #48]
	str	d0, [x8, x9, lsl #3]
	b	LBB2_9
LBB2_9:                                 ;   in Loop: Header=BB2_7 Depth=2
	ldr	w8, [sp, #48]
	add	w8, w8, #1
	str	w8, [sp, #48]
	b	LBB2_7
LBB2_10:                                ;   in Loop: Header=BB2_1 Depth=1
	b	LBB2_11
LBB2_11:                                ;   in Loop: Header=BB2_1 Depth=1
	ldur	x8, [x29, #-40]
	add	x8, x8, #1
	stur	x8, [x29, #-40]
	b	LBB2_1
LBB2_12:
	bl	_clock
	stur	x0, [x29, #-32]
	ldur	x8, [x29, #-32]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	str	x8, [sp, #40]
	ldr	x8, [sp, #40]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	bl	_clock
	stur	x0, [x29, #-24]
	str	xzr, [sp, #32]
	b	LBB2_13
LBB2_13:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #32]
	subs	x8, x8, #5
	b.hs	LBB2_16
	b	LBB2_14
LBB2_14:                                ;   in Loop: Header=BB2_13 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #32]
	mov	x10, #24
	mul	x10, x9, x10
	adrp	x9, _orders_per_buyer@GOTPAGE
	ldr	x9, [x9, _orders_per_buyer@GOTPAGEOFF]
	add	x9, x9, x10
	str	x9, [x8]
	ldr	x8, [x8]
	ldr	x0, [x8, #8]
	mov	x1, #100
	str	x1, [sp, #8]                    ; 8-byte Folded Spill
	bl	__order_sum_priced
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x8]
	ldr	x0, [x8, #16]
	bl	__order_sum_priced
	b	LBB2_15
LBB2_15:                                ;   in Loop: Header=BB2_13 Depth=1
	ldr	x8, [sp, #32]
	add	x8, x8, #1
	str	x8, [sp, #32]
	b	LBB2_13
LBB2_16:
	bl	_clock
	stur	x0, [x29, #-32]
	ldur	x8, [x29, #-32]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	str	x8, [sp, #40]
	ldr	x8, [sp, #40]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l___func__._order_aligned_alloc_array_of_orders: ; @__func__._order_aligned_alloc_array_of_orders
	.asciz	"_order_aligned_alloc_array_of_orders"

l_.str:                                 ; @.str
	.asciz	"order.c"

l_.str.1:                               ; @.str.1
	.asciz	"nel != 0"

l_.str.2:                               ; @.str.2
	.asciz	"FAST_X_MOD_CACHELINE(tot) == 0"

l_.str.3:                               ; @.str.3
	.asciz	"aligned_alloc(%d, %zu) failed"

l_.str.4:                               ; @.str.4
	.asciz	"*orders != NULL"

	.comm	_orders_per_buyer,120,7         ; @orders_per_buyer
	.comm	_bo,8,3                         ; @bo
	.comm	_optr,8,3                       ; @optr
l_.str.5:                               ; @.str.5
	.asciz	"elapsed_clock = %lu\n"

.subsections_via_symbols
