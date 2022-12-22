	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function main
lCPI0_0:
	.quad	0x3ff0000000000000              ; double 1
	.quad	0x4000000000000000              ; double 2
lCPI0_1:
	.quad	0x4010000000000000              ; double 4
	.quad	0x4014000000000000              ; double 5
lCPI0_2:
	.quad	0x4000000000000000              ; double 2
	.quad	0x4008000000000000              ; double 3
lCPI0_3:
	.quad	0x3ff0000000000000              ; double 1
	.quad	0x4008000000000000              ; double 3
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
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
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	bl	_vector2_print_vector2_type_info
	mov	w0, #128
	bl	_vector2_alloc_vector2_aligned
	cbz	x0, LBB0_7
; %bb.1:
	mov	x19, x0
	str	x0, [sp]
Lloh0:
	adrp	x0, l_.str.1@PAGE
Lloh1:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	bl	_clock
	mov	x21, x0
	mov	w0, #128
	bl	_vector2_alloc_vector2_aligned
	mov	x20, x0
	bl	_clock
	sub	x8, x0, x21
	ucvtf	d0, x8
	mov	x8, #60813
	movk	x8, #41141, lsl #16
	movk	x8, #50935, lsl #32
	movk	x8, #16048, lsl #48
	fmov	d1, x8
	fmul	d0, d0, d1
	str	d0, [sp]
Lloh2:
	adrp	x0, l_.str.2@PAGE
Lloh3:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	str	x20, [sp]
Lloh4:
	adrp	x0, l_.str.3@PAGE
Lloh5:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	cbz	x20, LBB0_8
; %bb.2:
	bl	_clock
	mov	x22, x0
	mov	w0, #128
	bl	_vector2_alloc_vector2_aligned
	mov	x21, x0
	bl	_clock
	sub	x8, x0, x22
	ucvtf	d0, x8
	mov	x8, #60813
	movk	x8, #41141, lsl #16
	movk	x8, #50935, lsl #32
	movk	x8, #16048, lsl #48
	fmov	d1, x8
	fmul	d0, d0, d1
	str	d0, [sp]
Lloh6:
	adrp	x0, l_.str.5@PAGE
Lloh7:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	str	x21, [sp]
Lloh8:
	adrp	x0, l_.str.6@PAGE
Lloh9:
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	cbz	x21, LBB0_9
; %bb.3:
Lloh10:
	adrp	x8, lCPI0_0@PAGE
Lloh11:
	ldr	q0, [x8, lCPI0_0@PAGEOFF]
Lloh12:
	adrp	x8, lCPI0_1@PAGE
Lloh13:
	ldr	q1, [x8, lCPI0_1@PAGEOFF]
	stp	q0, q1, [x19]
	mov	x0, x19
	bl	_vector2_print_vector2_data
Lloh14:
	adrp	x8, lCPI0_2@PAGE
Lloh15:
	ldr	q0, [x8, lCPI0_2@PAGEOFF]
Lloh16:
	adrp	x8, lCPI0_3@PAGE
Lloh17:
	ldr	q1, [x8, lCPI0_3@PAGEOFF]
	stp	q0, q1, [x20]
	mov	x0, x20
	bl	_vector2_print_vector2_data
	mov	w0, #128
	bl	_vector2_alloc_vector2_aligned
	cbz	x0, LBB0_10
; %bb.4:
	mov	x22, x0
	bl	_vector2_print_vector2_data
	mov	x0, x22
	bl	_vector2_zero_init_vector2
	mov	x0, x22
	bl	_vector2_print_vector2_data
	bl	_clock
	mov	x23, x0
	mov	x0, x22
	mov	x1, x19
	mov	x2, x20
	bl	_vector2_mul
	bl	_clock
	sub	x8, x0, x23
	ucvtf	d0, x8
	mov	x8, #60813
	movk	x8, #41141, lsl #16
	movk	x8, #50935, lsl #32
	movk	x8, #16048, lsl #48
	fmov	d1, x8
	fmul	d0, d0, d1
	str	d0, [sp]
Lloh18:
	adrp	x0, l_.str.9@PAGE
Lloh19:
	add	x0, x0, l_.str.9@PAGEOFF
	bl	_printf
	mov	x0, x22
	bl	_vector2_print_vector2_data
	bl	_vector2_alloc_rowsum1
	cbz	x0, LBB0_11
; %bb.5:
	mov	x22, x0
	bl	_clock
	mov	x23, x0
	mov	x0, x22
	mov	x1, x21
	bl	_vector2_sum_rows
	bl	_clock
	sub	x8, x0, x23
	ucvtf	d0, x8
	mov	x8, #60813
	movk	x8, #41141, lsl #16
	movk	x8, #50935, lsl #32
	movk	x8, #16048, lsl #48
	fmov	d1, x8
	fmul	d0, d0, d1
	str	d0, [sp]
Lloh20:
	adrp	x0, l_.str.11@PAGE
Lloh21:
	add	x0, x0, l_.str.11@PAGEOFF
	bl	_printf
	bl	_vector2_alloc_colsum1
	cbz	x0, LBB0_12
; %bb.6:
	mov	x23, x0
	bl	_clock
	mov	x24, x0
	mov	x0, x23
	mov	x1, x20
	bl	_vector2_sum_cols
	bl	_clock
	sub	x8, x0, x24
	ucvtf	d0, x8
	mov	x8, #60813
	movk	x8, #41141, lsl #16
	movk	x8, #50935, lsl #32
	movk	x8, #16048, lsl #48
	fmov	d1, x8
	fmul	d0, d0, d1
	str	d0, [sp]
Lloh22:
	adrp	x0, l_.str.13@PAGE
Lloh23:
	add	x0, x0, l_.str.13@PAGEOFF
	bl	_printf
	mov	x0, x19
	bl	_vector2_free_vector2
	mov	x0, x20
	bl	_vector2_free_vector2
	mov	x0, x21
	bl	_vector2_free_vector2
	mov	x0, x22
	bl	_vector2_free_rowsum1
	mov	x0, x23
	bl	_vector2_free_colsum1
	mov	w19, #0
	b	LBB0_13
LBB0_7:
Lloh24:
	adrp	x8, ___stderrp@GOTPAGE
Lloh25:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh26:
	ldr	x3, [x8]
Lloh27:
	adrp	x0, l_.str@PAGE
Lloh28:
	add	x0, x0, l_.str@PAGEOFF
	mov	w19, #1
	mov	w1, #37
	mov	w2, #1
	bl	_fwrite
	b	LBB0_13
LBB0_8:
Lloh29:
	adrp	x8, ___stderrp@GOTPAGE
Lloh30:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh31:
	ldr	x3, [x8]
Lloh32:
	adrp	x0, l_.str.4@PAGE
Lloh33:
	add	x0, x0, l_.str.4@PAGEOFF
	mov	w19, #1
	mov	w1, #37
	mov	w2, #1
	bl	_fwrite
                                        ; kill: def $w19 killed $w19 killed $x19 def $x19
	b	LBB0_13
LBB0_9:
Lloh34:
	adrp	x8, ___stderrp@GOTPAGE
Lloh35:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh36:
	ldr	x3, [x8]
Lloh37:
	adrp	x0, l_.str.7@PAGE
Lloh38:
	add	x0, x0, l_.str.7@PAGEOFF
	mov	w1, #38
	mov	w2, #1
	bl	_fwrite
	mov	w19, #2
	b	LBB0_13
LBB0_10:
Lloh39:
	adrp	x8, ___stderrp@GOTPAGE
Lloh40:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh41:
	ldr	x3, [x8]
Lloh42:
	adrp	x0, l_.str.8@PAGE
Lloh43:
	add	x0, x0, l_.str.8@PAGEOFF
	mov	w1, #38
	mov	w2, #1
	bl	_fwrite
	mov	w19, #5
	b	LBB0_13
LBB0_11:
Lloh44:
	adrp	x8, ___stderrp@GOTPAGE
Lloh45:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh46:
	ldr	x3, [x8]
Lloh47:
	adrp	x0, l_.str.10@PAGE
Lloh48:
	add	x0, x0, l_.str.10@PAGEOFF
	mov	w1, #39
	mov	w2, #1
	bl	_fwrite
	mov	w19, #3
	b	LBB0_13
LBB0_12:
Lloh49:
	adrp	x8, ___stderrp@GOTPAGE
Lloh50:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh51:
	ldr	x3, [x8]
Lloh52:
	adrp	x0, l_.str.12@PAGE
Lloh53:
	add	x0, x0, l_.str.12@PAGEOFF
	mov	w1, #39
	mov	w2, #1
	bl	_fwrite
	mov	w19, #4
LBB0_13:
	mov	x0, x19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpLdr	Lloh16, Lloh17
	.loh AdrpAdrp	Lloh14, Lloh16
	.loh AdrpLdr	Lloh14, Lloh15
	.loh AdrpLdr	Lloh12, Lloh13
	.loh AdrpAdrp	Lloh10, Lloh12
	.loh AdrpLdr	Lloh10, Lloh11
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh27, Lloh28
	.loh AdrpLdrGotLdr	Lloh24, Lloh25, Lloh26
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpLdrGotLdr	Lloh29, Lloh30, Lloh31
	.loh AdrpAdd	Lloh37, Lloh38
	.loh AdrpLdrGotLdr	Lloh34, Lloh35, Lloh36
	.loh AdrpAdd	Lloh42, Lloh43
	.loh AdrpLdrGotLdr	Lloh39, Lloh40, Lloh41
	.loh AdrpAdd	Lloh47, Lloh48
	.loh AdrpLdrGotLdr	Lloh44, Lloh45, Lloh46
	.loh AdrpAdd	Lloh52, Lloh53
	.loh AdrpLdrGotLdr	Lloh49, Lloh50, Lloh51
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Cannot allocate memory for v1 object\n"

l_.str.1:                               ; @.str.1
	.asciz	"v1 = %p\n"

l_.str.2:                               ; @.str.2
	.asciz	"v2 alloc: %.20f\n"

l_.str.3:                               ; @.str.3
	.asciz	"v2 = %p\n"

l_.str.4:                               ; @.str.4
	.asciz	"Cannot allocate memory for v2 object\n"

l_.str.5:                               ; @.str.5
	.asciz	"sum alloc: %.20f\n"

l_.str.6:                               ; @.str.6
	.asciz	"sum = %p\n"

l_.str.7:                               ; @.str.7
	.asciz	"Cannot allocate memory for sum object\n"

l_.str.8:                               ; @.str.8
	.asciz	"Cannot allocate memory for mul object\n"

l_.str.9:                               ; @.str.9
	.asciz	"mul: %.20f\n"

l_.str.10:                              ; @.str.10
	.asciz	"Cannot allocate memory for rsum object\n"

l_.str.11:                              ; @.str.11
	.asciz	"rowsum: %.20f\n"

l_.str.12:                              ; @.str.12
	.asciz	"Cannot allocate memory for csum object\n"

l_.str.13:                              ; @.str.13
	.asciz	"colsum: %.20f\n"

.subsections_via_symbols
