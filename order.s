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
	movi	d0, #0000000000000000
	str	d0, [sp, #16]
	ldr	x8, [sp, #24]
	ldr	x8, [x8]
	str	x8, [sp, #8]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	ldr	x9, [sp, #24]
	ldr	x9, [x9, #8]
	subs	x8, x8, x9
	b.hs	LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]
	ldr	d1, [x8]
	ldr	d0, [sp, #16]
	fadd	d0, d0, d1
	str	d0, [sp, #16]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #8]
	add	x8, x8, #8
	str	x8, [sp, #8]
	b	LBB0_1
LBB0_4:
	ldr	d0, [sp, #16]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function _order_aligned_alloc_array_of_orders
lCPI1_0:
	.quad	0x408f400000000000              ; double 1000
lCPI1_1:
	.quad	0x41dfffffffc00000              ; double 2147483647
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__order_aligned_alloc_array_of_orders
	.p2align	2
__order_aligned_alloc_array_of_orders:  ; @_order_aligned_alloc_array_of_orders
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
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
	mov	w2, #208
	adrp	x3, l_.str.1@PAGE
	add	x3, x3, l_.str.1@PAGEOFF
	bl	___assert_rtn
LBB1_2:
	b	LBB1_3
LBB1_3:
	ldur	x8, [x29, #-8]
	ldr	x8, [x8]
	subs	x8, x8, #0
	cset	w8, ne
	tbz	w8, #0, LBB1_5
	b	LBB1_4
LBB1_4:
	adrp	x0, l___func__._order_aligned_alloc_array_of_orders@PAGE
	add	x0, x0, l___func__._order_aligned_alloc_array_of_orders@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #209
	adrp	x3, l_.str.2@PAGE
	add	x3, x3, l_.str.2@PAGEOFF
	bl	___assert_rtn
LBB1_5:
	b	LBB1_6
LBB1_6:
	mov	x0, #16
	bl	_malloc
	ldur	x8, [x29, #-8]
	str	x0, [x8]
	ldur	x8, [x29, #-8]
	ldr	x8, [x8]
	cbnz	x8, LBB1_8
	b	LBB1_7
LBB1_7:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	adrp	x1, l_.str.3@PAGE
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fprintf
	b	LBB1_8
LBB1_8:
	ldur	x8, [x29, #-8]
	ldr	x8, [x8]
	subs	x8, x8, #0
	cset	w8, eq
	tbz	w8, #0, LBB1_10
	b	LBB1_9
LBB1_9:
	adrp	x0, l___func__._order_aligned_alloc_array_of_orders@PAGE
	add	x0, x0, l___func__._order_aligned_alloc_array_of_orders@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #219
	adrp	x3, l_.str.4@PAGE
	add	x3, x3, l_.str.4@PAGEOFF
	bl	___assert_rtn
LBB1_10:
	b	LBB1_11
LBB1_11:
	ldur	x8, [x29, #-8]
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	ldur	x9, [x29, #-16]
	mov	x8, #8
	mul	x8, x8, x9
	str	x8, [sp, #32]
	ldr	x8, [sp, #32]
	and	x8, x8, #0x7f
	cbz	x8, LBB1_13
	b	LBB1_12
LBB1_12:
	ldr	x8, [sp, #32]
	add	x8, x8, #127
	and	x8, x8, #0xffffffffffffff80
	str	x8, [sp, #32]
	b	LBB1_13
LBB1_13:
	ldr	x8, [sp, #32]
	ands	x8, x8, #0x7f
	cset	w8, ne
	tbz	w8, #0, LBB1_15
	b	LBB1_14
LBB1_14:
	adrp	x0, l___func__._order_aligned_alloc_array_of_orders@PAGE
	add	x0, x0, l___func__._order_aligned_alloc_array_of_orders@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #236
	adrp	x3, l_.str.5@PAGE
	add	x3, x3, l_.str.5@PAGEOFF
	bl	___assert_rtn
LBB1_15:
	b	LBB1_16
LBB1_16:
	ldr	x1, [sp, #32]
	mov	x0, #128
	bl	_aligned_alloc
	ldur	x8, [x29, #-24]
	str	x0, [x8]
	ldur	x8, [x29, #-24]
	ldr	x8, [x8]
	cbnz	x8, LBB1_18
	b	LBB1_17
LBB1_17:
	ldur	x8, [x29, #-8]
	ldr	x0, [x8]
	bl	_free
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	ldr	x8, [sp, #32]
	mov	x9, sp
	mov	x10, #128
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x1, l_.str.6@PAGE
	add	x1, x1, l_.str.6@PAGEOFF
	bl	_fprintf
	b	LBB1_18
LBB1_18:
	ldur	x8, [x29, #-24]
	ldr	x8, [x8]
	subs	x8, x8, #0
	cset	w8, eq
	tbz	w8, #0, LBB1_20
	b	LBB1_19
LBB1_19:
	adrp	x0, l___func__._order_aligned_alloc_array_of_orders@PAGE
	add	x0, x0, l___func__._order_aligned_alloc_array_of_orders@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #248
	adrp	x3, l_.str.7@PAGE
	add	x3, x3, l_.str.7@PAGEOFF
	bl	___assert_rtn
LBB1_20:
	b	LBB1_21
LBB1_21:
	ldur	x8, [x29, #-24]
	ldr	x8, [x8]
	ldur	x9, [x29, #-16]
	add	x8, x8, x9, lsl #3
	ldur	x9, [x29, #-24]
	str	x8, [x9, #8]
	ldur	x8, [x29, #-24]
	ldr	x8, [x8]
	str	x8, [sp, #24]
	b	LBB1_22
LBB1_22:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #24]
	ldur	x9, [x29, #-24]
	ldr	x9, [x9, #8]
	subs	x8, x8, x9
	b.hs	LBB1_25
	b	LBB1_23
LBB1_23:                                ;   in Loop: Header=BB1_22 Depth=1
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
	ldr	x8, [sp, #24]
	str	d0, [x8]
	b	LBB1_24
LBB1_24:                                ;   in Loop: Header=BB1_22 Depth=1
	ldr	x8, [sp, #24]
	add	x8, x8, #8
	str	x8, [sp, #24]
	b	LBB1_22
LBB1_25:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
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
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	bl	_clock
	stur	x0, [x29, #-24]
	adrp	x8, _orders_per_buyer@GOTPAGE
	ldr	x8, [x8, _orders_per_buyer@GOTPAGEOFF]
	str	x8, [sp, #40]
	b	LBB2_1
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #40]
	adrp	x9, _bo_end@PAGE
	ldr	x9, [x9, _bo_end@PAGEOFF]
	subs	x8, x8, x9
	b.hs	LBB2_4
	b	LBB2_2
LBB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
	adrp	x9, _id@PAGE
	ldr	x8, [x9, _id@PAGEOFF]
	add	x8, x8, #1
	str	x8, [x9, _id@PAGEOFF]
	ldr	x9, [sp, #40]
	str	x8, [x9]
	ldr	x8, [sp, #40]
	add	x8, x8, #8
	stur	x8, [x29, #-40]
	ldr	x8, [sp, #40]
	add	x8, x8, #16
	str	x8, [sp, #48]
	ldur	x0, [x29, #-40]
	mov	x1, #5
	str	x1, [sp, #16]                   ; 8-byte Folded Spill
	bl	__order_aligned_alloc_array_of_orders
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #48]
	bl	__order_aligned_alloc_array_of_orders
	b	LBB2_3
LBB2_3:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	x8, [sp, #40]
	add	x8, x8, #32
	str	x8, [sp, #40]
	b	LBB2_1
LBB2_4:
	bl	_clock
	stur	x0, [x29, #-32]
	ldur	x8, [x29, #-32]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	str	x8, [sp, #32]
	ldr	x8, [sp, #32]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	bl	_clock
	stur	x0, [x29, #-24]
	adrp	x8, _orders_per_buyer@GOTPAGE
	ldr	x8, [x8, _orders_per_buyer@GOTPAGEOFF]
	str	x8, [sp, #24]
	b	LBB2_5
LBB2_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #24]
	adrp	x9, _bo_end@PAGE
	ldr	x9, [x9, _bo_end@PAGEOFF]
	subs	x8, x8, x9
	b.hs	LBB2_8
	b	LBB2_6
LBB2_6:                                 ;   in Loop: Header=BB2_5 Depth=1
	ldr	x8, [sp, #24]
	ldr	x0, [x8, #8]
	bl	__order_sum_priced
	ldr	x8, [sp, #24]
	ldr	x0, [x8, #16]
	bl	__order_sum_priced
	b	LBB2_7
LBB2_7:                                 ;   in Loop: Header=BB2_5 Depth=1
	ldr	x8, [sp, #24]
	add	x8, x8, #32
	str	x8, [sp, #24]
	b	LBB2_5
LBB2_8:
	bl	_clock
	stur	x0, [x29, #-32]
	ldur	x8, [x29, #-32]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	str	x8, [sp, #32]
	ldr	x8, [sp, #32]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
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
	.asciz	"*optr == NULL"

l_.str.3:                               ; @.str.3
	.asciz	"[ir orders] malloc failed\n"

l_.str.4:                               ; @.str.4
	.asciz	"*optr != NULL"

l_.str.5:                               ; @.str.5
	.asciz	"FAST_X_MOD_CACHELINE(tot) == 0"

l_.str.6:                               ; @.str.6
	.asciz	"aligned_alloc(%d, %zu) failed"

l_.str.7:                               ; @.str.7
	.asciz	"container->o_init != NULL"

	.comm	_orders_per_buyer,320000,7      ; @orders_per_buyer
	.section	__DATA,__data
	.globl	_bo_end                         ; @bo_end
	.p2align	3
_bo_end:
	.quad	_orders_per_buyer+320000

	.globl	_id                             ; @id
.zerofill __DATA,__common,_id,8,3
	.section	__TEXT,__cstring,cstring_literals
l_.str.8:                               ; @.str.8
	.asciz	"elapsed_clock = %lu\n"

.subsections_via_symbols
