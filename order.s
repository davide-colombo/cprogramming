	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_order_alloc                    ; -- Begin function order_alloc
	.p2align	2
_order_alloc:                           ; @order_alloc
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
	mov	x19, x0
	lsl	x0, x1, #2
	bl	_malloc
	cmp	x0, #0
	cset	w8, eq
	str	x0, [x19]
	lsl	w0, w8, #7
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_order_free                     ; -- Begin function order_free
	.p2align	2
_order_free:                            ; @order_free
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x8, [x0]
	cbz	x8, LBB1_2
; %bb.1:
	mov	x19, x0
	stp	x0, x8, [sp]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	ldr	x0, [x19]
	bl	_free
	mov	w0, #1
	b	LBB1_3
LBB1_2:
	mov	w0, #129
LBB1_3:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_order_head_alloc               ; -- Begin function order_head_alloc
	.p2align	2
_order_head_alloc:                      ; @order_head_alloc
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
	mov	x19, x0
	lsl	x0, x1, #3
	bl	_malloc
	cmp	x0, #0
	cset	w8, eq
	str	x0, [x19]
	lsl	w0, w8, #7
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_order_head_free                ; -- Begin function order_head_free
	.p2align	2
_order_head_free:                       ; @order_head_free
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	ldr	x8, [x0]
	cbz	x8, LBB3_7
; %bb.1:
	mov	x19, x0
	add	x23, x8, x1, lsl #3
	stp	x8, x23, [sp]
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldr	x20, [x19]
	cmp	x20, x23
	b.hs	LBB3_8
; %bb.2:
Lloh4:
	adrp	x21, l_.str@PAGE
Lloh5:
	add	x21, x21, l_.str@PAGEOFF
                                        ; implicit-def: $w22
	b	LBB3_5
LBB3_3:                                 ;   in Loop: Header=BB3_5 Depth=1
	stp	x20, x8, [sp]
	mov	x0, x21
	bl	_printf
	ldr	x0, [x20]
	bl	_free
	mov	w8, #1
LBB3_4:                                 ;   in Loop: Header=BB3_5 Depth=1
	and	w22, w8, w22
	add	x20, x20, #8
	cmp	x20, x23
	b.hs	LBB3_9
LBB3_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x20]
	cbnz	x8, LBB3_3
; %bb.6:                                ;   in Loop: Header=BB3_5 Depth=1
	mov	w8, #129
	b	LBB3_4
LBB3_7:
	mov	w22, #129
	b	LBB3_11
LBB3_8:
                                        ; implicit-def: $w22
	b	LBB3_10
LBB3_9:
	ldr	x20, [x19]
LBB3_10:
	mov	x0, x20
	bl	_free
LBB3_11:
	and	w0, w22, #0xff
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.globl	_order_sum_price                ; -- Begin function order_sum_price
	.p2align	2
_order_sum_price:                       ; @order_sum_price
	.cfi_startproc
; %bb.0:
	mov	w8, #130
	cbz	x1, LBB4_11
; %bb.1:
	cbz	x2, LBB4_11
; %bb.2:
	str	xzr, [x0]
	cmp	x2, #1
	b.lt	LBB4_10
; %bb.3:
	add	x8, x1, x2, lsl #2
	add	x9, x1, #4
	cmp	x8, x9
	csel	x9, x8, x9, hi
	mvn	x10, x1
	add	x9, x9, x10
	movi	d0, #0000000000000000
	cmp	x9, #60
	b.hs	LBB4_5
; %bb.4:
	mov	x9, x1
	b	LBB4_8
LBB4_5:
	lsr	x9, x9, #2
	add	x10, x9, #1
	and	x11, x10, #0x7ffffffffffffff0
	add	x9, x1, x11, lsl #2
	add	x12, x1, #32
	movi	d0, #0000000000000000
	mov	x13, x11
LBB4_6:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x12, #-32]
	ldp	q3, q4, [x12], #64
	fcvtl2	v5.2d, v1.4s
	mov	d6, v5[1]
	fcvtl	v1.2d, v1.2s
	mov	d7, v1[1]
	fcvtl2	v16.2d, v2.4s
	mov	d17, v16[1]
	fcvtl	v2.2d, v2.2s
	mov	d18, v2[1]
	fcvtl2	v19.2d, v3.4s
	mov	d20, v19[1]
	fcvtl	v3.2d, v3.2s
	mov	d21, v3[1]
	fcvtl2	v22.2d, v4.4s
	mov	d23, v22[1]
	fcvtl	v4.2d, v4.2s
	mov	d24, v4[1]
	fadd	d0, d0, d1
	fadd	d0, d0, d7
	fadd	d0, d0, d5
	fadd	d0, d0, d6
	fadd	d0, d0, d2
	fadd	d0, d0, d18
	fadd	d0, d0, d16
	fadd	d0, d0, d17
	fadd	d0, d0, d3
	fadd	d0, d0, d21
	fadd	d0, d0, d19
	fadd	d0, d0, d20
	fadd	d0, d0, d4
	fadd	d0, d0, d24
	fadd	d0, d0, d22
	fadd	d0, d0, d23
	subs	x13, x13, #16
	b.ne	LBB4_6
; %bb.7:
	cmp	x10, x11
	b.eq	LBB4_9
LBB4_8:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x9], #4
	fcvt	d1, s1
	fadd	d0, d0, d1
	cmp	x9, x8
	b.lo	LBB4_8
LBB4_9:
	str	d0, [x0]
LBB4_10:
	mov	w8, #2
LBB4_11:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"optr = %p\t*optr = %p\n"

l_.str.1:                               ; @.str.1
	.asciz	"*optr = %p\thend = %p\n"

.subsections_via_symbols
