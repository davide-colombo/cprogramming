	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_vector2_print_vector2_type_info ; -- Begin function vector2_print_vector2_type_info
	.p2align	2
_vector2_print_vector2_type_info:       ; @vector2_print_vector2_type_info
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #4608
	movk	w8, #122, lsl #16
	str	x8, [sp]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w8, #128
	str	x8, [sp]
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_alloc_vector2          ; -- Begin function vector2_alloc_vector2
	.p2align	2
_vector2_alloc_vector2:                 ; @vector2_alloc_vector2
	.cfi_startproc
; %bb.0:
	mov	w0, #4608
	movk	w0, #122, lsl #16
	b	_malloc
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_alloc_vector2_aligned  ; -- Begin function vector2_alloc_vector2_aligned
	.p2align	2
_vector2_alloc_vector2_aligned:         ; @vector2_alloc_vector2_aligned
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	sub	x8, x0, #4
	cmp	x8, #60
	b.hi	LBB2_4
; %bb.1:
	mov	w9, #1
	lsl	x8, x9, x8
	mov	x9, #1152921504875282432
	movk	x9, #4113
	tst	x8, x9
	b.eq	LBB2_4
LBB2_2:
	sub	x8, x0, #1
	mov	w9, #4608
	movk	w9, #122, lsl #16
	and	x10, x8, x9
	sub	x10, x0, x10
	add	x1, x10, x9
	tst	x1, x8
	b.ne	LBB2_6
; %bb.3:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_aligned_alloc
LBB2_4:
	cmp	x0, #128
	b.eq	LBB2_2
; %bb.5:
	bl	_vector2_alloc_vector2_aligned.cold.1
LBB2_6:
	bl	_vector2_alloc_vector2_aligned.cold.2
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_free_vector2           ; -- Begin function vector2_free_vector2
	.p2align	2
_vector2_free_vector2:                  ; @vector2_free_vector2
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
	ldr	x0, [x0]
	cbz	x0, LBB3_2
; %bb.1:
	bl	_free
	str	xzr, [x19]
LBB3_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_alloc_rowsum1          ; -- Begin function vector2_alloc_rowsum1
	.p2align	2
_vector2_alloc_rowsum1:                 ; @vector2_alloc_rowsum1
	.cfi_startproc
; %bb.0:
	mov	w0, #8000
	b	_malloc
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_free_rowsum1           ; -- Begin function vector2_free_rowsum1
	.p2align	2
_vector2_free_rowsum1:                  ; @vector2_free_rowsum1
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
	ldr	x0, [x0]
	cbz	x0, LBB5_2
; %bb.1:
	bl	_free
	str	xzr, [x19]
LBB5_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_alloc_colsum1          ; -- Begin function vector2_alloc_colsum1
	.p2align	2
_vector2_alloc_colsum1:                 ; @vector2_alloc_colsum1
	.cfi_startproc
; %bb.0:
	mov	w0, #8000
	b	_malloc
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_free_colsum1           ; -- Begin function vector2_free_colsum1
	.p2align	2
_vector2_free_colsum1:                  ; @vector2_free_colsum1
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
	ldr	x0, [x0]
	cbz	x0, LBB7_2
; %bb.1:
	bl	_free
	str	xzr, [x19]
LBB7_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_add                    ; -- Begin function vector2_add
	.p2align	2
_vector2_add:                           ; @vector2_add
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	mov	w9, #1000
	mov	w10, #8000
	mov	x11, x2
	mov	x12, x1
	mov	x13, x0
	b	LBB8_2
LBB8_1:                                 ;   in Loop: Header=BB8_2 Depth=1
	add	x8, x8, #1
	add	x13, x13, x10
	add	x12, x12, x10
	add	x11, x11, x10
	subs	w9, w9, #1
	b.eq	LBB8_8
LBB8_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_5 Depth 2
                                        ;     Child Loop BB8_7 Depth 2
	mul	x15, x8, x10
	add	x14, x0, x15
	add	x16, x15, x10
	add	x17, x0, x16
	add	x3, x1, x16
	cmp	x14, x3
	cset	w3, lo
	add	x4, x1, x15
	cmp	x4, x17
	cset	w4, lo
	and	w3, w3, w4
	add	x16, x2, x16
	cmp	x14, x16
	cset	w14, lo
	add	x15, x2, x15
	cmp	x15, x17
	cset	w15, lo
	tbnz	w3, #0, LBB8_6
; %bb.3:                                ;   in Loop: Header=BB8_2 Depth=1
	and	w14, w14, w15
	tbnz	w14, #0, LBB8_6
; %bb.4:                                ;   in Loop: Header=BB8_2 Depth=1
	mov	x14, #-8000
LBB8_5:                                 ;   Parent Loop BB8_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x15, x12, x14
	ldr	q0, [x15, #8032]
	ldr	q1, [x15, #8048]
	ldr	q2, [x15, #8000]
	ldr	q3, [x15, #8016]
	add	x15, x11, x14
	ldr	q4, [x15, #8032]
	ldr	q5, [x15, #8048]
	ldr	q6, [x15, #8000]
	ldr	q7, [x15, #8016]
	fadd.2d	v3, v3, v7
	fadd.2d	v2, v2, v6
	fadd.2d	v1, v1, v5
	fadd.2d	v0, v0, v4
	add	x15, x13, x14
	str	q0, [x15, #8032]
	str	q1, [x15, #8048]
	str	q2, [x15, #8000]
	str	q3, [x15, #8016]
	adds	x14, x14, #64
	b.ne	LBB8_5
	b	LBB8_1
LBB8_6:                                 ;   in Loop: Header=BB8_2 Depth=1
	mov	x14, #0
	mov	w15, #-250
LBB8_7:                                 ;   Parent Loop BB8_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x16, x12, x14
	ldp	q0, q1, [x16]
	add	x16, x11, x14
	ldp	q2, q3, [x16]
	fadd.2d	v0, v0, v2
	fadd.2d	v1, v1, v3
	add	x16, x13, x14
	stp	q0, q1, [x16]
	add	x14, x14, #32
	adds	w15, w15, #1
	b.lo	LBB8_7
	b	LBB8_1
LBB8_8:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_mul                    ; -- Begin function vector2_mul
	.p2align	2
_vector2_mul:                           ; @vector2_mul
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	ldr	d0, [x1]
	mov	w14, #999
	mov	w9, #1
	mov	w10, #8000
	mov	x11, x0
	mov	x16, x2
	mov	x12, x1
	b	LBB9_2
LBB9_1:                                 ;   in Loop: Header=BB9_2 Depth=1
	madd	x12, x9, x10, x1
	add	x9, x9, #1
	sub	w14, w13, #1
	add	x11, x11, x10
	cbz	w13, LBB9_9
LBB9_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_4 Depth 2
                                        ;       Child Loop BB9_8 Depth 3
                                        ;       Child Loop BB9_6 Depth 3
	mov	x13, x14
	madd	x14, x8, x10, x0
	add	x8, x8, #1
	add	x15, x14, x10
	mov	w4, #999
	mov	w17, #1
	b	LBB9_4
LBB9_3:                                 ;   in Loop: Header=BB9_4 Depth=2
	ldr	d0, [x12, x17, lsl #3]
	madd	x16, x17, x10, x2
	add	x17, x17, #1
	sub	w4, w3, #1
	cbz	w3, LBB9_1
LBB9_4:                                 ;   Parent Loop BB9_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB9_8 Depth 3
                                        ;       Child Loop BB9_6 Depth 3
	mov	x3, x4
	add	x4, x16, x10
	cmp	x14, x4
	ccmp	x16, x15, #2, lo
	b.lo	LBB9_7
; %bb.5:                                ;   in Loop: Header=BB9_4 Depth=2
	add	x16, x16, #32
	mov	x4, #-8000
LBB9_6:                                 ;   Parent Loop BB9_2 Depth=1
                                        ;     Parent Loop BB9_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x5, x16, x4
	ldr	q1, [x5, #7968]
	ldr	q2, [x5, #7984]
	ldr	q3, [x5, #8000]
	ldr	q4, [x5, #8016]
	add	x5, x11, x4
	ldr	q5, [x5, #8000]
	ldr	q6, [x5, #8016]
	ldr	q7, [x5, #8032]
	ldr	q16, [x5, #8048]
	fmul.2d	v1, v1, v0[0]
	fmul.2d	v2, v2, v0[0]
	fmul.2d	v3, v3, v0[0]
	fmul.2d	v4, v4, v0[0]
	fadd.2d	v1, v5, v1
	fadd.2d	v2, v6, v2
	fadd.2d	v3, v7, v3
	fadd.2d	v4, v16, v4
	str	q1, [x5, #8000]
	str	q2, [x5, #8016]
	str	q3, [x5, #8032]
	str	q4, [x5, #8048]
	adds	x4, x4, #64
	b.ne	LBB9_6
	b	LBB9_3
LBB9_7:                                 ;   in Loop: Header=BB9_4 Depth=2
	mov	x4, #0
LBB9_8:                                 ;   Parent Loop BB9_2 Depth=1
                                        ;     Parent Loop BB9_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lsl	x5, x4, #3
	ldr	d1, [x16, x5]
	ldr	d2, [x11, x5]
	fmul	d1, d0, d1
	fadd	d1, d2, d1
	str	d1, [x11, x5]
	add	x4, x4, #1
	cmp	w4, #1000
	b.ne	LBB9_8
	b	LBB9_3
LBB9_9:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_transpose              ; -- Begin function vector2_transpose
	.p2align	2
_vector2_transpose:                     ; @vector2_transpose
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	mov	w9, #8000
LBB10_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_2 Depth 2
	mov	x10, #0
	mov	x11, x0
LBB10_2:                                ;   Parent Loop BB10_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x1, x10, lsl #3]
	str	d0, [x11]
	add	x10, x10, #1
	add	x11, x11, x9
	cmp	x10, #1000
	b.ne	LBB10_2
; %bb.3:                                ;   in Loop: Header=BB10_1 Depth=1
	add	x8, x8, #1
	add	x1, x1, x9
	add	x0, x0, #8
	cmp	x8, #1000
	b.ne	LBB10_1
; %bb.4:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_mul_transpose          ; -- Begin function vector2_mul_transpose
	.p2align	2
_vector2_mul_transpose:                 ; @vector2_mul_transpose
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	mov	w9, #8000
LBB11_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB11_2 Depth 2
                                        ;       Child Loop BB11_3 Depth 3
	mov	x10, #0
	mov	x11, x2
LBB11_2:                                ;   Parent Loop BB11_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB11_3 Depth 3
	mov	x12, #0
	madd	x13, x8, x9, x0
	add	x13, x13, x10, lsl #3
	ldr	d0, [x13]
LBB11_3:                                ;   Parent Loop BB11_1 Depth=1
                                        ;     Parent Loop BB11_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	lsl	x14, x12, #3
	ldr	d1, [x1, x14]
	ldr	d2, [x11, x14]
	fmul	d1, d1, d2
	fadd	d0, d0, d1
	str	d0, [x13]
	add	x12, x12, #1
	cmp	x12, #1000
	b.ne	LBB11_3
; %bb.4:                                ;   in Loop: Header=BB11_2 Depth=2
	add	x10, x10, #1
	add	x11, x11, x9
	cmp	x10, #1000
	b.ne	LBB11_2
; %bb.5:                                ;   in Loop: Header=BB11_1 Depth=1
	add	x8, x8, #1
	add	x1, x1, x9
	cmp	x8, #1000
	b.ne	LBB11_1
; %bb.6:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_mul_localized          ; -- Begin function vector2_mul_localized
	.p2align	2
_vector2_mul_localized:                 ; @vector2_mul_localized
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #176
	stp	x28, x27, [sp, #80]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 176
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
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	str	x0, [sp, #72]                   ; 8-byte Folded Spill
	cbz	w3, LBB12_2
; %bb.1:
	mov	w13, #0
	mov	w8, #0
	mov	w9, w3
	and	x21, x9, #0xfffffff8
	lsl	x11, x9, #3
	and	x12, x11, #0x7ffffffc0
	add	x10, x2, #24
	str	x10, [sp, #16]                  ; 8-byte Folded Spill
	mov	w14, #8000
	b	LBB12_4
LBB12_2:                                ; =>This Inner Loop Header: Depth=1
	b	LBB12_2
LBB12_3:                                ;   in Loop: Header=BB12_4 Depth=1
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	add	w8, w8, w3
	ldr	w13, [sp, #12]                  ; 4-byte Folded Reload
	add	w13, w13, #1
	cmp	w8, #1000
	b.hs	LBB12_28
LBB12_4:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB12_6 Depth 2
                                        ;       Child Loop BB12_8 Depth 3
                                        ;         Child Loop BB12_10 Depth 4
                                        ;           Child Loop BB12_22 Depth 5
                                        ;             Child Loop BB12_25 Depth 6
                                        ;             Child Loop BB12_27 Depth 6
                                        ;           Child Loop BB12_13 Depth 5
	mov	w15, #0
	mov	w10, #0
	str	w13, [sp, #12]                  ; 4-byte Folded Spill
	mul	w0, w13, w3
	mov	w8, w8
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	b	LBB12_6
LBB12_5:                                ;   in Loop: Header=BB12_6 Depth=2
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	add	w10, w8, w3
	ldr	w15, [sp, #28]                  ; 4-byte Folded Reload
	add	w15, w15, #1
	cmp	w10, #1000
	b.hs	LBB12_3
LBB12_6:                                ;   Parent Loop BB12_4 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB12_8 Depth 3
                                        ;         Child Loop BB12_10 Depth 4
                                        ;           Child Loop BB12_22 Depth 5
                                        ;             Child Loop BB12_25 Depth 6
                                        ;             Child Loop BB12_27 Depth 6
                                        ;           Child Loop BB12_13 Depth 5
	mov	w13, #0
	mov	w17, #0
	mov	w16, w10
	str	w15, [sp, #28]                  ; 4-byte Folded Spill
	mul	w7, w15, w3
	add	x19, x9, x7
	ldr	x8, [sp, #72]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #48]                  ; 8-byte Folded Reload
	madd	x8, x10, x14, x8
	str	x16, [sp, #56]                  ; 8-byte Folded Spill
	lsl	x10, x16, #3
	add	x8, x8, x10
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	add	x8, x8, x10
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	b	LBB12_8
LBB12_7:                                ;   in Loop: Header=BB12_8 Depth=3
	ldp	w17, w13, [sp, #64]             ; 8-byte Folded Reload
	add	w17, w17, w3
	add	w13, w13, #1
	cmp	w17, #1000
	b.hs	LBB12_5
LBB12_8:                                ;   Parent Loop BB12_4 Depth=1
                                        ;     Parent Loop BB12_6 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB12_10 Depth 4
                                        ;           Child Loop BB12_22 Depth 5
                                        ;             Child Loop BB12_25 Depth 6
                                        ;             Child Loop BB12_27 Depth 6
                                        ;           Child Loop BB12_13 Depth 5
	mov	x22, #0
	ldp	x8, x28, [sp, #32]              ; 16-byte Folded Reload
	umaddl	x23, w17, w14, x8
	stp	w17, w13, [sp, #64]             ; 8-byte Folded Spill
	mul	w24, w13, w3
	add	x25, x24, #1
	umaddl	x8, w17, w14, x2
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	add	x16, x8, x10, lsl #3
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	madd	x8, x8, x14, x1
	add	x27, x8, w17, uxtw #3
	b	LBB12_10
LBB12_9:                                ;   in Loop: Header=BB12_10 Depth=4
	add	x22, x22, #1
	add	x28, x28, x14
	add	x27, x27, x14
	cmp	w22, w3
	b.eq	LBB12_7
LBB12_10:                               ;   Parent Loop BB12_4 Depth=1
                                        ;     Parent Loop BB12_6 Depth=2
                                        ;       Parent Loop BB12_8 Depth=3
                                        ; =>      This Loop Header: Depth=4
                                        ;           Child Loop BB12_22 Depth 5
                                        ;             Child Loop BB12_25 Depth 6
                                        ;             Child Loop BB12_27 Depth 6
                                        ;           Child Loop BB12_13 Depth 5
	cmp	w3, #8
	b.hs	LBB12_20
; %bb.11:                               ;   in Loop: Header=BB12_10 Depth=4
	mov	x8, #0
	mov	x13, x23
	b	LBB12_13
LBB12_12:                               ;   in Loop: Header=BB12_13 Depth=5
	add	x8, x8, #8
	add	x13, x13, x14
	cmp	x11, x8
	b.eq	LBB12_9
LBB12_13:                               ;   Parent Loop BB12_4 Depth=1
                                        ;     Parent Loop BB12_6 Depth=2
                                        ;       Parent Loop BB12_8 Depth=3
                                        ;         Parent Loop BB12_10 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
	ldr	d0, [x27, x8]
	ldur	d1, [x13, #-24]
	fmul	d0, d0, d1
	ldr	d1, [x28]
	fadd	d0, d1, d0
	str	d0, [x28]
	cmp	w3, #1
	b.eq	LBB12_12
; %bb.14:                               ;   in Loop: Header=BB12_13 Depth=5
	ldr	d0, [x27, x8]
	ldur	d1, [x13, #-16]
	fmul	d0, d0, d1
	ldr	d1, [x28, #8]
	fadd	d0, d1, d0
	str	d0, [x28, #8]
	cmp	w3, #2
	b.eq	LBB12_12
; %bb.15:                               ;   in Loop: Header=BB12_13 Depth=5
	ldr	d0, [x27, x8]
	ldur	d1, [x13, #-8]
	fmul	d0, d0, d1
	ldr	d1, [x28, #16]
	fadd	d0, d1, d0
	str	d0, [x28, #16]
	cmp	w3, #3
	b.eq	LBB12_12
; %bb.16:                               ;   in Loop: Header=BB12_13 Depth=5
	ldr	d0, [x27, x8]
	ldr	d1, [x13]
	fmul	d0, d0, d1
	ldr	d1, [x28, #24]
	fadd	d0, d1, d0
	str	d0, [x28, #24]
	cmp	w3, #4
	b.eq	LBB12_12
; %bb.17:                               ;   in Loop: Header=BB12_13 Depth=5
	ldr	d0, [x27, x8]
	ldr	d1, [x13, #8]
	fmul	d0, d0, d1
	ldr	d1, [x28, #32]
	fadd	d0, d1, d0
	str	d0, [x28, #32]
	cmp	w3, #5
	b.eq	LBB12_12
; %bb.18:                               ;   in Loop: Header=BB12_13 Depth=5
	ldr	d0, [x27, x8]
	ldr	d1, [x13, #16]
	fmul	d0, d0, d1
	ldr	d1, [x28, #40]
	fadd	d0, d1, d0
	str	d0, [x28, #40]
	cmp	w3, #6
	b.eq	LBB12_12
; %bb.19:                               ;   in Loop: Header=BB12_13 Depth=5
	ldr	d0, [x27, x8]
	ldr	d1, [x13, #24]
	fmul	d0, d0, d1
	ldr	d1, [x28, #48]
	fadd	d0, d1, d0
	str	d0, [x28, #48]
	b	LBB12_12
LBB12_20:                               ;   in Loop: Header=BB12_10 Depth=4
	mov	x30, #0
	add	x8, x22, x0
	ldr	x10, [sp, #72]                  ; 8-byte Folded Reload
	madd	x10, x8, x14, x10
	add	x13, x10, x7, lsl #3
	add	x15, x10, x19, lsl #3
	mov	x26, x16
	b	LBB12_22
LBB12_21:                               ;   in Loop: Header=BB12_22 Depth=5
	add	x30, x30, #1
	add	x26, x26, x14
	cmp	x30, x9
	b.eq	LBB12_9
LBB12_22:                               ;   Parent Loop BB12_4 Depth=1
                                        ;     Parent Loop BB12_6 Depth=2
                                        ;       Parent Loop BB12_8 Depth=3
                                        ;         Parent Loop BB12_10 Depth=4
                                        ; =>        This Loop Header: Depth=5
                                        ;             Child Loop BB12_25 Depth 6
                                        ;             Child Loop BB12_27 Depth 6
	mov	x10, #0
	add	x6, x30, x24
	madd	x20, x6, x14, x2
	add	x4, x25, x30
	madd	x5, x8, x14, x1
	add	x4, x5, x4, lsl #3
	add	x5, x5, x6, lsl #3
	add	x6, x20, x19, lsl #3
	add	x17, x20, x7, lsl #3
	cmp	x13, x4
	cset	w4, lo
	cmp	x5, x15
	cset	w5, lo
	and	w4, w4, w5
	cmp	x13, x6
	cset	w20, lo
	cmp	x17, x15
	cset	w6, lo
	tbnz	w4, #0, LBB12_27
; %bb.23:                               ;   in Loop: Header=BB12_22 Depth=5
	and	w17, w20, w6
	tbnz	w17, #0, LBB12_27
; %bb.24:                               ;   in Loop: Header=BB12_22 Depth=5
	mov	x10, #0
	add	x17, x27, x30, lsl #3
	ld1r.2d	{ v0 }, [x17]
LBB12_25:                               ;   Parent Loop BB12_4 Depth=1
                                        ;     Parent Loop BB12_6 Depth=2
                                        ;       Parent Loop BB12_8 Depth=3
                                        ;         Parent Loop BB12_10 Depth=4
                                        ;           Parent Loop BB12_22 Depth=5
                                        ; =>          This Inner Loop Header: Depth=6
	add	x17, x26, x10
	ldp	q1, q2, [x17]
	ldp	q3, q4, [x17, #32]
	fmul.2d	v1, v0, v1
	fmul.2d	v2, v0, v2
	fmul.2d	v3, v0, v3
	fmul.2d	v4, v0, v4
	add	x17, x28, x10
	ldp	q5, q6, [x17]
	ldp	q7, q16, [x17, #32]
	fadd.2d	v1, v5, v1
	fadd.2d	v2, v6, v2
	fadd.2d	v3, v7, v3
	fadd.2d	v4, v16, v4
	stp	q1, q2, [x17]
	stp	q3, q4, [x17, #32]
	add	x10, x10, #64
	cmp	x12, x10
	b.ne	LBB12_25
; %bb.26:                               ;   in Loop: Header=BB12_22 Depth=5
	mov	x10, x21
	cmp	x21, x9
	b.eq	LBB12_21
LBB12_27:                               ;   Parent Loop BB12_4 Depth=1
                                        ;     Parent Loop BB12_6 Depth=2
                                        ;       Parent Loop BB12_8 Depth=3
                                        ;         Parent Loop BB12_10 Depth=4
                                        ;           Parent Loop BB12_22 Depth=5
                                        ; =>          This Inner Loop Header: Depth=6
	ldr	d0, [x27, x30, lsl #3]
	lsl	x17, x10, #3
	ldr	d1, [x26, x17]
	ldr	d2, [x28, x17]
	fmul	d0, d0, d1
	fadd	d0, d2, d0
	str	d0, [x28, x17]
	add	x10, x10, #1
	cmp	x9, x10
	b.ne	LBB12_27
	b	LBB12_21
LBB12_28:
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_sum_rows               ; -- Begin function vector2_sum_rows
	.p2align	2
_vector2_sum_rows:                      ; @vector2_sum_rows
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	add	x9, x1, #16
	mov	w10, #1000
	mov	w11, #8000
LBB13_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB13_2 Depth 2
	movi	d0, #0000000000000000
	mov	w12, #-250
	mov	x13, x9
	movi	d1, #0000000000000000
	movi	d2, #0000000000000000
	movi	d3, #0000000000000000
LBB13_2:                                ;   Parent Loop BB13_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	d4, d5, [x13, #-16]
	fadd	d0, d0, d4
	fadd	d1, d1, d5
	ldp	d4, d5, [x13], #32
	fadd	d2, d2, d4
	fadd	d3, d3, d5
	adds	w12, w12, #1
	b.lo	LBB13_2
; %bb.3:                                ;   in Loop: Header=BB13_1 Depth=1
	fadd	d0, d0, d1
	fadd	d1, d2, d3
	fadd	d0, d0, d1
	str	d0, [x0, x8, lsl #3]
	add	x8, x8, #1
	add	x9, x9, x11
	subs	w10, w10, #1
	b.ne	LBB13_1
; %bb.4:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_sum_cols               ; -- Begin function vector2_sum_cols
	.p2align	2
_vector2_sum_cols:                      ; @vector2_sum_cols
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	mov	w9, #8000
LBB14_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_2 Depth 2
	str	xzr, [x0, x8, lsl #3]
	movi	d0, #0000000000000000
	mov	w10, #1000
	mov	x11, x1
LBB14_2:                                ;   Parent Loop BB14_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d1, [x11]
	fadd	d0, d1, d0
	str	d0, [x0, x8, lsl #3]
	add	x11, x11, x9
	subs	x10, x10, #1
	b.ne	LBB14_2
; %bb.3:                                ;   in Loop: Header=BB14_1 Depth=1
	add	x8, x8, #1
	add	x1, x1, #8
	cmp	x8, #1000
	b.ne	LBB14_1
; %bb.4:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_print_vector2_data     ; -- Begin function vector2_print_vector2_data
	.p2align	2
_vector2_print_vector2_data:            ; @vector2_print_vector2_data
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
	mov	x19, x0
	mov	x22, #0
Lloh4:
	adrp	x20, l_.str.5@PAGE
Lloh5:
	add	x20, x20, l_.str.5@PAGEOFF
	mov	w23, #8000
Lloh6:
	adrp	x21, l_.str.6@PAGE
Lloh7:
	add	x21, x21, l_.str.6@PAGEOFF
LBB15_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB15_2 Depth 2
	str	x22, [sp]
	mov	x0, x20
	bl	_printf
	mov	x24, #0
LBB15_2:                                ;   Parent Loop BB15_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x19, x24, lsl #3]
	str	d0, [sp, #8]
	str	x24, [sp]
	mov	x0, x21
	bl	_printf
	add	x24, x24, #1
	cmp	x24, #1000
	b.ne	LBB15_2
; %bb.3:                                ;   in Loop: Header=BB15_1 Depth=1
	mov	w0, #10
	bl	_putchar
	add	x22, x22, #1
	add	x19, x19, x23
	cmp	x22, #1000
	b.ne	LBB15_1
; %bb.4:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_rand_init_vector2      ; -- Begin function vector2_rand_init_vector2
	.p2align	2
_vector2_rand_init_vector2:             ; @vector2_rand_init_vector2
	.cfi_startproc
; %bb.0:
	stp	d11, d10, [sp, #-80]!           ; 16-byte Folded Spill
	stp	d9, d8, [sp, #16]               ; 16-byte Folded Spill
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
	.cfi_offset b8, -56
	.cfi_offset b9, -64
	.cfi_offset b10, -72
	.cfi_offset b11, -80
	fmov	d8, d1
	fmov	d9, d0
	mov	x19, x0
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	mov	x20, #0
	mov	x8, #2097152
	movk	x8, #15872, lsl #48
	fmov	d0, x8
	fmul	d9, d9, d0
	fmul	d8, d8, d0
	mov	w21, #8000
LBB16_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB16_2 Depth 2
	mov	x22, #0
LBB16_2:                                ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x19, x22, lsl #3]
	add	x22, x22, #1
	cmp	x22, #1000
	b.ne	LBB16_2
; %bb.3:                                ;   in Loop: Header=BB16_1 Depth=1
	add	x20, x20, #1
	add	x19, x19, x21
	cmp	x20, #1000
	b.ne	LBB16_1
; %bb.4:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #16]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp], #80             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_zero_init_vector2      ; -- Begin function vector2_zero_init_vector2
	.p2align	2
_vector2_zero_init_vector2:             ; @vector2_zero_init_vector2
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w1, #4608
	movk	w1, #122, lsl #16
	bl	_bzero
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_print_rowsum1_data     ; -- Begin function vector2_print_rowsum1_data
	.p2align	2
_vector2_print_rowsum1_data:            ; @vector2_print_rowsum1_data
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
	mov	x19, x0
	mov	x21, #0
Lloh8:
	adrp	x20, l_.str.8@PAGE
Lloh9:
	add	x20, x20, l_.str.8@PAGEOFF
LBB18_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x19, x21, lsl #3]
	str	d0, [sp, #8]
	str	x21, [sp]
	mov	x0, x20
	bl	_printf
	add	x21, x21, #1
	cmp	x21, #1000
	b.ne	LBB18_1
; %bb.2:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh8, Lloh9
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_print_colsum1_data     ; -- Begin function vector2_print_colsum1_data
	.p2align	2
_vector2_print_colsum1_data:            ; @vector2_print_colsum1_data
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
	mov	x19, x0
	mov	x21, #0
Lloh10:
	adrp	x20, l_.str.9@PAGE
Lloh11:
	add	x20, x20, l_.str.9@PAGEOFF
LBB19_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x19, x21, lsl #3]
	str	d0, [sp, #8]
	str	x21, [sp]
	mov	x0, x20
	bl	_printf
	add	x21, x21, #1
	cmp	x21, #1000
	b.ne	LBB19_1
; %bb.2:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh10, Lloh11
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function vector2_alloc_vector2_aligned.cold.1
_vector2_alloc_vector2_aligned.cold.1:  ; @vector2_alloc_vector2_aligned.cold.1
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh12:
	adrp	x0, l___func__.vector2_alloc_vector2_aligned@PAGE
Lloh13:
	add	x0, x0, l___func__.vector2_alloc_vector2_aligned@PAGEOFF
Lloh14:
	adrp	x1, l_.str.2@PAGE
Lloh15:
	add	x1, x1, l_.str.2@PAGEOFF
Lloh16:
	adrp	x3, l_.str.3@PAGE
Lloh17:
	add	x3, x3, l_.str.3@PAGEOFF
	mov	w2, #34
	bl	___assert_rtn
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function vector2_alloc_vector2_aligned.cold.2
_vector2_alloc_vector2_aligned.cold.2:  ; @vector2_alloc_vector2_aligned.cold.2
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh18:
	adrp	x0, l___func__.vector2_alloc_vector2_aligned@PAGE
Lloh19:
	add	x0, x0, l___func__.vector2_alloc_vector2_aligned@PAGEOFF
Lloh20:
	adrp	x1, l_.str.2@PAGE
Lloh21:
	add	x1, x1, l_.str.2@PAGEOFF
Lloh22:
	adrp	x3, l_.str.4@PAGE
Lloh23:
	add	x3, x3, l_.str.4@PAGEOFF
	mov	w2, #40
	bl	___assert_rtn
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh18, Lloh19
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"sizeof(vector2_t) = %zu\n"

l_.str.1:                               ; @.str.1
	.asciz	"alignof(vector2_t) = %zu\n"

l___func__.vector2_alloc_vector2_aligned: ; @__func__.vector2_alloc_vector2_aligned
	.asciz	"vector2_alloc_vector2_aligned"

l_.str.2:                               ; @.str.2
	.asciz	"vec2.c"

l_.str.3:                               ; @.str.3
	.asciz	"(alignment == 128) | (alignment == 64) | (alignment == 32) | (alignment == 16) | (alignment == 8) | (alignment == 4)"

l_.str.4:                               ; @.str.4
	.asciz	"( size & (alignment - 1) ) == 0"

l_.str.5:                               ; @.str.5
	.asciz	"[%d] => "

l_.str.6:                               ; @.str.6
	.asciz	"[%d] = %.4f, "

l_.str.8:                               ; @.str.8
	.asciz	"sum of the %d-th row = %.4f\n"

l_.str.9:                               ; @.str.9
	.asciz	"sum of the %d-th column = %.4f\n"

.subsections_via_symbols
