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
	mov	w8, #800
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
	mov	w0, #800
	b	_malloc
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
	cbnz	x0, LBB2_2
; %bb.1:
Lloh4:
	adrp	x8, ___stderrp@GOTPAGE
Lloh5:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh6:
	ldr	x3, [x8]
Lloh7:
	adrp	x0, l_.str.2@PAGE
Lloh8:
	add	x0, x0, l_.str.2@PAGEOFF
	mov	w1, #30
	mov	w2, #1
	bl	_fwrite
LBB2_2:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	_free
	.loh AdrpAdd	Lloh7, Lloh8
	.loh AdrpLdrGotLdr	Lloh4, Lloh5, Lloh6
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_add                    ; -- Begin function vector2_add
	.p2align	2
_vector2_add:                           ; @vector2_add
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
	mov	x20, #0
	add	x21, x1, #40
	add	x22, x2, #40
	add	x23, x0, #40
	mov	w24, #10
Lloh9:
	adrp	x19, l_.str.3@PAGE
Lloh10:
	add	x19, x19, l_.str.3@PAGEOFF
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	d0, [x21, #-40]
	ldur	d1, [x22, #-40]
	fadd	d0, d0, d1
	stur	d0, [x23, #-40]
	ldur	d0, [x21, #-32]
	ldur	d1, [x22, #-32]
	fadd	d0, d0, d1
	stur	d0, [x23, #-32]
	ldur	d0, [x21, #-24]
	ldur	d1, [x22, #-24]
	fadd	d0, d0, d1
	stur	d0, [x23, #-24]
	ldur	d0, [x21, #-16]
	ldur	d1, [x22, #-16]
	fadd	d0, d0, d1
	stur	d0, [x23, #-16]
	ldur	d0, [x21, #-8]
	ldur	d1, [x22, #-8]
	fadd	d0, d0, d1
	stur	d0, [x23, #-8]
	ldr	d0, [x21]
	ldr	d1, [x22]
	fadd	d0, d0, d1
	str	d0, [x23]
	ldr	d0, [x21, #8]
	ldr	d1, [x22, #8]
	fadd	d0, d0, d1
	str	d0, [x23, #8]
	ldr	d0, [x21, #16]
	ldr	d1, [x22, #16]
	fadd	d0, d0, d1
	str	d0, [x23, #16]
	ldr	d0, [x21, #24]
	ldr	d1, [x22, #24]
	fadd	d0, d0, d1
	str	d0, [x23, #24]
	ldr	d0, [x21, #32]
	ldr	d1, [x22, #32]
	fadd	d0, d0, d1
	str	d0, [x23, #32]
	stp	x20, x24, [sp]
	mov	x0, x19
	bl	_printf
	add	x20, x20, #1
	add	x21, x21, #80
	add	x22, x22, #80
	add	x23, x23, #80
	cmp	x20, #10
	b.ne	LBB3_1
; %bb.2:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.loh AdrpAdd	Lloh9, Lloh10
	.cfi_endproc
                                        ; -- End function
	.globl	_vector2_sum_rows               ; -- Begin function vector2_sum_rows
	.p2align	2
_vector2_sum_rows:                      ; @vector2_sum_rows
	.cfi_startproc
; %bb.0:
	mov	x8, #0
	add	x9, x1, #40
	movi	d0, #0000000000000000
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	str	xzr, [x0, x8]
	ldur	d1, [x9, #-40]
	fadd	d1, d1, d0
	str	d1, [x0, x8]
	ldur	d2, [x9, #-32]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldur	d2, [x9, #-24]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldur	d2, [x9, #-16]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldur	d2, [x9, #-8]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #8]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #16]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #24]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #32]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	add	x8, x8, #8
	add	x9, x9, #80
	cmp	x8, #80
	b.ne	LBB4_1
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
	movi	d0, #0000000000000000
LBB5_1:                                 ; =>This Inner Loop Header: Depth=1
	str	xzr, [x0, x8]
	add	x9, x1, x8
	ldr	d1, [x9]
	fadd	d1, d1, d0
	str	d1, [x0, x8]
	ldr	d2, [x9, #80]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #160]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #240]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #320]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #400]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #480]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #560]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #640]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	ldr	d2, [x9, #720]
	fadd	d1, d2, d1
	str	d1, [x0, x8]
	add	x8, x8, #8
	cmp	x8, #80
	b.ne	LBB5_1
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
	add	x22, x0, #40
	mov	w25, #3
	mov	w26, #4
	mov	w27, #5
	mov	w28, #6
	mov	w19, #7
	mov	w23, #8
	mov	w24, #9
Lloh11:
	adrp	x20, l_.str.5@PAGE
Lloh12:
	add	x20, x20, l_.str.5@PAGEOFF
LBB6_1:                                 ; =>This Inner Loop Header: Depth=1
	str	x21, [sp]
Lloh13:
	adrp	x0, l_.str.4@PAGE
Lloh14:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldur	d0, [x22, #-40]
	str	d0, [sp, #8]
	str	xzr, [sp]
	mov	x0, x20
	bl	_printf
	ldur	d0, [x22, #-32]
	str	d0, [sp, #8]
	mov	w8, #1
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldur	d0, [x22, #-24]
	str	d0, [sp, #8]
	mov	w8, #2
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldur	d0, [x22, #-16]
	str	d0, [sp, #8]
	str	x25, [sp]
	mov	x0, x20
	bl	_printf
	ldur	d0, [x22, #-8]
	str	d0, [sp, #8]
	str	x26, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22]
	str	d0, [sp, #8]
	str	x27, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22, #8]
	str	d0, [sp, #8]
	str	x28, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22, #16]
	str	d0, [sp, #8]
	str	x19, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22, #24]
	str	d0, [sp, #8]
	str	x23, [sp]
	mov	x0, x20
	bl	_printf
	ldr	d0, [x22, #32]
	str	d0, [sp, #8]
	str	x24, [sp]
	mov	x0, x20
	bl	_printf
	mov	w0, #10
	bl	_putchar
	add	x21, x21, #1
	add	x22, x22, #80
	cmp	x21, #10
	b.ne	LBB6_1
; %bb.2:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.loh AdrpAdd	Lloh11, Lloh12
	.loh AdrpAdd	Lloh13, Lloh14
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
	add	x19, x19, #40
LBB7_1:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	add	x21, x19, x20
	stur	d0, [x21, #-40]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	stur	d0, [x21, #-32]
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
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
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d0, d10, d0
	str	d0, [x21, #32]
	add	x20, x20, #80
	cmp	x20, #800
	b.ne	LBB7_1
; %bb.2:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #16]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp], #80             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"sizeof(vector2_t) = %zu\n"

l_.str.1:                               ; @.str.1
	.asciz	"alignof(vector2_t) = %zu\n"

l_.str.2:                               ; @.str.2
	.asciz	"Cannot free vector 2 object!!\n"

l_.str.3:                               ; @.str.3
	.asciz	"[%d][%d]\n"

l_.str.4:                               ; @.str.4
	.asciz	"[%d] => "

l_.str.5:                               ; @.str.5
	.asciz	"[%d] = %.4f, "

.subsections_via_symbols
