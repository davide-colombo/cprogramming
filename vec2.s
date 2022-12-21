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
	mov	w8, #44424
	movk	w8, #608, lsl #16
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
	mov	w0, #44424
	movk	w0, #608, lsl #16
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
	mov	w9, #44424
	movk	w9, #608, lsl #16
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
	cbz	x0, LBB3_2
; %bb.1:
	b	_free
LBB3_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_alloc_rowsum1          ; -- Begin function vector2_alloc_rowsum1
	.p2align	2
_vector2_alloc_rowsum1:                 ; @vector2_alloc_rowsum1
	.cfi_startproc
; %bb.0:
	mov	w0, #17864
	b	_malloc
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_free_rowsum1           ; -- Begin function vector2_free_rowsum1
	.p2align	2
_vector2_free_rowsum1:                  ; @vector2_free_rowsum1
	.cfi_startproc
; %bb.0:
	cbz	x0, LBB5_2
; %bb.1:
	b	_free
LBB5_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_alloc_colsum1          ; -- Begin function vector2_alloc_colsum1
	.p2align	2
_vector2_alloc_colsum1:                 ; @vector2_alloc_colsum1
	.cfi_startproc
; %bb.0:
	mov	w0, #17864
	b	_malloc
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_free_colsum1           ; -- Begin function vector2_free_colsum1
	.p2align	2
_vector2_free_colsum1:                  ; @vector2_free_colsum1
	.cfi_startproc
; %bb.0:
	cbz	x0, LBB7_2
; %bb.1:
	b	_free
LBB7_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_add                    ; -- Begin function vector2_add
	.p2align	2
_vector2_add:                           ; @vector2_add
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	mov	w9, #2233
	mov	w10, #17864
	mov	w11, #17856
	mov	x12, x2
	mov	x13, x1
	mov	x14, x0
	b	LBB8_2
LBB8_1:                                 ;   in Loop: Header=BB8_2 Depth=1
	mul	x15, x8, x10
	add	x16, x1, x15
	ldr	d0, [x16, #17824]
	add	x16, x2, x15
	ldr	d1, [x16, #17824]
	add	x15, x0, x15
	add	x8, x8, #1
	fadd	d0, d0, d1
	str	d0, [x15, #17824]
	add	x14, x14, x10
	add	x13, x13, x10
	add	x12, x12, x10
	subs	w9, w9, #1
	b.eq	LBB8_8
LBB8_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_5 Depth 2
                                        ;     Child Loop BB8_7 Depth 2
	mul	x15, x8, x10
	add	x16, x0, x15
	add	x17, x16, x11
	add	x3, x2, x15
	add	x4, x3, x11
	add	x15, x1, x15
	add	x5, x15, x11
	cmp	x16, x5
	cset	w5, lo
	cmp	x15, x17
	cset	w15, lo
	and	w5, w5, w15
	cmp	x16, x4
	cset	w15, lo
	cmp	x3, x17
	cset	w16, lo
	tbnz	w5, #0, LBB8_6
; %bb.3:                                ;   in Loop: Header=BB8_2 Depth=1
	and	w15, w15, w16
	tbnz	w15, #0, LBB8_6
; %bb.4:                                ;   in Loop: Header=BB8_2 Depth=1
	mov	x15, #-17856
LBB8_5:                                 ;   Parent Loop BB8_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x16, x13, x15
	add	x16, x16, x11
	ld4.2d	{ v0, v1, v2, v3 }, [x16]
	add	x16, x12, x15
	add	x16, x16, x11
	ld4.2d	{ v4, v5, v6, v7 }, [x16]
	fadd.2d	v16, v0, v4
	fadd.2d	v17, v1, v5
	fadd.2d	v18, v2, v6
	fadd.2d	v19, v3, v7
	add	x16, x14, x15
	add	x16, x16, x11
	st4.2d	{ v16, v17, v18, v19 }, [x16]
	adds	x15, x15, #64
	b.ne	LBB8_5
	b	LBB8_1
LBB8_6:                                 ;   in Loop: Header=BB8_2 Depth=1
	mov	x15, #0
	mov	w16, #-558
LBB8_7:                                 ;   Parent Loop BB8_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x17, x13, x15
	ldp	q0, q1, [x17]
	add	x17, x12, x15
	ldp	q2, q3, [x17]
	fadd.2d	v0, v0, v2
	fadd.2d	v1, v1, v3
	add	x17, x14, x15
	stp	q0, q1, [x17]
	add	x15, x15, #32
	adds	w16, w16, #1
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
	mov	w9, #17864
LBB9_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_2 Depth 2
                                        ;       Child Loop BB9_3 Depth 3
	mov	x10, #0
	mov	x11, x2
LBB9_2:                                 ;   Parent Loop BB9_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB9_3 Depth 3
	mov	x12, #0
	madd	x13, x8, x9, x0
	add	x13, x13, x10, lsl #3
	mov	x14, x11
LBB9_3:                                 ;   Parent Loop BB9_1 Depth=1
                                        ;     Parent Loop BB9_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d0, [x1, x12, lsl #3]
	ldr	d1, [x14]
	fmul	d0, d0, d1
	str	d0, [x13]
	add	x12, x12, #1
	add	x14, x14, x9
	cmp	x12, #2233
	b.ne	LBB9_3
; %bb.4:                                ;   in Loop: Header=BB9_2 Depth=2
	add	x10, x10, #1
	add	x11, x11, #8
	cmp	x10, #2233
	b.ne	LBB9_2
; %bb.5:                                ;   in Loop: Header=BB9_1 Depth=1
	add	x8, x8, #1
	add	x1, x1, x9
	cmp	x8, #2233
	b.ne	LBB9_1
; %bb.6:
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
	mov	w10, #2233
	mov	w11, #17864
LBB10_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_2 Depth 2
	movi	d0, #0000000000000000
	mov	w12, #-558
	mov	x13, x9
	movi	d1, #0000000000000000
	movi	d2, #0000000000000000
	movi	d3, #0000000000000000
LBB10_2:                                ;   Parent Loop BB10_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	d4, d5, [x13, #-16]
	fadd	d0, d0, d4
	fadd	d1, d1, d5
	ldp	d4, d5, [x13], #32
	fadd	d2, d2, d4
	fadd	d3, d3, d5
	adds	w12, w12, #1
	b.lo	LBB10_2
; %bb.3:                                ;   in Loop: Header=BB10_1 Depth=1
	madd	x12, x8, x11, x1
	ldr	d4, [x12, #17856]
	fadd	d0, d0, d4
	fadd	d0, d1, d0
	fadd	d1, d2, d3
	fadd	d0, d1, d0
	str	d0, [x0, x8, lsl #3]
	add	x8, x8, #1
	add	x9, x9, x11
	subs	w10, w10, #1
	b.ne	LBB10_1
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
	mov	w9, #17864
LBB11_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB11_2 Depth 2
	str	xzr, [x0, x8, lsl #3]
	movi	d0, #0000000000000000
	mov	w10, #2233
	mov	x11, x1
LBB11_2:                                ;   Parent Loop BB11_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d1, [x11]
	fadd	d0, d1, d0
	str	d0, [x0, x8, lsl #3]
	add	x11, x11, x9
	subs	x10, x10, #1
	b.ne	LBB11_2
; %bb.3:                                ;   in Loop: Header=BB11_1 Depth=1
	add	x8, x8, #1
	add	x1, x1, #8
	cmp	x8, #2233
	b.ne	LBB11_1
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
	mov	w23, #17864
Lloh6:
	adrp	x21, l_.str.6@PAGE
Lloh7:
	add	x21, x21, l_.str.6@PAGEOFF
LBB12_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB12_2 Depth 2
	str	x22, [sp]
	mov	x0, x20
	bl	_printf
	mov	x24, #0
LBB12_2:                                ;   Parent Loop BB12_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x19, x24, lsl #3]
	str	d0, [sp, #8]
	str	x24, [sp]
	mov	x0, x21
	bl	_printf
	add	x24, x24, #1
	cmp	x24, #2233
	b.ne	LBB12_2
; %bb.3:                                ;   in Loop: Header=BB12_1 Depth=1
	mov	w0, #10
	bl	_putchar
	add	x22, x22, #1
	add	x19, x19, x23
	cmp	x22, #2233
	b.ne	LBB12_1
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
	mov	w21, #17864
LBB13_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB13_2 Depth 2
	mov	x22, #0
LBB13_2:                                ;   Parent Loop BB13_1 Depth=1
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
	cmp	x22, #2233
	b.ne	LBB13_2
; %bb.3:                                ;   in Loop: Header=BB13_1 Depth=1
	add	x20, x20, #1
	add	x19, x19, x21
	cmp	x20, #2233
	b.ne	LBB13_1
; %bb.4:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #16]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp], #80             ; 16-byte Folded Reload
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
LBB14_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x19, x21, lsl #3]
	str	d0, [sp, #8]
	str	x21, [sp]
	mov	x0, x20
	bl	_printf
	add	x21, x21, #1
	cmp	x21, #2233
	b.ne	LBB14_1
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
LBB15_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x19, x21, lsl #3]
	str	d0, [sp, #8]
	str	x21, [sp]
	mov	x0, x20
	bl	_printf
	add	x21, x21, #1
	cmp	x21, #2233
	b.ne	LBB15_1
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
	mov	w2, #33
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
	mov	w2, #39
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
