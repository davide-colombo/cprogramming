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
	mov	w0, #16
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
	mov	w0, #16
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
	sub	sp, sp, #144
	stp	d9, d8, [sp, #32]               ; 16-byte Folded Spill
	stp	x28, x27, [sp, #48]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #64]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #80]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128
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
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	mov	x20, x2
	mov	x25, x1
	mov	x19, x0
	str	xzr, [sp]
Lloh4:
	adrp	x0, l_.str.5@PAGE
Lloh5:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	str	xzr, [sp]
Lloh6:
	adrp	x26, l_.str.6@PAGE
Lloh7:
	add	x26, x26, l_.str.6@PAGEOFF
	mov	x0, x26
	bl	_printf
	ldr	d8, [x25]
	stp	xzr, xzr, [sp]
	str	d8, [sp, #16]
Lloh8:
	adrp	x27, l_.str.7@PAGE
Lloh9:
	add	x27, x27, l_.str.7@PAGEOFF
	mov	x0, x27
	bl	_printf
	str	xzr, [sp]
Lloh10:
	adrp	x21, l_.str.8@PAGE
Lloh11:
	add	x21, x21, l_.str.8@PAGEOFF
	mov	x0, x21
	bl	_printf
	ldr	d9, [x20]
	stp	xzr, xzr, [sp]
	str	d9, [sp, #16]
Lloh12:
	adrp	x22, l_.str.9@PAGE
Lloh13:
	add	x22, x22, l_.str.9@PAGEOFF
	mov	x0, x22
	bl	_printf
	fmul	d9, d8, d9
	str	d9, [sp]
Lloh14:
	adrp	x23, l_.str.10@PAGE
Lloh15:
	add	x23, x23, l_.str.10@PAGEOFF
	mov	x0, x23
	bl	_printf
	ldr	d0, [x19]
	fadd	d0, d9, d0
	str	d0, [x19]
	stp	xzr, xzr, [sp]
	str	d0, [sp, #16]
Lloh16:
	adrp	x24, l_.str.11@PAGE
Lloh17:
	add	x24, x24, l_.str.11@PAGEOFF
	mov	x0, x24
	bl	_printf
	mov	w28, #1
	str	x28, [sp]
	mov	x0, x21
	bl	_printf
	ldr	d9, [x20, #8]
	str	d9, [sp, #16]
	stp	xzr, x28, [sp]
	mov	x0, x22
	bl	_printf
	fmul	d8, d8, d9
	str	d8, [sp]
	mov	x0, x23
	bl	_printf
	ldr	d0, [x19, #8]
	fadd	d0, d8, d0
	str	d0, [x19, #8]
	str	d0, [sp, #16]
	stp	xzr, x28, [sp]
	mov	x0, x24
	bl	_printf
	str	x28, [sp]
	mov	x0, x26
	bl	_printf
	ldr	d8, [x25, #8]
	str	d8, [sp, #16]
	stp	xzr, x28, [sp]
	mov	x0, x27
	bl	_printf
	str	xzr, [sp]
	mov	x0, x21
	bl	_printf
	ldr	d9, [x20, #16]
	str	d9, [sp, #16]
	stp	x28, xzr, [sp]
	mov	x0, x22
	bl	_printf
	fmul	d9, d8, d9
	str	d9, [sp]
	mov	x0, x23
	bl	_printf
	ldr	d0, [x19]
	fadd	d0, d9, d0
	str	d0, [x19]
	stp	xzr, xzr, [sp]
	str	d0, [sp, #16]
	mov	x0, x24
	bl	_printf
	str	x28, [sp]
	mov	x0, x21
	bl	_printf
	ldr	d9, [x20, #24]
	str	d9, [sp, #16]
	stp	x28, x28, [sp]
	mov	x0, x22
	bl	_printf
	fmul	d8, d8, d9
	str	d8, [sp]
	mov	x0, x23
	bl	_printf
	ldr	d0, [x19, #8]
	fadd	d0, d8, d0
	str	d0, [x19, #8]
	str	d0, [sp, #16]
	stp	xzr, x28, [sp]
	mov	x0, x24
	bl	_printf
	str	x28, [sp]
Lloh18:
	adrp	x0, l_.str.5@PAGE
Lloh19:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	str	xzr, [sp]
	mov	x0, x26
	bl	_printf
	ldr	d8, [x25, #16]
	str	d8, [sp, #16]
	stp	x28, xzr, [sp]
	mov	x0, x27
	bl	_printf
	str	xzr, [sp]
	mov	x0, x21
	bl	_printf
	ldr	d9, [x20]
	stp	xzr, xzr, [sp]
	str	d9, [sp, #16]
	mov	x0, x22
	bl	_printf
	fmul	d9, d8, d9
	str	d9, [sp]
	mov	x0, x23
	bl	_printf
	ldr	d0, [x19, #16]
	fadd	d0, d9, d0
	str	d0, [x19, #16]
	str	d0, [sp, #16]
	stp	x28, xzr, [sp]
	mov	x0, x24
	bl	_printf
	str	x28, [sp]
	mov	x0, x21
	bl	_printf
	ldr	d9, [x20, #8]
	str	d9, [sp, #16]
	stp	xzr, x28, [sp]
	mov	x0, x22
	bl	_printf
	fmul	d8, d8, d9
	str	d8, [sp]
	mov	x0, x23
	bl	_printf
	ldr	d0, [x19, #24]
	fadd	d0, d8, d0
	str	d0, [x19, #24]
	str	d0, [sp, #16]
	stp	x28, x28, [sp]
	mov	x0, x24
	bl	_printf
	str	x28, [sp]
	mov	x0, x26
	bl	_printf
	ldr	d8, [x25, #24]
	str	d8, [sp, #16]
	stp	x28, x28, [sp]
	mov	x0, x27
	bl	_printf
	str	xzr, [sp]
	mov	x0, x21
	bl	_printf
	ldr	d9, [x20, #16]
	str	d9, [sp, #16]
	stp	x28, xzr, [sp]
	mov	x0, x22
	bl	_printf
	fmul	d9, d8, d9
	str	d9, [sp]
	mov	x0, x23
	bl	_printf
	ldr	d0, [x19, #16]
	fadd	d0, d9, d0
	str	d0, [x19, #16]
	str	d0, [sp, #16]
	stp	x28, xzr, [sp]
	mov	x0, x24
	bl	_printf
	str	x28, [sp]
	mov	x0, x21
	bl	_printf
	ldr	d9, [x20, #24]
	str	d9, [sp, #16]
	stp	x28, x28, [sp]
	mov	x0, x22
	bl	_printf
	fmul	d8, d8, d9
	str	d8, [sp]
	mov	x0, x23
	bl	_printf
	ldr	d0, [x19, #24]
	fadd	d0, d8, d0
	str	d0, [x19, #24]
	str	d0, [sp, #16]
	stp	x28, x28, [sp]
	mov	x0, x24
	bl	_printf
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
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
Lloh20:
	adrp	x20, l_.str.12@PAGE
Lloh21:
	add	x20, x20, l_.str.12@PAGEOFF
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19]
	str	d0, [sp, #8]
	str	xzr, [sp]
Lloh22:
	adrp	x21, l_.str.13@PAGE
Lloh23:
	add	x21, x21, l_.str.13@PAGEOFF
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
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
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
Lloh24:
	adrp	x20, l_.str.15@PAGE
Lloh25:
	add	x20, x20, l_.str.15@PAGEOFF
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
	.loh AdrpAdd	Lloh24, Lloh25
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
Lloh26:
	adrp	x20, l_.str.16@PAGE
Lloh27:
	add	x20, x20, l_.str.16@PAGEOFF
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
	.loh AdrpAdd	Lloh26, Lloh27
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
Lloh28:
	adrp	x0, l___func__.vector2_alloc_vector2_aligned@PAGE
Lloh29:
	add	x0, x0, l___func__.vector2_alloc_vector2_aligned@PAGEOFF
Lloh30:
	adrp	x1, l_.str.2@PAGE
Lloh31:
	add	x1, x1, l_.str.2@PAGEOFF
Lloh32:
	adrp	x3, l_.str.3@PAGE
Lloh33:
	add	x3, x3, l_.str.3@PAGEOFF
	mov	w2, #34
	bl	___assert_rtn
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpAdd	Lloh30, Lloh31
	.loh AdrpAdd	Lloh28, Lloh29
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
Lloh34:
	adrp	x0, l___func__.vector2_alloc_vector2_aligned@PAGE
Lloh35:
	add	x0, x0, l___func__.vector2_alloc_vector2_aligned@PAGEOFF
Lloh36:
	adrp	x1, l_.str.2@PAGE
Lloh37:
	add	x1, x1, l_.str.2@PAGEOFF
Lloh38:
	adrp	x3, l_.str.4@PAGE
Lloh39:
	add	x3, x3, l_.str.4@PAGEOFF
	mov	w2, #40
	bl	___assert_rtn
	.loh AdrpAdd	Lloh38, Lloh39
	.loh AdrpAdd	Lloh36, Lloh37
	.loh AdrpAdd	Lloh34, Lloh35
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
	.asciz	"LOOP I = %u\n"

l_.str.6:                               ; @.str.6
	.asciz	"\tLOOP K = %u\n"

l_.str.7:                               ; @.str.7
	.asciz	"v1[%u][%u] = %.4f\n"

l_.str.8:                               ; @.str.8
	.asciz	"\t\tLOOP J = %u\n"

l_.str.9:                               ; @.str.9
	.asciz	"v2[%u][%u] = %.4f\n"

l_.str.10:                              ; @.str.10
	.asciz	"mul = %.4f\n"

l_.str.11:                              ; @.str.11
	.asciz	"out[%u][%u] = %.4f\n"

l_.str.12:                              ; @.str.12
	.asciz	"[%d] => "

l_.str.13:                              ; @.str.13
	.asciz	"[%d] = %.4f, "

l_.str.15:                              ; @.str.15
	.asciz	"sum of the %d-th row = %.4f\n"

l_.str.16:                              ; @.str.16
	.asciz	"sum of the %d-th column = %.4f\n"

.subsections_via_symbols
