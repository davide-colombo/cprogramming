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
	.globl	__order_alloc_ir_of_orders      ; -- Begin function _order_alloc_ir_of_orders
	.p2align	2
__order_alloc_ir_of_orders:             ; @_order_alloc_ir_of_orders
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
	subs	x8, x8, #0
	cset	w8, ne
	tbz	w8, #0, LBB1_2
	b	LBB1_1
LBB1_1:
	adrp	x0, l___func__._order_alloc_ir_of_orders@PAGE
	add	x0, x0, l___func__._order_alloc_ir_of_orders@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #195
	adrp	x3, l_.str.1@PAGE
	add	x3, x3, l_.str.1@PAGEOFF
	bl	___assert_rtn
LBB1_2:
	b	LBB1_3
LBB1_3:
	mov	x0, #16
	bl	_malloc
	ldr	x8, [sp, #8]
	str	x0, [x8]
	ldr	x8, [sp, #8]
	ldr	x8, [x8]
	cbnz	x8, LBB1_5
	b	LBB1_4
LBB1_4:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	adrp	x1, l_.str.2@PAGE
	add	x1, x1, l_.str.2@PAGEOFF
	bl	_fprintf
	b	LBB1_5
LBB1_5:
	ldr	x8, [sp, #8]
	ldr	x8, [x8]
	subs	x8, x8, #0
	cset	w8, eq
	tbz	w8, #0, LBB1_7
	b	LBB1_6
LBB1_6:
	adrp	x0, l___func__._order_alloc_ir_of_orders@PAGE
	add	x0, x0, l___func__._order_alloc_ir_of_orders@PAGEOFF
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #204
	adrp	x3, l_.str.3@PAGE
	add	x3, x3, l_.str.3@PAGEOFF
	bl	___assert_rtn
LBB1_7:
	b	LBB1_8
LBB1_8:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__order_get_aligned_memory      ; -- Begin function _order_get_aligned_memory
	.p2align	2
__order_get_aligned_memory:             ; @_order_get_aligned_memory
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x9, [sp]
	mul	x8, x8, x9
	add	x8, x8, #127
	and	x0, x8, #0xffffffffffffff80
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__order_aligned_alloc_orders    ; -- Begin function _order_aligned_alloc_orders
	.p2align	2
__order_aligned_alloc_orders:           ; @_order_aligned_alloc_orders
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	bl	__order_alloc_ir_of_orders
	ldr	x1, [sp, #16]
	mov	x0, #128
	bl	_aligned_alloc
	ldur	x8, [x29, #-8]
	ldr	x8, [x8]
	str	x0, [x8]
	ldur	x8, [x29, #-8]
	ldr	x8, [x8]
	ldr	x8, [x8]
	cbnz	x8, LBB3_2
	b	LBB3_1
LBB3_1:
	ldur	x8, [x29, #-8]
	ldr	x0, [x8]
	bl	_free
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	ldr	x8, [sp, #16]
	mov	x9, sp
	mov	x10, #128
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fprintf
	b	LBB3_2
LBB3_2:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function _order_init_array_of_orders
lCPI4_0:
	.quad	0x408f400000000000              ; double 1000
lCPI4_1:
	.quad	0x41dfffffffc00000              ; double 2147483647
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__order_init_array_of_orders
	.p2align	2
__order_init_array_of_orders:           ; @_order_init_array_of_orders
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #8]
	b	LBB4_1
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	ldr	x9, [sp, #16]
	subs	x8, x8, x9
	b.hs	LBB4_4
	b	LBB4_2
LBB4_2:                                 ;   in Loop: Header=BB4_1 Depth=1
	bl	_rand
	scvtf	d0, w0
	adrp	x8, lCPI4_1@PAGE
	ldr	d1, [x8, lCPI4_1@PAGEOFF]
	fdiv	d0, d0, d1
	adrp	x8, lCPI4_0@PAGE
	ldr	d1, [x8, lCPI4_0@PAGEOFF]
	fmul	d0, d0, d1
	fmov	d1, #10.00000000
	fadd	d0, d0, d1
	ldr	x8, [sp, #8]
	str	d0, [x8]
	b	LBB4_3
LBB4_3:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldr	x8, [sp, #8]
	add	x8, x8, #8
	str	x8, [sp, #8]
	b	LBB4_1
LBB4_4:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #144
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128
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
	mov	x8, #8
	stur	x8, [x29, #-40]
	ldur	x1, [x29, #-40]
	mov	x0, #5000
	str	x0, [sp, #24]                   ; 8-byte Folded Spill
	bl	__order_get_aligned_memory
	mov	x8, x0
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	stur	x8, [x29, #-48]
	ldur	x1, [x29, #-40]
	bl	__order_get_aligned_memory
	stur	x0, [x29, #-56]
	adrp	x8, _orders_per_buyer@GOTPAGE
	ldr	x8, [x8, _orders_per_buyer@GOTPAGEOFF]
	str	x8, [sp, #48]
	b	LBB5_1
LBB5_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #48]
	adrp	x9, _bo_end@PAGE
	ldr	x9, [x9, _bo_end@PAGEOFF]
	subs	x8, x8, x9
	b.hs	LBB5_4
	b	LBB5_2
LBB5_2:                                 ;   in Loop: Header=BB5_1 Depth=1
	adrp	x9, _id@PAGE
	ldr	x8, [x9, _id@PAGEOFF]
	add	x8, x8, #1
	str	x8, [x9, _id@PAGEOFF]
	ldr	x9, [sp, #48]
	str	x8, [x9]
	ldr	x8, [sp, #48]
	add	x8, x8, #8
	str	x8, [sp, #64]
	ldr	x8, [sp, #48]
	add	x8, x8, #16
	str	x8, [sp, #56]
	ldr	x0, [sp, #64]
	ldur	x1, [x29, #-48]
	bl	__order_aligned_alloc_orders
	ldr	x8, [sp, #64]
	ldr	x8, [x8]
	ldr	x8, [x8]
	mov	x9, #40000
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	add	x8, x8, x9
	ldr	x9, [sp, #64]
	ldr	x9, [x9]
	str	x8, [x9, #8]
	ldr	x8, [sp, #64]
	ldr	x8, [x8]
	ldr	x0, [x8]
	ldr	x8, [sp, #64]
	ldr	x8, [x8]
	ldr	x1, [x8, #8]
	bl	__order_init_array_of_orders
	ldr	x0, [sp, #56]
	ldur	x1, [x29, #-56]
	bl	__order_aligned_alloc_orders
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #56]
	ldr	x8, [x8]
	ldr	x8, [x8]
	add	x8, x8, x9
	ldr	x9, [sp, #56]
	ldr	x9, [x9]
	str	x8, [x9, #8]
	ldr	x8, [sp, #56]
	ldr	x8, [x8]
	ldr	x0, [x8]
	ldr	x8, [sp, #56]
	ldr	x8, [x8]
	ldr	x1, [x8, #8]
	bl	__order_init_array_of_orders
	b	LBB5_3
LBB5_3:                                 ;   in Loop: Header=BB5_1 Depth=1
	ldr	x8, [sp, #48]
	add	x8, x8, #32
	str	x8, [sp, #48]
	b	LBB5_1
LBB5_4:
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
	adrp	x8, _orders_per_buyer@GOTPAGE
	ldr	x8, [x8, _orders_per_buyer@GOTPAGEOFF]
	str	x8, [sp, #32]
	b	LBB5_5
LBB5_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #32]
	adrp	x9, _bo_end@PAGE
	ldr	x9, [x9, _bo_end@PAGEOFF]
	subs	x8, x8, x9
	b.hs	LBB5_8
	b	LBB5_6
LBB5_6:                                 ;   in Loop: Header=BB5_5 Depth=1
	ldr	x8, [sp, #32]
	ldr	x0, [x8, #8]
	bl	__order_sum_priced
	ldr	x8, [sp, #32]
	ldr	x0, [x8, #16]
	bl	__order_sum_priced
	b	LBB5_7
LBB5_7:                                 ;   in Loop: Header=BB5_5 Depth=1
	ldr	x8, [sp, #32]
	add	x8, x8, #32
	str	x8, [sp, #32]
	b	LBB5_5
LBB5_8:
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
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l___func__._order_alloc_ir_of_orders:   ; @__func__._order_alloc_ir_of_orders
	.asciz	"_order_alloc_ir_of_orders"

l_.str:                                 ; @.str
	.asciz	"order.c"

l_.str.1:                               ; @.str.1
	.asciz	"*optr == NULL"

l_.str.2:                               ; @.str.2
	.asciz	"[ir orders] malloc failed\n"

l_.str.3:                               ; @.str.3
	.asciz	"*optr != NULL"

l_.str.4:                               ; @.str.4
	.asciz	"aligned_alloc(%d, %zu) failed"

	.comm	_orders_per_buyer,320,7         ; @orders_per_buyer
	.section	__DATA,__data
	.globl	_bo_end                         ; @bo_end
	.p2align	3
_bo_end:
	.quad	_orders_per_buyer+320

	.globl	_id                             ; @id
.zerofill __DATA,__common,_id,8,3
	.section	__TEXT,__cstring,cstring_literals
l_.str.5:                               ; @.str.5
	.asciz	"elapsed_clock = %lu\n"

.subsections_via_symbols
