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
	mov	w2, #208
	adrp	x3, l_.str.1@PAGE
	add	x3, x3, l_.str.1@PAGEOFF
	bl	___assert_rtn
LBB1_2:
	b	LBB1_3
LBB1_3:
	ldur	x8, [x29, #-8]
	ldr	x8, [x8]
	str	x8, [sp, #24]
	ldur	x9, [x29, #-16]
	mov	x8, #8
	mul	x8, x8, x9
	str	x8, [sp, #16]
	ldr	x8, [sp, #16]
	and	x8, x8, #0x7f
	cbz	x8, LBB1_5
	b	LBB1_4
LBB1_4:
	ldr	x8, [sp, #16]
	add	x8, x8, #127
	and	x8, x8, #0xffffffffffffff80
	str	x8, [sp, #16]
	b	LBB1_5
LBB1_5:
	ldr	x8, [sp, #16]
	ands	x8, x8, #0x7f
	cset	w8, ne
	tbz	w8, #0, LBB1_7
	b	LBB1_6
LBB1_6:
	adrp	x0, l___func__._order_aligned_alloc_array_of_orders@PAGE
	add	x0, x0, l___func__._order_aligned_alloc_array_of_orders@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #224
	adrp	x3, l_.str.2@PAGE
	add	x3, x3, l_.str.2@PAGEOFF
	bl	___assert_rtn
LBB1_7:
	b	LBB1_8
LBB1_8:
	ldr	x1, [sp, #16]
	mov	x0, #128
	bl	_aligned_alloc
	ldr	x8, [sp, #24]
	str	x0, [x8]
	ldr	x8, [sp, #24]
	ldr	x8, [x8]
	cbnz	x8, LBB1_10
	b	LBB1_9
LBB1_9:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	ldr	x8, [sp, #16]
	mov	x9, sp
	mov	x10, #128
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x1, l_.str.3@PAGE
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fprintf
	b	LBB1_10
LBB1_10:
	ldr	x8, [sp, #24]
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
	mov	w2, #235
	adrp	x3, l_.str.4@PAGE
	add	x3, x3, l_.str.4@PAGEOFF
	bl	___assert_rtn
LBB1_12:
	b	LBB1_13
LBB1_13:
	ldr	x8, [sp, #24]
	ldr	x8, [x8]
	ldur	x9, [x29, #-16]
	add	x8, x8, x9, lsl #3
	ldr	x9, [sp, #24]
	str	x8, [x9, #8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__order_alloc_ir_orders         ; -- Begin function _order_alloc_ir_orders
	.p2align	2
__order_alloc_ir_orders:                ; @_order_alloc_ir_orders
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	mov	x0, #16
	bl	_malloc
	ldr	x8, [sp, #8]
	str	x0, [x8]
	ldr	x8, [sp, #8]
	cbnz	x8, LBB2_2
	b	LBB2_1
LBB2_1:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	adrp	x1, l_.str.5@PAGE
	add	x1, x1, l_.str.5@PAGEOFF
	bl	_fprintf
	b	LBB2_2
LBB2_2:
	ldr	x8, [sp, #8]
	subs	x8, x8, #0
	cset	w8, eq
	tbz	w8, #0, LBB2_4
	b	LBB2_3
LBB2_3:
	adrp	x0, l___func__._order_alloc_ir_orders@PAGE
	add	x0, x0, l___func__._order_alloc_ir_orders@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #263
	adrp	x3, l_.str.6@PAGE
	add	x3, x3, l_.str.6@PAGEOFF
	bl	___assert_rtn
LBB2_4:
	b	LBB2_5
LBB2_5:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function _order_init_array_of_orders
lCPI3_0:
	.quad	0x408f400000000000              ; double 1000
lCPI3_1:
	.quad	0x41dfffffffc00000              ; double 2147483647
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__order_init_array_of_orders
	.p2align	2
__order_init_array_of_orders:           ; @_order_init_array_of_orders
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x8, [x8]
	str	x8, [sp]
	b	LBB3_1
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp]
	ldr	x9, [sp, #8]
	ldr	x9, [x9, #8]
	subs	x8, x8, x9
	b.hs	LBB3_4
	b	LBB3_2
LBB3_2:                                 ;   in Loop: Header=BB3_1 Depth=1
	bl	_rand
	scvtf	d0, w0
	adrp	x8, lCPI3_1@PAGE
	ldr	d1, [x8, lCPI3_1@PAGEOFF]
	fdiv	d0, d0, d1
	adrp	x8, lCPI3_0@PAGE
	ldr	d1, [x8, lCPI3_0@PAGEOFF]
	fmul	d0, d0, d1
	fmov	d1, #10.00000000
	fadd	d0, d0, d1
	ldr	x8, [sp]
	str	d0, [x8]
	b	LBB3_3
LBB3_3:                                 ;   in Loop: Header=BB3_1 Depth=1
	ldr	x8, [sp]
	add	x8, x8, #8
	str	x8, [sp]
	b	LBB3_1
LBB3_4:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
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
	adrp	x8, _po_ptr@GOTPAGE
	ldr	x8, [x8, _po_ptr@GOTPAGEOFF]
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	adrp	x8, _uo_ptr@GOTPAGE
	ldr	x8, [x8, _uo_ptr@GOTPAGEOFF]
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
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
	stur	x8, [x29, #-40]
	b	LBB4_1
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-40]
	adrp	x9, _bo_end@PAGE
	ldr	x9, [x9, _bo_end@PAGEOFF]
	subs	x8, x8, x9
	b.hs	LBB4_4
	b	LBB4_2
LBB4_2:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldr	x10, [sp, #32]                  ; 8-byte Folded Reload
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	adrp	x11, _id@PAGE
	ldr	x9, [x11, _id@PAGEOFF]
	add	x9, x9, #1
	str	x9, [x11, _id@PAGEOFF]
	ldur	x11, [x29, #-40]
	str	x9, [x11]
	ldur	x9, [x29, #-40]
	add	x9, x9, #8
	str	x9, [x8]
	ldur	x9, [x29, #-40]
	add	x9, x9, #16
	str	x9, [x10]
	ldr	x0, [x8]
	bl	__order_alloc_ir_orders
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	mov	x1, #5
	str	x1, [sp, #16]                   ; 8-byte Folded Spill
	bl	__order_aligned_alloc_array_of_orders
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [x8]
	ldr	x0, [x8]
	bl	__order_init_array_of_orders
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	bl	__order_alloc_ir_orders
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	bl	__order_aligned_alloc_array_of_orders
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x8, [x8]
	ldr	x0, [x8]
	bl	__order_init_array_of_orders
	b	LBB4_3
LBB4_3:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldur	x8, [x29, #-40]
	add	x8, x8, #32
	stur	x8, [x29, #-40]
	b	LBB4_1
LBB4_4:
	bl	_clock
	stur	x0, [x29, #-32]
	ldur	x8, [x29, #-32]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	str	x8, [sp, #48]
	ldr	x8, [sp, #48]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
	bl	_clock
	stur	x0, [x29, #-24]
	adrp	x8, _orders_per_buyer@GOTPAGE
	ldr	x8, [x8, _orders_per_buyer@GOTPAGEOFF]
	str	x8, [sp, #40]
	b	LBB4_5
LBB4_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #40]
	adrp	x9, _bo_end@PAGE
	ldr	x9, [x9, _bo_end@PAGEOFF]
	subs	x8, x8, x9
	b.hs	LBB4_8
	b	LBB4_6
LBB4_6:                                 ;   in Loop: Header=BB4_5 Depth=1
	ldr	x8, [sp, #40]
	ldr	x0, [x8, #8]
	bl	__order_sum_priced
	ldr	x8, [sp, #40]
	ldr	x0, [x8, #16]
	bl	__order_sum_priced
	b	LBB4_7
LBB4_7:                                 ;   in Loop: Header=BB4_5 Depth=1
	ldr	x8, [sp, #40]
	add	x8, x8, #32
	str	x8, [sp, #40]
	b	LBB4_5
LBB4_8:
	bl	_clock
	stur	x0, [x29, #-32]
	ldur	x8, [x29, #-32]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	str	x8, [sp, #48]
	ldr	x8, [sp, #48]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
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
	.asciz	"container->o_init != NULL"

l_.str.5:                               ; @.str.5
	.asciz	"[ir orders] malloc failed\n"

l___func__._order_alloc_ir_orders:      ; @__func__._order_alloc_ir_orders
	.asciz	"_order_alloc_ir_orders"

l_.str.6:                               ; @.str.6
	.asciz	"optr != NULL"

	.comm	_orders_per_buyer,320000,7      ; @orders_per_buyer
	.section	__DATA,__data
	.globl	_bo_end                         ; @bo_end
	.p2align	3
_bo_end:
	.quad	_orders_per_buyer+320000

	.globl	_id                             ; @id
.zerofill __DATA,__common,_id,8,3
	.comm	_po_ptr,8,3                     ; @po_ptr
	.comm	_uo_ptr,8,3                     ; @uo_ptr
	.section	__TEXT,__cstring,cstring_literals
l_.str.7:                               ; @.str.7
	.asciz	"elapsed_clock = %lu\n"

.subsections_via_symbols
