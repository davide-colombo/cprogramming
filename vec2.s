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
	mov	w8, #32
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
	mov	w0, #32
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
	and	x9, x8, #0x20
	sub	x9, x0, x9
	add	x1, x9, #32
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
	mov	w0, #16
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
	mov	w0, #16
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
	ldr	d0, [x1]
	ldr	d1, [x2]
	fadd	d0, d0, d1
	str	d0, [x0]
	ldr	d0, [x1, #8]
	ldr	d1, [x2, #8]
	fadd	d0, d0, d1
	str	d0, [x0, #8]
	ldr	d0, [x1, #16]
	ldr	d1, [x2, #16]
	fadd	d0, d0, d1
	str	d0, [x0, #16]
	ldr	d0, [x1, #24]
	ldr	d1, [x2, #24]
	fadd	d0, d0, d1
	str	d0, [x0, #24]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_mul                    ; -- Begin function vector2_mul
	.p2align	2
_vector2_mul:                           ; @vector2_mul
	.cfi_startproc
; %bb.0:
	ldr	d0, [x1]
	ldr	d1, [x2]
	fmul	d1, d0, d1
	ldp	d2, d3, [x0]
	fadd	d1, d2, d1
	str	d1, [x0]
	ldr	d2, [x2, #8]
	fmul	d0, d0, d2
	fadd	d0, d3, d0
	str	d0, [x0, #8]
	ldr	d2, [x1, #8]
	ldr	d3, [x2, #16]
	fmul	d3, d2, d3
	fadd	d1, d1, d3
	str	d1, [x0]
	ldr	d1, [x2, #24]
	fmul	d1, d2, d1
	fadd	d0, d0, d1
	str	d0, [x0, #8]
	ldr	d0, [x1, #16]
	ldr	d1, [x2]
	fmul	d1, d0, d1
	ldp	d2, d3, [x0, #16]
	fadd	d1, d2, d1
	str	d1, [x0, #16]
	ldr	d2, [x2, #8]
	fmul	d0, d0, d2
	fadd	d0, d3, d0
	str	d0, [x0, #24]
	ldr	d2, [x1, #24]
	ldr	d3, [x2, #16]
	fmul	d3, d2, d3
	fadd	d1, d1, d3
	str	d1, [x0, #16]
	ldr	d1, [x2, #24]
	fmul	d1, d2, d1
	fadd	d0, d0, d1
	str	d0, [x0, #24]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_transpose              ; -- Begin function vector2_transpose
	.p2align	2
_vector2_transpose:                     ; @vector2_transpose
	.cfi_startproc
; %bb.0:
	ldr	d0, [x1]
	str	d0, [x0]
	ldr	d0, [x1, #8]
	str	d0, [x0, #16]
	ldr	d0, [x1, #16]
	str	d0, [x0, #8]
	ldr	d0, [x1, #24]
	str	d0, [x0, #24]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_mul_transpose          ; -- Begin function vector2_mul_transpose
	.p2align	2
_vector2_mul_transpose:                 ; @vector2_mul_transpose
	.cfi_startproc
; %bb.0:
	ldr	d0, [x1]
	ldr	d1, [x2]
	fmul	d0, d0, d1
	ldp	d1, d2, [x0]
	fadd	d0, d1, d0
	str	d0, [x0]
	ldr	d1, [x1, #8]
	ldr	d3, [x2, #8]
	fmul	d1, d1, d3
	fadd	d0, d0, d1
	str	d0, [x0]
	ldr	d0, [x1]
	ldr	d1, [x2, #16]
	fmul	d0, d0, d1
	fadd	d0, d2, d0
	str	d0, [x0, #8]
	ldr	d1, [x1, #8]
	ldr	d2, [x2, #24]
	fmul	d1, d1, d2
	fadd	d0, d0, d1
	str	d0, [x0, #8]
	ldr	d0, [x1, #16]
	ldr	d1, [x2]
	fmul	d0, d0, d1
	ldp	d1, d2, [x0, #16]
	fadd	d0, d1, d0
	str	d0, [x0, #16]
	ldr	d1, [x1, #24]
	ldr	d3, [x2, #8]
	fmul	d1, d1, d3
	fadd	d0, d0, d1
	str	d0, [x0, #16]
	ldr	d0, [x1, #16]
	ldr	d1, [x2, #16]
	fmul	d0, d0, d1
	fadd	d0, d2, d0
	str	d0, [x0, #24]
	ldr	d1, [x1, #24]
	ldr	d2, [x2, #24]
	fmul	d1, d1, d2
	fadd	d0, d0, d1
	str	d0, [x0, #24]
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
	b	LBB12_2
LBB12_1:                                ;   in Loop: Header=BB12_2 Depth=1
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	add	w13, w8, w3
	ldr	w12, [sp, #8]                   ; 4-byte Folded Reload
	add	w12, w12, #1
	cmp	w13, #2
	b.hs	LBB12_19
LBB12_2:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB12_4 Depth 2
                                        ;       Child Loop BB12_6 Depth 3
                                        ;         Child Loop BB12_9 Depth 4
                                        ;           Child Loop BB12_11 Depth 5
                                        ;             Child Loop BB12_16 Depth 6
                                        ;             Child Loop BB12_18 Depth 6
	mov	w8, #0
	mov	w5, #0
	str	w12, [sp, #8]                   ; 4-byte Folded Spill
	mul	w14, w12, w3
	mov	w12, w13
	str	x12, [sp, #24]                  ; 8-byte Folded Spill
	b	LBB12_4
LBB12_3:                                ;   in Loop: Header=BB12_4 Depth=2
	add	w5, w17, w3
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	add	w8, w8, #1
	cmp	w5, #2
	b.hs	LBB12_1
LBB12_4:                                ;   Parent Loop BB12_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB12_6 Depth 3
                                        ;         Child Loop BB12_9 Depth 4
                                        ;           Child Loop BB12_11 Depth 5
                                        ;             Child Loop BB12_16 Depth 6
                                        ;             Child Loop BB12_18 Depth 6
	mov	w15, #0
	mov	w21, #0
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	mul	w16, w8, w3
	add	x4, x9, x16
	mov	w17, w5
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	add	x8, x0, x8, lsl #4
	add	x8, x8, w5, uxtw #3
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	b	LBB12_6
LBB12_5:                                ;   in Loop: Header=BB12_6 Depth=3
	add	w21, w6, w3
	add	w15, w15, #1
	cmp	w21, #2
	b.hs	LBB12_3
LBB12_6:                                ;   Parent Loop BB12_2 Depth=1
                                        ;     Parent Loop BB12_4 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB12_9 Depth 4
                                        ;           Child Loop BB12_11 Depth 5
                                        ;             Child Loop BB12_16 Depth 6
                                        ;             Child Loop BB12_18 Depth 6
	mov	w6, w21
	cbz	w3, LBB12_5
; %bb.7:                                ;   in Loop: Header=BB12_6 Depth=3
	mov	x7, #0
	mul	w19, w15, w3
	add	x20, x19, #1
	add	x8, x2, w21, uxtw #4
	add	x21, x8, x17, lsl #3
	ldp	x23, x8, [sp, #16]              ; 16-byte Folded Reload
	add	x8, x1, x8, lsl #4
	add	x22, x8, x6, lsl #3
	b	LBB12_9
LBB12_8:                                ;   in Loop: Header=BB12_9 Depth=4
	add	x7, x7, #1
	add	x23, x23, #16
	add	x22, x22, #16
	cmp	w7, w3
	b.eq	LBB12_5
LBB12_9:                                ;   Parent Loop BB12_2 Depth=1
                                        ;     Parent Loop BB12_4 Depth=2
                                        ;       Parent Loop BB12_6 Depth=3
                                        ; =>      This Loop Header: Depth=4
                                        ;           Child Loop BB12_11 Depth 5
                                        ;             Child Loop BB12_16 Depth 6
                                        ;             Child Loop BB12_18 Depth 6
	mov	x24, #0
	add	x25, x7, x14
	add	x8, x0, x25, lsl #4
	add	x26, x8, x16, lsl #3
	add	x27, x8, x4, lsl #3
	mov	x28, x21
	b	LBB12_11
LBB12_10:                               ;   in Loop: Header=BB12_11 Depth=5
	add	x24, x24, #1
	add	x28, x28, #16
	cmp	x24, x9
	b.eq	LBB12_8
LBB12_11:                               ;   Parent Loop BB12_2 Depth=1
                                        ;     Parent Loop BB12_4 Depth=2
                                        ;       Parent Loop BB12_6 Depth=3
                                        ;         Parent Loop BB12_9 Depth=4
                                        ; =>        This Loop Header: Depth=5
                                        ;             Child Loop BB12_16 Depth 6
                                        ;             Child Loop BB12_18 Depth 6
	cmp	w3, #8
	b.hs	LBB12_13
; %bb.12:                               ;   in Loop: Header=BB12_11 Depth=5
	mov	x30, #0
	b	LBB12_18
LBB12_13:                               ;   in Loop: Header=BB12_11 Depth=5
	mov	x30, #0
	add	x8, x24, x19
	add	x12, x2, x8, lsl #4
	add	x13, x20, x24
	add	x5, x1, x25, lsl #4
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
	tbnz	w13, #0, LBB12_18
; %bb.14:                               ;   in Loop: Header=BB12_11 Depth=5
	and	w8, w8, w12
	tbnz	w8, #0, LBB12_18
; %bb.15:                               ;   in Loop: Header=BB12_11 Depth=5
	mov	x30, #0
	add	x8, x22, x24, lsl #3
	ld1r.2d	{ v0 }, [x8]
LBB12_16:                               ;   Parent Loop BB12_2 Depth=1
                                        ;     Parent Loop BB12_4 Depth=2
                                        ;       Parent Loop BB12_6 Depth=3
                                        ;         Parent Loop BB12_9 Depth=4
                                        ;           Parent Loop BB12_11 Depth=5
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
	b.ne	LBB12_16
; %bb.17:                               ;   in Loop: Header=BB12_11 Depth=5
	mov	x30, x10
	cmp	x10, x9
	b.eq	LBB12_10
LBB12_18:                               ;   Parent Loop BB12_2 Depth=1
                                        ;     Parent Loop BB12_4 Depth=2
                                        ;       Parent Loop BB12_6 Depth=3
                                        ;         Parent Loop BB12_9 Depth=4
                                        ;           Parent Loop BB12_11 Depth=5
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
	b.ne	LBB12_18
	b	LBB12_10
LBB12_19:
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
	movi	d0, #0000000000000000
	ldp	d1, d2, [x1]
	fadd	d1, d1, d0
	fadd	d1, d1, d2
	fadd	d1, d1, d0
	str	d1, [x0]
	ldp	d1, d2, [x1, #16]
	fadd	d1, d1, d0
	fadd	d1, d1, d2
	fadd	d0, d1, d0
	str	d0, [x0, #8]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_sum_cols               ; -- Begin function vector2_sum_cols
	.p2align	2
_vector2_sum_cols:                      ; @vector2_sum_cols
	.cfi_startproc
; %bb.0:
	str	xzr, [x0]
	ldr	d0, [x1]
	movi	d1, #0000000000000000
	fadd	d0, d0, d1
	str	d0, [x0]
	ldr	d2, [x1, #16]
	fadd	d0, d2, d0
	str	d0, [x0]
	str	xzr, [x0, #8]
	ldr	d0, [x1, #8]
	fadd	d0, d0, d1
	str	d0, [x0, #8]
	ldr	d1, [x1, #24]
	fadd	d0, d1, d0
	str	d0, [x0, #8]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_print_vector2_data     ; -- Begin function vector2_print_vector2_data
	.p2align	2
_vector2_print_vector2_data:            ; @vector2_print_vector2_data
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
	str	xzr, [sp]
Lloh4:
	adrp	x20, l_.str.5@PAGE
Lloh5:
	add	x20, x20, l_.str.5@PAGEOFF
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19]
	str	d0, [sp, #8]
	str	xzr, [sp]
Lloh6:
	adrp	x21, l_.str.6@PAGE
Lloh7:
	add	x21, x21, l_.str.6@PAGEOFF
	mov	x0, x21
	bl	_printf
	ldr	d0, [x19, #8]
	str	d0, [sp, #8]
	mov	w22, #1
	str	x22, [sp]
	mov	x0, x21
	bl	_printf
	mov	w0, #10
	bl	_putchar
	str	x22, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #16]
	str	d0, [sp, #8]
	str	xzr, [sp]
	mov	x0, x21
	bl	_printf
	ldr	d0, [x19, #24]
	str	d0, [sp, #8]
	str	x22, [sp]
	mov	x0, x21
	bl	_printf
	mov	w0, #10
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	b	_putchar
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_rand_init_vector2      ; -- Begin function vector2_rand_init_vector2
	.p2align	2
_vector2_rand_init_vector2:             ; @vector2_rand_init_vector2
	.cfi_startproc
; %bb.0:
	stp	d11, d10, [sp, #-64]!           ; 16-byte Folded Spill
	stp	d9, d8, [sp, #16]               ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset b8, -40
	.cfi_offset b9, -48
	.cfi_offset b10, -56
	.cfi_offset b11, -64
	fmov	d8, d1
	fmov	d9, d0
	mov	x19, x0
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	mov	x8, #2097152
	movk	x8, #15872, lsl #48
	fmov	d0, x8
	fmul	d9, d9, d0
	fmul	d8, d8, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x19]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x19, #8]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x19, #16]
	bl	_rand
	scvtf	d0, w0
	fmul	d9, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d9, d0
	str	d0, [x19, #24]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #16]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp], #64             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_zero_init_vector2      ; -- Begin function vector2_zero_init_vector2
	.p2align	2
_vector2_zero_init_vector2:             ; @vector2_zero_init_vector2
	.cfi_startproc
; %bb.0:
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x0]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_print_rowsum1_data     ; -- Begin function vector2_print_rowsum1_data
	.p2align	2
_vector2_print_rowsum1_data:            ; @vector2_print_rowsum1_data
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
	mov	x19, x0
	ldr	d0, [x0]
	str	d0, [sp, #8]
	str	xzr, [sp]
Lloh8:
	adrp	x20, l_.str.8@PAGE
Lloh9:
	add	x20, x20, l_.str.8@PAGEOFF
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #8]
	str	d0, [sp, #8]
	mov	w8, #1
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh8, Lloh9
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_print_colsum1_data     ; -- Begin function vector2_print_colsum1_data
	.p2align	2
_vector2_print_colsum1_data:            ; @vector2_print_colsum1_data
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
	mov	x19, x0
	ldr	d0, [x0]
	str	d0, [sp, #8]
	str	xzr, [sp]
Lloh10:
	adrp	x20, l_.str.9@PAGE
Lloh11:
	add	x20, x20, l_.str.9@PAGEOFF
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #8]
	str	d0, [sp, #8]
	mov	w8, #1
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
