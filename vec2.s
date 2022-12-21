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
	mov	w8, #392
	str	x8, [sp]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w8, #8
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
	mov	w0, #392
	b	_malloc
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_free_vector2           ; -- Begin function vector2_free_vector2
	.p2align	2
_vector2_free_vector2:                  ; @vector2_free_vector2
	.cfi_startproc
; %bb.0:
	cbz	x0, LBB2_2
; %bb.1:
	b	_free
LBB2_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_alloc_rowsum1          ; -- Begin function vector2_alloc_rowsum1
	.p2align	2
_vector2_alloc_rowsum1:                 ; @vector2_alloc_rowsum1
	.cfi_startproc
; %bb.0:
	mov	w0, #56
	b	_malloc
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_free_rowsum1           ; -- Begin function vector2_free_rowsum1
	.p2align	2
_vector2_free_rowsum1:                  ; @vector2_free_rowsum1
	.cfi_startproc
; %bb.0:
	cbz	x0, LBB4_2
; %bb.1:
	b	_free
LBB4_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_alloc_colsum1          ; -- Begin function vector2_alloc_colsum1
	.p2align	2
_vector2_alloc_colsum1:                 ; @vector2_alloc_colsum1
	.cfi_startproc
; %bb.0:
	mov	w0, #56
	b	_malloc
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_free_colsum1           ; -- Begin function vector2_free_colsum1
	.p2align	2
_vector2_free_colsum1:                  ; @vector2_free_colsum1
	.cfi_startproc
; %bb.0:
	cbz	x0, LBB6_2
; %bb.1:
	b	_free
LBB6_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_add                    ; -- Begin function vector2_add
	.p2align	2
_vector2_add:                           ; @vector2_add
	.cfi_startproc
; %bb.0:
	mov	x8, #0
LBB7_1:                                 ; =>This Inner Loop Header: Depth=1
	add	x9, x1, x8
	add	x10, x2, x8
	ldp	q0, q1, [x9]
	ldp	q2, q3, [x10]
	fadd.2d	v0, v0, v2
	fadd.2d	v1, v1, v3
	add	x11, x0, x8
	stp	q0, q1, [x11]
	ldr	d0, [x9, #32]
	ldr	d1, [x10, #32]
	fadd	d0, d0, d1
	str	d0, [x11, #32]
	ldr	d0, [x9, #40]
	ldr	d1, [x10, #40]
	fadd	d0, d0, d1
	str	d0, [x11, #40]
	ldr	d0, [x9, #48]
	ldr	d1, [x10, #48]
	fadd	d0, d0, d1
	str	d0, [x11, #48]
	add	x8, x8, #56
	cmp	x8, #392
	b.ne	LBB7_1
; %bb.2:
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
	movi	d0, #0000000000000000
LBB8_1:                                 ; =>This Inner Loop Header: Depth=1
	ldp	d2, d1, [x9, #-24]
	fadd	d2, d2, d0
	ldp	d3, d4, [x9]
	fadd	d2, d2, d4
	ldp	d4, d5, [x9, #16]
	fadd	d2, d2, d4
	ldur	d4, [x9, #-8]
	fadd	d2, d2, d5
	fadd	d1, d1, d0
	fadd	d4, d4, d0
	fadd	d3, d3, d0
	fadd	d3, d4, d3
	fadd	d1, d1, d2
	fadd	d1, d3, d1
	str	d1, [x0, x8]
	add	x8, x8, #8
	add	x9, x9, #56
	cmp	w8, #56
	b.ne	LBB8_1
; %bb.2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_sum_cols               ; -- Begin function vector2_sum_cols
	.p2align	2
_vector2_sum_cols:                      ; @vector2_sum_cols
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	add	x9, x1, #168
	movi	d0, #0000000000000000
LBB9_1:                                 ; =>This Inner Loop Header: Depth=1
	str	xzr, [x0, x8]
	add	x10, x9, x8
	ldur	d1, [x10, #-168]
	fadd	d1, d1, d0
	str	d1, [x0, x8]
	ldur	d2, [x10, #-112]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldur	d2, [x10, #-56]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x10]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x10, #56]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x10, #112]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x10, #168]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	add	x8, x8, #8
	cmp	x8, #56
	b.ne	LBB9_1
; %bb.2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_print_vector2_data     ; -- Begin function vector2_print_vector2_data
	.p2align	2
_vector2_print_vector2_data:            ; @vector2_print_vector2_data
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	stp	x28, x27, [sp, #16]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
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
	mov	x21, #0
	add	x22, x0, #24
Lloh4:
	adrp	x19, l_.str.2@PAGE
Lloh5:
	add	x19, x19, l_.str.2@PAGEOFF
	mov	w23, #1
	mov	w24, #2
	mov	w25, #3
	mov	w26, #4
	mov	w27, #5
	mov	w28, #6
Lloh6:
	adrp	x20, l_.str.3@PAGE
Lloh7:
	add	x20, x20, l_.str.3@PAGEOFF
LBB10_1:                                ; =>This Inner Loop Header: Depth=1
	str	x21, [sp]
	mov	x0, x19
	bl	_printf
	ldur	d0, [x22, #-24]
	str	d0, [sp, #8]
	str	xzr, [sp]
	mov	x0, x20
	bl	_printf
	ldur	d0, [x22, #-16]
	str	d0, [sp, #8]
	str	x23, [sp]
	mov	x0, x20
	bl	_printf
	ldur	d0, [x22, #-8]
	str	d0, [sp, #8]
	str	x24, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22]
	str	d0, [sp, #8]
	str	x25, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22, #8]
	str	d0, [sp, #8]
	str	x26, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22, #16]
	str	d0, [sp, #8]
	str	x27, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22, #24]
	str	d0, [sp, #8]
	str	x28, [sp]
	mov	x0, x20
	bl	_printf
	mov	w0, #10
	bl	_putchar
	add	x21, x21, #1
	add	x22, x22, #56
	cmp	x21, #7
	b.ne	LBB10_1
; %bb.2:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
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
	add	x19, x19, #24
LBB11_1:                                ; =>This Inner Loop Header: Depth=1
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	add	x21, x19, x20
	stur	d0, [x21, #-24]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	stur	d0, [x21, #-16]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	stur	d0, [x21, #-8]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x21]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x21, #8]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x21, #16]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x21, #24]
	add	x20, x20, #56
	cmp	x20, #392
	b.ne	LBB11_1
; %bb.2:
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
	adrp	x20, l_.str.5@PAGE
Lloh9:
	add	x20, x20, l_.str.5@PAGEOFF
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #8]
	str	d0, [sp, #8]
	mov	w8, #1
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #16]
	str	d0, [sp, #8]
	mov	w8, #2
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #24]
	str	d0, [sp, #8]
	mov	w8, #3
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #32]
	str	d0, [sp, #8]
	mov	w8, #4
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #40]
	str	d0, [sp, #8]
	mov	w8, #5
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #48]
	str	d0, [sp, #8]
	mov	w8, #6
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
	adrp	x20, l_.str.6@PAGE
Lloh11:
	add	x20, x20, l_.str.6@PAGEOFF
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #8]
	str	d0, [sp, #8]
	mov	w8, #1
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #16]
	str	d0, [sp, #8]
	mov	w8, #2
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #24]
	str	d0, [sp, #8]
	mov	w8, #3
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #32]
	str	d0, [sp, #8]
	mov	w8, #4
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #40]
	str	d0, [sp, #8]
	mov	w8, #5
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x19, #48]
	str	d0, [sp, #8]
	mov	w8, #6
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
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"sizeof(vector2_t) = %zu\n"

l_.str.1:                               ; @.str.1
	.asciz	"alignof(vector2_t) = %zu\n"

l_.str.2:                               ; @.str.2
	.asciz	"[%d] => "

l_.str.3:                               ; @.str.3
	.asciz	"[%d] = %.4f, "

l_.str.5:                               ; @.str.5
	.asciz	"sum of the %d-th row = %.4f\n"

l_.str.6:                               ; @.str.6
	.asciz	"sum of the %d-th column = %.4f\n"

.subsections_via_symbols
