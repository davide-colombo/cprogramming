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
	mov	w8, #134217728
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
	mov	w0, #134217728
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
	and	x9, x8, #0x8000000
	mov	w10, #134217728
	sub	x9, x0, x9
	add	x1, x9, x10
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
	mov	w0, #32768
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
	mov	w0, #32768
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
	mov	w9, #4096
	mov	x10, x2
	mov	x11, x1
	mov	x12, x0
	b	LBB8_2
LBB8_1:                                 ;   in Loop: Header=BB8_2 Depth=1
	add	x8, x8, #1
	add	x12, x12, #8, lsl #12           ; =32768
	add	x11, x11, #8, lsl #12           ; =32768
	add	x10, x10, #8, lsl #12           ; =32768
	subs	w9, w9, #1
	b.eq	LBB8_8
LBB8_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_5 Depth 2
                                        ;     Child Loop BB8_7 Depth 2
	lsl	x14, x8, #15
	add	x13, x0, x14
	add	x15, x14, #8, lsl #12           ; =32768
	add	x16, x0, x15
	add	x17, x1, x15
	cmp	x13, x17
	cset	w17, lo
	add	x3, x1, x14
	cmp	x3, x16
	cset	w3, lo
	and	w17, w17, w3
	add	x15, x2, x15
	cmp	x13, x15
	cset	w13, lo
	add	x14, x2, x14
	cmp	x14, x16
	cset	w14, lo
	tbnz	w17, #0, LBB8_6
; %bb.3:                                ;   in Loop: Header=BB8_2 Depth=1
	and	w13, w13, w14
	tbnz	w13, #0, LBB8_6
; %bb.4:                                ;   in Loop: Header=BB8_2 Depth=1
	mov	x13, #0
LBB8_5:                                 ;   Parent Loop BB8_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x14, x11, x13
	ld4.2d	{ v0, v1, v2, v3 }, [x14]
	add	x14, x10, x13
	ld4.2d	{ v4, v5, v6, v7 }, [x14]
	fadd.2d	v16, v0, v4
	fadd.2d	v17, v1, v5
	fadd.2d	v18, v2, v6
	fadd.2d	v19, v3, v7
	add	x14, x12, x13
	st4.2d	{ v16, v17, v18, v19 }, [x14]
	add	x13, x13, #64
	cmp	x13, #8, lsl #12                ; =32768
	b.ne	LBB8_5
	b	LBB8_1
LBB8_6:                                 ;   in Loop: Header=BB8_2 Depth=1
	mov	x13, #0
LBB8_7:                                 ;   Parent Loop BB8_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x14, x11, x13
	ldp	q0, q1, [x14]
	add	x14, x10, x13
	ldp	q2, q3, [x14]
	fadd.2d	v0, v0, v2
	fadd.2d	v1, v1, v3
	add	x14, x12, x13
	stp	q0, q1, [x14]
	add	x13, x13, #32
	cmp	w13, #8, lsl #12                ; =32768
	b.ne	LBB8_7
	b	LBB8_1
LBB8_8:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_mul1                   ; -- Begin function vector2_mul1
	.p2align	2
_vector2_mul1:                          ; @vector2_mul1
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #144
	stp	x28, x27, [sp, #48]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #64]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #80]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 144
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
	mov	w13, #0
	mov	w8, #0
	mov	w9, w3
	and	x12, x9, #0xfffffff8
	lsl	x10, x9, #3
	and	x11, x10, #0x7ffffffc0
	b	LBB9_2
LBB9_1:                                 ;   in Loop: Header=BB9_2 Depth=1
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	w8, w8, w3
	ldr	w13, [sp, #12]                  ; 4-byte Folded Reload
	add	w13, w13, #1
	cmp	w8, #1, lsl #12                 ; =4096
	b.hs	LBB9_19
LBB9_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_4 Depth 2
                                        ;       Child Loop BB9_6 Depth 3
                                        ;         Child Loop BB9_9 Depth 4
                                        ;           Child Loop BB9_11 Depth 5
                                        ;             Child Loop BB9_16 Depth 6
                                        ;             Child Loop BB9_18 Depth 6
	mov	w10, #0
	mov	w15, #0
	str	w13, [sp, #12]                  ; 4-byte Folded Spill
	mul	w14, w13, w3
	add	x16, x9, x14
	add	x17, x14, #1
	mov	w8, w8
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	b	LBB9_4
LBB9_3:                                 ;   in Loop: Header=BB9_4 Depth=2
	ldp	w15, w10, [sp, #16]             ; 8-byte Folded Reload
	add	w15, w15, w3
	add	w10, w10, #1
	cmp	w15, #1, lsl #12                ; =4096
	b.hs	LBB9_1
LBB9_4:                                 ;   Parent Loop BB9_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB9_6 Depth 3
                                        ;         Child Loop BB9_9 Depth 4
                                        ;           Child Loop BB9_11 Depth 5
                                        ;             Child Loop BB9_16 Depth 6
                                        ;             Child Loop BB9_18 Depth 6
	mov	w4, #0
	mov	w5, #0
	stp	w15, w10, [sp, #16]             ; 8-byte Folded Spill
	mul	w6, w10, w3
	mov	w8, w15
	lsl	x8, x8, #15
	ldr	x10, [sp, #40]                  ; 8-byte Folded Reload
	lsl	x10, x10, #3
	add	x13, x0, x8
	add	x13, x13, x10
	add	x8, x1, x8
	add	x8, x8, x10
	stp	x8, x13, [sp, #24]              ; 16-byte Folded Spill
	b	LBB9_6
LBB9_5:                                 ;   in Loop: Header=BB9_6 Depth=3
	add	w5, w5, w3
	add	w4, w4, #1
	cmp	w5, #1, lsl #12                 ; =4096
	b.hs	LBB9_3
LBB9_6:                                 ;   Parent Loop BB9_2 Depth=1
                                        ;     Parent Loop BB9_4 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB9_9 Depth 4
                                        ;           Child Loop BB9_11 Depth 5
                                        ;             Child Loop BB9_16 Depth 6
                                        ;             Child Loop BB9_18 Depth 6
	cbz	w3, LBB9_5
; %bb.7:                                ;   in Loop: Header=BB9_6 Depth=3
	mov	x20, #0
	mul	w21, w4, w3
	add	x22, x9, x21
	ldp	x24, x8, [sp, #32]              ; 16-byte Folded Reload
	add	x8, x2, x8, lsl #15
	add	x8, x8, w5, uxtw #3
	ldr	x25, [sp, #24]                  ; 8-byte Folded Reload
	b	LBB9_9
LBB9_8:                                 ;   in Loop: Header=BB9_9 Depth=4
	add	x20, x20, #1
	add	x24, x24, #8, lsl #12           ; =32768
	add	x25, x25, #8, lsl #12           ; =32768
	cmp	w20, w3
	b.eq	LBB9_5
LBB9_9:                                 ;   Parent Loop BB9_2 Depth=1
                                        ;     Parent Loop BB9_4 Depth=2
                                        ;       Parent Loop BB9_6 Depth=3
                                        ; =>      This Loop Header: Depth=4
                                        ;           Child Loop BB9_11 Depth 5
                                        ;             Child Loop BB9_16 Depth 6
                                        ;             Child Loop BB9_18 Depth 6
	mov	x26, #0
	add	x27, x20, x6
	add	x10, x0, x27, lsl #15
	add	x28, x10, x14, lsl #3
	add	x30, x10, x16, lsl #3
	mov	x23, x8
	b	LBB9_11
LBB9_10:                                ;   in Loop: Header=BB9_11 Depth=5
	add	x26, x26, #1
	add	x23, x23, #8, lsl #12           ; =32768
	cmp	x26, x9
	b.eq	LBB9_8
LBB9_11:                                ;   Parent Loop BB9_2 Depth=1
                                        ;     Parent Loop BB9_4 Depth=2
                                        ;       Parent Loop BB9_6 Depth=3
                                        ;         Parent Loop BB9_9 Depth=4
                                        ; =>        This Loop Header: Depth=5
                                        ;             Child Loop BB9_16 Depth 6
                                        ;             Child Loop BB9_18 Depth 6
	cmp	w3, #8
	b.hs	LBB9_13
; %bb.12:                               ;   in Loop: Header=BB9_11 Depth=5
	mov	x10, #0
	b	LBB9_18
LBB9_13:                                ;   in Loop: Header=BB9_11 Depth=5
	mov	x10, #0
	add	x13, x26, x14
	add	x15, x17, x26
	add	x7, x1, x27, lsl #15
	add	x15, x7, x15, lsl #3
	add	x7, x7, x13, lsl #3
	add	x13, x2, x13, lsl #15
	add	x19, x13, x22, lsl #3
	add	x13, x13, x21, lsl #3
	cmp	x28, x19
	cset	w19, lo
	cmp	x13, x30
	cset	w13, lo
	and	w19, w19, w13
	cmp	x28, x15
	cset	w13, lo
	cmp	x7, x30
	cset	w15, lo
	tbnz	w19, #0, LBB9_18
; %bb.14:                               ;   in Loop: Header=BB9_11 Depth=5
	and	w13, w13, w15
	tbnz	w13, #0, LBB9_18
; %bb.15:                               ;   in Loop: Header=BB9_11 Depth=5
	mov	x10, #0
	add	x13, x25, x26, lsl #3
	ld1r.2d	{ v0 }, [x13]
LBB9_16:                                ;   Parent Loop BB9_2 Depth=1
                                        ;     Parent Loop BB9_4 Depth=2
                                        ;       Parent Loop BB9_6 Depth=3
                                        ;         Parent Loop BB9_9 Depth=4
                                        ;           Parent Loop BB9_11 Depth=5
                                        ; =>          This Inner Loop Header: Depth=6
	add	x13, x23, x10
	ldp	q1, q2, [x13]
	ldp	q3, q4, [x13, #32]
	ldr	d5, [x25, x26, lsl #3]
	add	x13, x24, x10
	ldp	q6, q7, [x13]
	ldp	q16, q17, [x13, #32]
	fmul.2d	v1, v1, v0
	fmul.2d	v2, v2, v0
	fmul.2d	v3, v3, v0
	fmul.2d	v4, v4, v5[0]
	fadd.2d	v1, v6, v1
	fadd.2d	v2, v7, v2
	fadd.2d	v3, v16, v3
	fadd.2d	v4, v17, v4
	stp	q1, q2, [x13]
	stp	q3, q4, [x13, #32]
	add	x10, x10, #64
	cmp	x11, x10
	b.ne	LBB9_16
; %bb.17:                               ;   in Loop: Header=BB9_11 Depth=5
	mov	x10, x12
	cmp	x12, x9
	b.eq	LBB9_10
LBB9_18:                                ;   Parent Loop BB9_2 Depth=1
                                        ;     Parent Loop BB9_4 Depth=2
                                        ;       Parent Loop BB9_6 Depth=3
                                        ;         Parent Loop BB9_9 Depth=4
                                        ;           Parent Loop BB9_11 Depth=5
                                        ; =>          This Inner Loop Header: Depth=6
	lsl	x13, x10, #3
	ldr	d0, [x23, x13]
	ldr	d1, [x25, x26, lsl #3]
	ldr	d2, [x24, x13]
	fmul	d0, d0, d1
	fadd	d0, d2, d0
	str	d0, [x24, x13]
	add	x10, x10, #1
	cmp	x9, x10
	b.ne	LBB9_18
	b	LBB9_10
LBB9_19:
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_mul                    ; -- Begin function vector2_mul
	.p2align	2
_vector2_mul:                           ; @vector2_mul
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	add	x9, x2, #32
	mov	x10, x0
	b	LBB10_2
LBB10_1:                                ;   in Loop: Header=BB10_2 Depth=1
	add	x8, x8, #1
	add	x10, x10, #8, lsl #12           ; =32768
	cmp	x8, #1, lsl #12                 ; =4096
	b.eq	LBB10_9
LBB10_2:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_4 Depth 2
                                        ;       Child Loop BB10_8 Depth 3
                                        ;       Child Loop BB10_6 Depth 3
	mov	x11, #0
	add	x12, x0, x8, lsl #15
	add	x13, x12, #8, lsl #12           ; =32768
	mov	x14, x2
	mov	x15, x9
	b	LBB10_4
LBB10_3:                                ;   in Loop: Header=BB10_4 Depth=2
	add	x11, x11, #1
	add	x15, x15, #8, lsl #12           ; =32768
	add	x14, x14, #8, lsl #12           ; =32768
	cmp	x11, #1, lsl #12                ; =4096
	b.eq	LBB10_1
LBB10_4:                                ;   Parent Loop BB10_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB10_8 Depth 3
                                        ;       Child Loop BB10_6 Depth 3
	add	x16, x1, x8, lsl #15
	ldr	d0, [x16, x11, lsl #3]
	add	x16, x2, x11, lsl #15
	add	x17, x16, #8, lsl #12           ; =32768
	cmp	x12, x17
	ccmp	x16, x13, #2, lo
	b.lo	LBB10_7
; %bb.5:                                ;   in Loop: Header=BB10_4 Depth=2
	mov	x16, #0
	dup.2d	v1, v0[0]
LBB10_6:                                ;   Parent Loop BB10_2 Depth=1
                                        ;     Parent Loop BB10_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	x17, x15, x16
	ldp	q2, q3, [x17, #-32]
	ldp	q4, q5, [x17]
	fmul.2d	v2, v1, v2
	fmul.2d	v3, v1, v3
	fmul.2d	v4, v1, v4
	fmul.2d	v5, v5, v0[0]
	add	x17, x10, x16
	ldp	q6, q7, [x17]
	ldp	q16, q17, [x17, #32]
	fadd.2d	v2, v6, v2
	fadd.2d	v3, v7, v3
	fadd.2d	v4, v16, v4
	fadd.2d	v5, v17, v5
	stp	q2, q3, [x17]
	stp	q4, q5, [x17, #32]
	add	x16, x16, #64
	cmp	x16, #8, lsl #12                ; =32768
	b.ne	LBB10_6
	b	LBB10_3
LBB10_7:                                ;   in Loop: Header=BB10_4 Depth=2
	mov	x16, #0
LBB10_8:                                ;   Parent Loop BB10_2 Depth=1
                                        ;     Parent Loop BB10_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d1, [x14, x16]
	ldr	d2, [x10, x16]
	fmul	d1, d0, d1
	fadd	d1, d2, d1
	str	d1, [x10, x16]
	add	x16, x16, #8
	cmp	x16, #8, lsl #12                ; =32768
	b.ne	LBB10_8
	b	LBB10_3
LBB10_9:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_transpose              ; -- Begin function vector2_transpose
	.p2align	2
_vector2_transpose:                     ; @vector2_transpose
	.cfi_startproc
; %bb.0:
	mov	x8, #0
LBB11_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB11_2 Depth 2
	mov	x9, #0
	mov	x10, x0
LBB11_2:                                ;   Parent Loop BB11_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x1, x9]
	str	d0, [x10]
	add	x9, x9, #8
	add	x10, x10, #8, lsl #12           ; =32768
	cmp	x9, #8, lsl #12                 ; =32768
	b.ne	LBB11_2
; %bb.3:                                ;   in Loop: Header=BB11_1 Depth=1
	add	x8, x8, #1
	add	x1, x1, #8, lsl #12             ; =32768
	add	x0, x0, #8
	cmp	x8, #1, lsl #12                 ; =4096
	b.ne	LBB11_1
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
LBB12_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB12_2 Depth 2
                                        ;       Child Loop BB12_3 Depth 3
	mov	x9, #0
	mov	x10, x2
LBB12_2:                                ;   Parent Loop BB12_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB12_3 Depth 3
	mov	x11, #0
	add	x12, x0, x8, lsl #15
	add	x12, x12, x9, lsl #3
	ldr	d0, [x12]
LBB12_3:                                ;   Parent Loop BB12_1 Depth=1
                                        ;     Parent Loop BB12_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	d1, [x1, x11]
	ldr	d2, [x10, x11]
	fmul	d1, d1, d2
	fadd	d0, d0, d1
	str	d0, [x12]
	add	x11, x11, #8
	cmp	x11, #8, lsl #12                ; =32768
	b.ne	LBB12_3
; %bb.4:                                ;   in Loop: Header=BB12_2 Depth=2
	add	x9, x9, #1
	add	x10, x10, #8, lsl #12           ; =32768
	cmp	x9, #1, lsl #12                 ; =4096
	b.ne	LBB12_2
; %bb.5:                                ;   in Loop: Header=BB12_1 Depth=1
	add	x8, x8, #1
	add	x1, x1, #8, lsl #12             ; =32768
	cmp	x8, #1, lsl #12                 ; =4096
	b.ne	LBB12_1
; %bb.6:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_mul_localized          ; -- Begin function vector2_mul_localized
	.p2align	2
_vector2_mul_localized:                 ; @vector2_mul_localized
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	stp	x28, x27, [sp, #32]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #48]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 128
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
	mov	w12, #0
	mov	w13, #0
	mov	w9, w3
	and	x10, x9, #0xfffffff8
	lsl	x8, x9, #3
	and	x11, x8, #0x7ffffffc0
	b	LBB13_2
LBB13_1:                                ;   in Loop: Header=BB13_2 Depth=1
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	add	w13, w8, w3
	ldr	w12, [sp, #8]                   ; 4-byte Folded Reload
	add	w12, w12, #1
	cmp	w13, #1, lsl #12                ; =4096
	b.hs	LBB13_19
LBB13_2:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB13_4 Depth 2
                                        ;       Child Loop BB13_6 Depth 3
                                        ;         Child Loop BB13_9 Depth 4
                                        ;           Child Loop BB13_11 Depth 5
                                        ;             Child Loop BB13_16 Depth 6
                                        ;             Child Loop BB13_18 Depth 6
	mov	w8, #0
	mov	w5, #0
	str	w12, [sp, #8]                   ; 4-byte Folded Spill
	mul	w14, w12, w3
	mov	w12, w13
	str	x12, [sp, #24]                  ; 8-byte Folded Spill
	b	LBB13_4
LBB13_3:                                ;   in Loop: Header=BB13_4 Depth=2
	add	w5, w17, w3
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	add	w8, w8, #1
	cmp	w5, #1, lsl #12                 ; =4096
	b.hs	LBB13_1
LBB13_4:                                ;   Parent Loop BB13_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB13_6 Depth 3
                                        ;         Child Loop BB13_9 Depth 4
                                        ;           Child Loop BB13_11 Depth 5
                                        ;             Child Loop BB13_16 Depth 6
                                        ;             Child Loop BB13_18 Depth 6
	mov	w15, #0
	mov	w6, #0
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	mul	w16, w8, w3
	add	x4, x9, x16
	mov	w17, w5
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	add	x8, x0, x8, lsl #15
	add	x8, x8, w5, uxtw #3
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	b	LBB13_6
LBB13_5:                                ;   in Loop: Header=BB13_6 Depth=3
	add	w6, w6, w3
	add	w15, w15, #1
	cmp	w6, #1, lsl #12                 ; =4096
	b.hs	LBB13_3
LBB13_6:                                ;   Parent Loop BB13_2 Depth=1
                                        ;     Parent Loop BB13_4 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB13_9 Depth 4
                                        ;           Child Loop BB13_11 Depth 5
                                        ;             Child Loop BB13_16 Depth 6
                                        ;             Child Loop BB13_18 Depth 6
	mov	w6, w6
	cbz	w3, LBB13_5
; %bb.7:                                ;   in Loop: Header=BB13_6 Depth=3
	mov	x7, #0
	mul	w19, w15, w3
	add	x20, x19, #1
	add	x8, x2, x6, lsl #15
	add	x21, x8, x17, lsl #3
	ldp	x23, x8, [sp, #16]              ; 16-byte Folded Reload
	add	x8, x1, x8, lsl #15
	add	x22, x8, x6, lsl #3
	b	LBB13_9
LBB13_8:                                ;   in Loop: Header=BB13_9 Depth=4
	add	x7, x7, #1
	add	x23, x23, #8, lsl #12           ; =32768
	add	x22, x22, #8, lsl #12           ; =32768
	cmp	w7, w3
	b.eq	LBB13_5
LBB13_9:                                ;   Parent Loop BB13_2 Depth=1
                                        ;     Parent Loop BB13_4 Depth=2
                                        ;       Parent Loop BB13_6 Depth=3
                                        ; =>      This Loop Header: Depth=4
                                        ;           Child Loop BB13_11 Depth 5
                                        ;             Child Loop BB13_16 Depth 6
                                        ;             Child Loop BB13_18 Depth 6
	mov	x24, #0
	add	x25, x7, x14
	add	x8, x0, x25, lsl #15
	add	x26, x8, x16, lsl #3
	add	x27, x8, x4, lsl #3
	mov	x28, x21
	b	LBB13_11
LBB13_10:                               ;   in Loop: Header=BB13_11 Depth=5
	add	x24, x24, #1
	add	x28, x28, #8, lsl #12           ; =32768
	cmp	x24, x9
	b.eq	LBB13_8
LBB13_11:                               ;   Parent Loop BB13_2 Depth=1
                                        ;     Parent Loop BB13_4 Depth=2
                                        ;       Parent Loop BB13_6 Depth=3
                                        ;         Parent Loop BB13_9 Depth=4
                                        ; =>        This Loop Header: Depth=5
                                        ;             Child Loop BB13_16 Depth 6
                                        ;             Child Loop BB13_18 Depth 6
	cmp	w3, #8
	b.hs	LBB13_13
; %bb.12:                               ;   in Loop: Header=BB13_11 Depth=5
	mov	x30, #0
	b	LBB13_18
LBB13_13:                               ;   in Loop: Header=BB13_11 Depth=5
	mov	x30, #0
	add	x8, x24, x19
	add	x12, x2, x8, lsl #15
	add	x13, x20, x24
	add	x5, x1, x25, lsl #15
	add	x13, x5, x13, lsl #3
	add	x8, x5, x8, lsl #3
	add	x5, x12, x4, lsl #3
	add	x12, x12, x16, lsl #3
	cmp	x26, x13
	cset	w13, lo
	cmp	x8, x27
	cset	w8, lo
	and	w13, w13, w8
	cmp	x26, x5
	cset	w8, lo
	cmp	x12, x27
	cset	w12, lo
	tbnz	w13, #0, LBB13_18
; %bb.14:                               ;   in Loop: Header=BB13_11 Depth=5
	and	w8, w8, w12
	tbnz	w8, #0, LBB13_18
; %bb.15:                               ;   in Loop: Header=BB13_11 Depth=5
	mov	x30, #0
	add	x8, x22, x24, lsl #3
	ld1r.2d	{ v0 }, [x8]
LBB13_16:                               ;   Parent Loop BB13_2 Depth=1
                                        ;     Parent Loop BB13_4 Depth=2
                                        ;       Parent Loop BB13_6 Depth=3
                                        ;         Parent Loop BB13_9 Depth=4
                                        ;           Parent Loop BB13_11 Depth=5
                                        ; =>          This Inner Loop Header: Depth=6
	ldr	d1, [x22, x24, lsl #3]
	add	x8, x28, x30
	ldp	q2, q3, [x8]
	ldp	q4, q5, [x8, #32]
	fmul.2d	v2, v0, v2
	fmul.2d	v3, v0, v3
	fmul.2d	v4, v0, v4
	fmul.2d	v1, v5, v1[0]
	add	x8, x23, x30
	ldp	q5, q6, [x8]
	ldp	q7, q16, [x8, #32]
	fadd.2d	v2, v5, v2
	fadd.2d	v3, v6, v3
	fadd.2d	v4, v7, v4
	fadd.2d	v1, v16, v1
	stp	q2, q3, [x8]
	stp	q4, q1, [x8, #32]
	add	x30, x30, #64
	cmp	x11, x30
	b.ne	LBB13_16
; %bb.17:                               ;   in Loop: Header=BB13_11 Depth=5
	mov	x30, x10
	cmp	x10, x9
	b.eq	LBB13_10
LBB13_18:                               ;   Parent Loop BB13_2 Depth=1
                                        ;     Parent Loop BB13_4 Depth=2
                                        ;       Parent Loop BB13_6 Depth=3
                                        ;         Parent Loop BB13_9 Depth=4
                                        ;           Parent Loop BB13_11 Depth=5
                                        ; =>          This Inner Loop Header: Depth=6
	ldr	d0, [x22, x24, lsl #3]
	lsl	x8, x30, #3
	ldr	d1, [x28, x8]
	ldr	d2, [x23, x8]
	fmul	d0, d0, d1
	fadd	d0, d2, d0
	str	d0, [x23, x8]
	add	x30, x30, #1
	cmp	x9, x30
	b.ne	LBB13_18
	b	LBB13_10
LBB13_19:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_sum_rows               ; -- Begin function vector2_sum_rows
	.p2align	2
_vector2_sum_rows:                      ; @vector2_sum_rows
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	add	x9, x1, #24
	mov	w10, #4096
LBB14_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_2 Depth 2
	mov	x11, #0
	movi	d0, #0000000000000000
	movi	d1, #0000000000000000
	movi	d2, #0000000000000000
	movi	d3, #0000000000000000
LBB14_2:                                ;   Parent Loop BB14_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x12, x9, x11
	ldp	d4, d5, [x12, #-24]
	fadd	d0, d0, d4
	fadd	d1, d1, d5
	ldur	d4, [x12, #-8]
	fadd	d2, d2, d4
	ldr	d4, [x12]
	fadd	d3, d3, d4
	add	x11, x11, #32
	cmp	w11, #8, lsl #12                ; =32768
	b.ne	LBB14_2
; %bb.3:                                ;   in Loop: Header=BB14_1 Depth=1
	fadd	d0, d0, d1
	fadd	d1, d2, d3
	fadd	d0, d0, d1
	str	d0, [x0, x8, lsl #3]
	add	x8, x8, #1
	add	x9, x9, #8, lsl #12             ; =32768
	subs	w10, w10, #1
	b.ne	LBB14_1
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
LBB15_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB15_2 Depth 2
	str	xzr, [x0, x8, lsl #3]
	movi	d0, #0000000000000000
	mov	w9, #4096
	mov	x10, x1
LBB15_2:                                ;   Parent Loop BB15_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d1, [x10]
	fadd	d0, d1, d0
	str	d0, [x0, x8, lsl #3]
	add	x10, x10, #8, lsl #12           ; =32768
	subs	x9, x9, #1
	b.ne	LBB15_2
; %bb.3:                                ;   in Loop: Header=BB15_1 Depth=1
	add	x8, x8, #1
	add	x1, x1, #8
	cmp	x8, #1, lsl #12                 ; =4096
	b.ne	LBB15_1
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
Lloh6:
	adrp	x21, l_.str.6@PAGE
Lloh7:
	add	x21, x21, l_.str.6@PAGEOFF
LBB16_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB16_2 Depth 2
	str	x22, [sp]
	mov	x0, x20
	bl	_printf
	mov	x23, #0
LBB16_2:                                ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	d0, [x19, x23, lsl #3]
	str	d0, [sp, #8]
	str	x23, [sp]
	mov	x0, x21
	bl	_printf
	add	x23, x23, #1
	cmp	x23, #1, lsl #12                ; =4096
	b.ne	LBB16_2
; %bb.3:                                ;   in Loop: Header=BB16_1 Depth=1
	mov	w0, #10
	bl	_putchar
	add	x22, x22, #1
	add	x19, x19, #8, lsl #12           ; =32768
	cmp	x22, #1, lsl #12                ; =4096
	b.ne	LBB16_1
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
LBB17_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB17_2 Depth 2
	mov	x21, #0
LBB17_2:                                ;   Parent Loop BB17_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x19, x21]
	add	x21, x21, #8
	cmp	x21, #8, lsl #12                ; =32768
	b.ne	LBB17_2
; %bb.3:                                ;   in Loop: Header=BB17_1 Depth=1
	add	x20, x20, #1
	add	x19, x19, #8, lsl #12           ; =32768
	cmp	x20, #1, lsl #12                ; =4096
	b.ne	LBB17_1
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
	mov	w1, #134217728
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
LBB19_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x19, x21, lsl #3]
	str	d0, [sp, #8]
	str	x21, [sp]
	mov	x0, x20
	bl	_printf
	add	x21, x21, #1
	cmp	x21, #1, lsl #12                ; =4096
	b.ne	LBB19_1
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
LBB20_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x19, x21, lsl #3]
	str	d0, [sp, #8]
	str	x21, [sp]
	mov	x0, x20
	bl	_printf
	add	x21, x21, #1
	cmp	x21, #1, lsl #12                ; =4096
	b.ne	LBB20_1
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
