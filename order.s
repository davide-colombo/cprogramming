	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	__order_sum_priced              ; -- Begin function _order_sum_priced
	.p2align	2
__order_sum_priced:                     ; @_order_sum_priced
	.cfi_startproc
; %bb.0:
	movi	d0, #0000000000000000
	cmp	x1, #4
	b.hs	LBB0_2
; %bb.1:
	mov	x8, x0
	mov	x9, x1
	b	LBB0_5
LBB0_2:
	and	x10, x1, #0xfffffffffffffffc
	add	x8, x0, x10, lsl #3
	and	x9, x1, #0x3
	add	x11, x0, #16
	movi	d0, #0000000000000000
	mov	x12, x10
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldp	d1, d2, [x11, #-16]
	ldp	d3, d4, [x11], #32
	fadd	d0, d0, d1
	fadd	d0, d0, d2
	fadd	d0, d0, d3
	fadd	d0, d0, d4
	subs	x12, x12, #4
	b.ne	LBB0_3
; %bb.4:
	cmp	x10, x1
	b.eq	LBB0_6
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d1, [x8], #8
	fadd	d0, d0, d1
	subs	x9, x9, #1
	b.ne	LBB0_5
LBB0_6:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__order_alloc_ir_of_orders      ; -- Begin function _order_alloc_ir_of_orders
	.p2align	2
__order_alloc_ir_of_orders:             ; @_order_alloc_ir_of_orders
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x8, [x0]
	cbnz	x8, LBB1_5
; %bb.1:
	mov	x19, x0
	mov	w0, #16
	bl	_malloc
	str	x0, [x19]
	cbnz	x0, LBB1_3
; %bb.2:
Lloh0:
	adrp	x8, ___stderrp@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh2:
	ldr	x3, [x8]
Lloh3:
	adrp	x0, l_.str.2@PAGE
Lloh4:
	add	x0, x0, l_.str.2@PAGEOFF
	mov	w1, #26
	mov	w2, #1
	bl	_fwrite
	ldr	x0, [x19]
LBB1_3:
	cbz	x0, LBB1_6
; %bb.4:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB1_5:
	bl	__order_alloc_ir_of_orders.cold.2
LBB1_6:
	bl	__order_alloc_ir_of_orders.cold.1
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.cfi_endproc
                                        ; -- End function
	.globl	__order_get_aligned_memory      ; -- Begin function _order_get_aligned_memory
	.p2align	2
__order_get_aligned_memory:             ; @_order_get_aligned_memory
	.cfi_startproc
; %bb.0:
	orr	x8, xzr, #0x7f
	madd	x8, x1, x0, x8
	and	x0, x8, #0xffffffffffffff80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__order_aligned_alloc_orders    ; -- Begin function _order_aligned_alloc_orders
	.p2align	2
__order_aligned_alloc_orders:           ; @_order_aligned_alloc_orders
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldr	x8, [x0]
	cbnz	x8, LBB3_8
; %bb.1:
	mov	x19, x1
	mov	x20, x0
	mov	w0, #16
	bl	_malloc
	str	x0, [x20]
	cbz	x0, LBB3_6
; %bb.2:
	mov	x21, x0
	cbz	x21, LBB3_7
LBB3_3:
	mov	w0, #128
	mov	x1, x19
	bl	_aligned_alloc
	str	x0, [x21]
	ldr	x0, [x20]
	ldr	x8, [x0]
	cbnz	x8, LBB3_5
; %bb.4:
	bl	_free
Lloh5:
	adrp	x8, ___stderrp@GOTPAGE
Lloh6:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh7:
	ldr	x0, [x8]
	mov	w8, #128
	stp	x8, x19, [sp]
Lloh8:
	adrp	x1, l_.str.4@PAGE
Lloh9:
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fprintf
LBB3_5:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB3_6:
Lloh10:
	adrp	x8, ___stderrp@GOTPAGE
Lloh11:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh12:
	ldr	x3, [x8]
Lloh13:
	adrp	x0, l_.str.2@PAGE
Lloh14:
	add	x0, x0, l_.str.2@PAGEOFF
	mov	w1, #26
	mov	w2, #1
	bl	_fwrite
	ldr	x21, [x20]
	cbnz	x21, LBB3_3
LBB3_7:
	bl	__order_aligned_alloc_orders.cold.1
LBB3_8:
	bl	__order_aligned_alloc_orders.cold.2
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpLdrGotLdr	Lloh5, Lloh6, Lloh7
	.loh AdrpAdd	Lloh13, Lloh14
	.loh AdrpLdrGotLdr	Lloh10, Lloh11, Lloh12
	.cfi_endproc
                                        ; -- End function
	.globl	__order_init_array_of_orders    ; -- Begin function _order_init_array_of_orders
	.p2align	2
__order_init_array_of_orders:           ; @_order_init_array_of_orders
	.cfi_startproc
; %bb.0:
	stp	d9, d8, [sp, #-64]!             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset b8, -56
	.cfi_offset b9, -64
	cmp	x1, #1
	b.lt	LBB4_3
; %bb.1:
	mov	x19, x1
	sub	x20, x0, #8
	mov	x21, #281474972516352
	movk	x21, #16863, lsl #48
	mov	x22, #70368744177664
	movk	x22, #16527, lsl #48
	fmov	d8, #10.00000000
LBB4_2:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
	scvtf	d0, w0
	fmov	d1, x21
	fdiv	d0, d0, d1
	fmov	d1, x22
	fmul	d0, d0, d1
	fadd	d0, d0, d8
	str	d0, [x20, x19, lsl #3]
	subs	x19, x19, #1
	b.gt	LBB4_2
LBB4_3:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp], #64               ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	stp	d11, d10, [sp, #16]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               ; 16-byte Folded Spill
	stp	x26, x25, [sp, #48]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset b8, -88
	.cfi_offset b9, -96
	.cfi_offset b10, -104
	.cfi_offset b11, -112
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	bl	_clock
	mov	x19, x0
	adrp	x20, _bo_end@PAGE
	ldr	x8, [x20, _bo_end@PAGEOFF]
Lloh15:
	adrp	x9, _orders_per_buyer@GOTPAGE
Lloh16:
	ldr	x9, [x9, _orders_per_buyer@GOTPAGEOFF]
	cmp	x8, x9
	b.ls	LBB5_3
; %bb.1:
Lloh17:
	adrp	x21, _orders_per_buyer@GOTPAGE
Lloh18:
	ldr	x21, [x21, _orders_per_buyer@GOTPAGEOFF]
	adrp	x22, _id@PAGE
	mov	w23, #5
	mov	x24, #281474972516352
	movk	x24, #16863, lsl #48
	fmov	d8, #10.00000000
	mov	x25, #70368744177664
	movk	x25, #16527, lsl #48
LBB5_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x22, _id@PAGEOFF]
	add	x8, x8, #1
	str	x8, [x22, _id@PAGEOFF]
	str	x8, [x21]
	add	x0, x21, #8
	mov	w1, #128
	bl	__order_aligned_alloc_orders
	ldr	x8, [x21, #8]
	str	x23, [x8, #8]
	ldr	x26, [x8]
	bl	_rand
	scvtf	d0, w0
	fmov	d9, x24
	fdiv	d0, d0, d9
	fmov	d10, x25
	fmul	d0, d0, d10
	fadd	d0, d0, d8
	str	d0, [x26, #32]
	bl	_rand
	scvtf	d0, w0
	fdiv	d0, d0, d9
	fmul	d0, d0, d10
	fadd	d0, d0, d8
	str	d0, [x26, #24]
	bl	_rand
	scvtf	d0, w0
	fdiv	d0, d0, d9
	fmul	d0, d0, d10
	fadd	d0, d0, d8
	str	d0, [x26, #16]
	bl	_rand
	scvtf	d0, w0
	fdiv	d0, d0, d9
	fmul	d0, d0, d10
	fadd	d0, d0, d8
	str	d0, [x26, #8]
	bl	_rand
	scvtf	d0, w0
	fdiv	d0, d0, d9
	fmul	d0, d0, d10
	fadd	d0, d0, d8
	str	d0, [x26]
	add	x0, x21, #16
	mov	w1, #128
	bl	__order_aligned_alloc_orders
	ldr	x8, [x21, #16]
	str	x23, [x8, #8]
	ldr	x26, [x8]
	bl	_rand
	scvtf	d0, w0
	fdiv	d0, d0, d9
	fmul	d0, d0, d10
	fadd	d0, d0, d8
	str	d0, [x26, #32]
	bl	_rand
	scvtf	d0, w0
	fdiv	d0, d0, d9
	fmul	d0, d0, d10
	fadd	d0, d0, d8
	str	d0, [x26, #24]
	bl	_rand
	scvtf	d0, w0
	fdiv	d0, d0, d9
	fmul	d0, d0, d10
	fadd	d0, d0, d8
	str	d0, [x26, #16]
	bl	_rand
	scvtf	d0, w0
	fdiv	d0, d0, d9
	fmul	d0, d0, d10
	fadd	d0, d0, d8
	str	d0, [x26, #8]
	bl	_rand
	scvtf	d0, w0
	fdiv	d0, d0, d9
	fmul	d0, d0, d10
	fadd	d0, d0, d8
	str	d0, [x26]
	ldr	x8, [x20, _bo_end@PAGEOFF]
	add	x21, x21, #32
	cmp	x21, x8
	b.lo	LBB5_2
LBB5_3:
	bl	_clock
	sub	x8, x0, x19
	str	x8, [sp]
Lloh19:
	adrp	x19, l_.str.5@PAGE
Lloh20:
	add	x19, x19, l_.str.5@PAGEOFF
	mov	x0, x19
	bl	_printf
	bl	_clock
	mov	x20, x0
	bl	_clock
	sub	x8, x0, x20
	str	x8, [sp]
	mov	x0, x19
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.loh AdrpLdrGot	Lloh15, Lloh16
	.loh AdrpLdrGot	Lloh17, Lloh18
	.loh AdrpAdd	Lloh19, Lloh20
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _order_alloc_ir_of_orders.cold.1
__order_alloc_ir_of_orders.cold.1:      ; @_order_alloc_ir_of_orders.cold.1
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh21:
	adrp	x0, l___func__._order_alloc_ir_of_orders@PAGE
Lloh22:
	add	x0, x0, l___func__._order_alloc_ir_of_orders@PAGEOFF
Lloh23:
	adrp	x1, l_.str@PAGE
Lloh24:
	add	x1, x1, l_.str@PAGEOFF
Lloh25:
	adrp	x3, l_.str.3@PAGE
Lloh26:
	add	x3, x3, l_.str.3@PAGEOFF
	mov	w2, #207
	bl	___assert_rtn
	.loh AdrpAdd	Lloh25, Lloh26
	.loh AdrpAdd	Lloh23, Lloh24
	.loh AdrpAdd	Lloh21, Lloh22
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _order_alloc_ir_of_orders.cold.2
__order_alloc_ir_of_orders.cold.2:      ; @_order_alloc_ir_of_orders.cold.2
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh27:
	adrp	x0, l___func__._order_alloc_ir_of_orders@PAGE
Lloh28:
	add	x0, x0, l___func__._order_alloc_ir_of_orders@PAGEOFF
Lloh29:
	adrp	x1, l_.str@PAGE
Lloh30:
	add	x1, x1, l_.str@PAGEOFF
Lloh31:
	adrp	x3, l_.str.1@PAGE
Lloh32:
	add	x3, x3, l_.str.1@PAGEOFF
	mov	w2, #198
	bl	___assert_rtn
	.loh AdrpAdd	Lloh31, Lloh32
	.loh AdrpAdd	Lloh29, Lloh30
	.loh AdrpAdd	Lloh27, Lloh28
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _order_aligned_alloc_orders.cold.1
__order_aligned_alloc_orders.cold.1:    ; @_order_aligned_alloc_orders.cold.1
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh33:
	adrp	x0, l___func__._order_alloc_ir_of_orders@PAGE
Lloh34:
	add	x0, x0, l___func__._order_alloc_ir_of_orders@PAGEOFF
Lloh35:
	adrp	x1, l_.str@PAGE
Lloh36:
	add	x1, x1, l_.str@PAGEOFF
Lloh37:
	adrp	x3, l_.str.3@PAGE
Lloh38:
	add	x3, x3, l_.str.3@PAGEOFF
	mov	w2, #207
	bl	___assert_rtn
	.loh AdrpAdd	Lloh37, Lloh38
	.loh AdrpAdd	Lloh35, Lloh36
	.loh AdrpAdd	Lloh33, Lloh34
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _order_aligned_alloc_orders.cold.2
__order_aligned_alloc_orders.cold.2:    ; @_order_aligned_alloc_orders.cold.2
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh39:
	adrp	x0, l___func__._order_alloc_ir_of_orders@PAGE
Lloh40:
	add	x0, x0, l___func__._order_alloc_ir_of_orders@PAGEOFF
Lloh41:
	adrp	x1, l_.str@PAGE
Lloh42:
	add	x1, x1, l_.str@PAGEOFF
Lloh43:
	adrp	x3, l_.str.1@PAGE
Lloh44:
	add	x3, x3, l_.str.1@PAGEOFF
	mov	w2, #198
	bl	___assert_rtn
	.loh AdrpAdd	Lloh43, Lloh44
	.loh AdrpAdd	Lloh41, Lloh42
	.loh AdrpAdd	Lloh39, Lloh40
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

	.comm	_orders_per_buyer,320000,7      ; @orders_per_buyer
	.section	__DATA,__data
	.globl	_bo_end                         ; @bo_end
	.p2align	3
_bo_end:
	.quad	_orders_per_buyer+320000

	.globl	_id                             ; @id
.zerofill __DATA,__common,_id,8,3
	.section	__TEXT,__cstring,cstring_literals
l_.str.5:                               ; @.str.5
	.asciz	"elapsed_clock = %lu\n"

.subsections_via_symbols
