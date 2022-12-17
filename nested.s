	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	__loop_cache_line_analysis      ; -- Begin function _loop_cache_line_analysis
	.p2align	2
__loop_cache_line_analysis:             ; @_loop_cache_line_analysis
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	d9, d8, [sp, #16]               ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset b8, -72
	.cfi_offset b9, -80
	mov	x19, x0
	mov	w21, #32
	udiv	x8, x21, x0
	lsr	x9, x0, #5
	and	w10, w19, #0x1f
	msub	w11, w8, w19, w21
	sub	w12, w19, #33
	cmp	w12, #0
	csel	w22, w10, w11, ge
	csel	x23, x9, x8, ge
	ucvtf	s0, w22
	ucvtf	s1, x0
	fdiv	s0, s0, s1
	mov	w8, #1120403456
	fmov	s1, w8
	fmul	s8, s0, s1
Lloh0:
	adrp	x20, l_str.7@PAGE
Lloh1:
	add	x20, x20, l_str.7@PAGEOFF
	mov	x0, x20
	bl	_puts
	str	x19, [sp]
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	str	x21, [sp]
Lloh4:
	adrp	x0, l_.str.2@PAGE
Lloh5:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	str	x23, [sp]
Lloh6:
	adrp	x0, l_.str.3@PAGE
Lloh7:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	str	x22, [sp]
Lloh8:
	adrp	x0, l_.str.4@PAGE
Lloh9:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	fcvt	d0, s8
	str	d0, [sp]
Lloh10:
	adrp	x0, l_.str.5@PAGE
Lloh11:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	mov	x0, x20
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #16]               ; 16-byte Folded Reload
	add	sp, sp, #96
	b	_puts
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function _loop_test1
lCPI1_0:
	.quad	2                               ; 0x2
	.quad	3                               ; 0x3
lCPI1_1:
	.quad	0                               ; 0x0
	.quad	1                               ; 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__loop_test1
	.p2align	2
__loop_test1:                           ; @_loop_test1
	.cfi_startproc
; %bb.0:
	cbz	x1, LBB1_11
; %bb.1:
	mov	x8, #0
	and	x9, x2, #0xfffffffffffffffc
	fmov	d0, #3.00000000
Lloh12:
	adrp	x10, lCPI1_0@PAGE
Lloh13:
	ldr	q1, [x10, lCPI1_0@PAGEOFF]
Lloh14:
	adrp	x10, lCPI1_1@PAGE
Lloh15:
	ldr	q2, [x10, lCPI1_1@PAGEOFF]
	fmov.2d	v3, #3.00000000
	mov	w10, #4
	dup.2d	v4, x10
	b	LBB1_3
LBB1_2:                                 ;   in Loop: Header=BB1_3 Depth=1
	add	x8, x8, #1
	cmp	x8, x1
	b.eq	LBB1_11
LBB1_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_7 Depth 2
                                        ;     Child Loop BB1_10 Depth 2
	cbz	x2, LBB1_2
; %bb.4:                                ;   in Loop: Header=BB1_3 Depth=1
	ldr	x10, [x0, x8, lsl #3]
	cmp	x2, #4
	b.hs	LBB1_6
; %bb.5:                                ;   in Loop: Header=BB1_3 Depth=1
	mov	x12, #0
	b	LBB1_9
LBB1_6:                                 ;   in Loop: Header=BB1_3 Depth=1
	dup.2d	v5, x8
	mov	x11, x9
	mov	x12, x10
	mov.16b	v6, v2
	mov.16b	v7, v1
LBB1_7:                                 ;   Parent Loop BB1_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.d	x13, v5[1]
	mov.d	x14, v7[1]
	mul	x14, x14, x13
	fmov	x15, d5
	fmov	x16, d7
	mul	x15, x16, x15
	fmov	d16, x15
	mov.d	v16[1], x14
	mov.d	x14, v6[1]
	mul	x13, x14, x13
	fmov	x14, d5
	fmov	x15, d6
	mul	x14, x15, x14
	fmov	d17, x14
	mov.d	v17[1], x13
	ucvtf.2d	v17, v17
	ucvtf.2d	v16, v16
	fdiv.2d	v16, v16, v3
	fdiv.2d	v17, v17, v3
	fcvtzs.2d	v17, v17
	xtn.2s	v17, v17
	fcvtzs.2d	v16, v16
	xtn2.4s	v17, v16
	str	q17, [x12], #16
	add.2d	v7, v7, v4
	add.2d	v6, v6, v4
	subs	x11, x11, #4
	b.ne	LBB1_7
; %bb.8:                                ;   in Loop: Header=BB1_3 Depth=1
	mov	x12, x9
	cmp	x9, x2
	b.eq	LBB1_2
LBB1_9:                                 ;   in Loop: Header=BB1_3 Depth=1
	sub	x11, x2, x12
	add	x10, x10, x12, lsl #2
	mul	x12, x12, x8
LBB1_10:                                ;   Parent Loop BB1_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ucvtf	d5, x12
	fdiv	d5, d5, d0
	fcvtzs	w13, d5
	str	w13, [x10], #4
	add	x12, x12, x8
	subs	x11, x11, #1
	b.ne	LBB1_10
	b	LBB1_2
LBB1_11:
	ret
	.loh AdrpLdr	Lloh14, Lloh15
	.loh AdrpAdrp	Lloh12, Lloh14
	.loh AdrpLdr	Lloh12, Lloh13
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function main
lCPI2_0:
	.quad	0                               ; 0x0
	.quad	-1                              ; 0xffffffffffffffff
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	stp	d9, d8, [sp, #16]               ; 16-byte Folded Spill
	stp	x28, x27, [sp, #32]             ; 16-byte Folded Spill
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
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
Lloh16:
	adrp	x19, l_str.7@PAGE
Lloh17:
	add	x19, x19, l_str.7@PAGEOFF
	mov	x0, x19
	bl	_puts
	mov	w8, #47
	str	x8, [sp]
Lloh18:
	adrp	x0, l_.str.1@PAGE
Lloh19:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	mov	w8, #32
	str	x8, [sp]
Lloh20:
	adrp	x0, l_.str.2@PAGE
Lloh21:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	mov	w8, #1
	str	x8, [sp]
Lloh22:
	adrp	x0, l_.str.3@PAGE
Lloh23:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	mov	w8, #15
	str	x8, [sp]
Lloh24:
	adrp	x0, l_.str.4@PAGE
Lloh25:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	mov	x8, #1610612736
	movk	x8, #59958, lsl #32
	movk	x8, #16447, lsl #48
	str	x8, [sp]
Lloh26:
	adrp	x0, l_.str.5@PAGE
Lloh27:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	mov	x0, x19
	bl	_puts
	bl	_clock
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	mov	x8, #0
	mov	x9, #0
	mov	x10, #0
	mov	x11, #0
Lloh28:
	adrp	x12, lCPI2_0@PAGE
Lloh29:
	ldr	q0, [x12, lCPI2_0@PAGEOFF]
	fmov.2d	v1, #3.00000000
	mov	w15, #13
	mov	w16, #19
	mov	w17, #23
	mov	w0, #22
	mov	w1, #21
	mov	w2, #27
	mov	w3, #26
	mov	w4, #25
	mov	w5, #30
	mov	w6, #29
	mov	w7, #28
	mov	w20, #35
	mov	w21, #39
	mov	w22, #38
	mov	w23, #37
	mov	w24, #43
	mov	w25, #42
	fmov	d2, #3.00000000
	mov	w26, #41
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	lsl	x27, x11, #1
	add	x28, x27, x11
	fmov	d3, x27
	mov.d	v3[1], x28
	lsl	x27, x11, #3
	lsl	x30, x11, #5
	add	x19, x30, x11
	fmov	d4, x30
	mov.d	v4[1], x19
	sub	x19, x27, x11
	lsl	x12, x28, #1
	fmov	d23, x12
	lsl	x12, x11, #2
	mov.d	v23[1], x19
	add	x19, x12, x11
	mov	w13, #11
	mul	x13, x11, x13
	lsl	x14, x19, #1
	fmov	d21, x14
	mov.d	v21[1], x13
	mul	x13, x11, x15
	lsl	x14, x28, #2
	fmov	d19, x14
	mov.d	v19[1], x13
	add	x13, x27, x11
	lsl	x14, x13, #1
	fmov	d18, x14
	mul	x14, x11, x16
	mov.d	v18[1], x14
	lsl	x14, x19, #2
	fmov	d6, x14
	mul	x14, x11, x1
	mov.d	v6[1], x14
	mul	x14, x11, x4
	lsl	x28, x28, #3
	fmov	d5, x28
	mov.d	v5[1], x14
	lsl	x14, x11, #4
	add	x28, x14, x11
	fmov	d25, x14
	mov.d	v25[1], x28
	lsl	x28, x28, #1
	fmov	d24, x28
	mul	x28, x11, x20
	mov.d	v24[1], x28
	mov	w28, #14
	mul	x28, x11, x28
	fmov	d27, x28
	sub	x14, x14, x11
	mov.d	v27[1], x14
	mul	x14, x11, x0
	fmov	d20, x14
	mul	x14, x11, x17
	mov.d	v20[1], x14
	mul	x14, x11, x3
	fmov	d16, x14
	mul	x14, x11, x2
	mov.d	v16[1], x14
	mul	x14, x11, x5
	fmov	d7, x14
	sub	x14, x30, x11
	mov.d	v7[1], x14
	mul	x14, x11, x7
	fmov	d17, x14
	mul	x14, x11, x6
	mov.d	v17[1], x14
	mul	x14, x11, x22
	fmov	d22, x14
	mul	x14, x11, x21
	mov.d	v22[1], x14
	fmov	d28, x27
Lloh30:
	adrp	x14, _ia@GOTPAGE
Lloh31:
	ldr	x14, [x14, _ia@GOTPAGEOFF]
	ldr	x27, [x14, x27]
	mov.d	v28[1], x13
	fmov	d29, x12
	lsl	x12, x13, #2
	fmov	d26, x12
	mul	x12, x11, x23
	mov.d	v29[1], x19
	mov.d	v26[1], x12
	mul	x12, x11, x25
	fmov	d30, x12
	mul	x12, x11, x24
	lsl	x13, x19, #3
	fmov	d31, x13
	mul	x13, x11, x26
	mov.d	v31[1], x13
	mov.d	v30[1], x12
	ucvtf	d8, x8
	fdiv	d8, d8, d2
	fcvtzs	w12, d8
	ucvtf	d8, x9
	fdiv	d8, d8, d2
	fcvtzs	w13, d8
	stp	w12, w13, [x27, #176]
	ucvtf	d8, x10
	fdiv	d8, d8, d2
	fcvtzs	w12, d8
	str	w12, [x27, #184]
	dup.2d	v8, x11
	and.16b	v8, v8, v0
	ucvtf.2d	v3, v3
	ucvtf.2d	v8, v8
	fdiv.2d	v3, v3, v1
	fdiv.2d	v8, v8, v1
	fcvtzs.2d	v3, v3
	fcvtzs.2d	v8, v8
	ucvtf.2d	v29, v29
	xtn.2s	v8, v8
	ucvtf.2d	v23, v23
	fdiv.2d	v23, v23, v1
	fdiv.2d	v29, v29, v1
	fcvtzs.2d	v29, v29
	xtn.2s	v29, v29
	fcvtzs.2d	v23, v23
	ucvtf.2d	v28, v28
	ucvtf.2d	v21, v21
	fdiv.2d	v21, v21, v1
	fdiv.2d	v28, v28, v1
	fcvtzs.2d	v28, v28
	xtn2.4s	v8, v3
	xtn.2s	v3, v28
	fcvtzs.2d	v21, v21
	ucvtf.2d	v19, v19
	ucvtf.2d	v27, v27
	fdiv.2d	v27, v27, v1
	xtn2.4s	v29, v23
	fdiv.2d	v19, v19, v1
	ucvtf.2d	v23, v25
	ucvtf.2d	v18, v18
	fdiv.2d	v18, v18, v1
	fdiv.2d	v23, v23, v1
	xtn2.4s	v3, v21
	fcvtzs.2d	v21, v23
	xtn.2s	v21, v21
	fcvtzs.2d	v18, v18
	ucvtf.2d	v4, v4
	ucvtf.2d	v23, v24
	xtn2.4s	v21, v18
	fdiv.2d	v18, v23, v1
	fdiv.2d	v4, v4, v1
	fcvtzs.2d	v4, v4
	xtn.2s	v4, v4
	fcvtzs.2d	v18, v18
	xtn2.4s	v4, v18
	fcvtzs.2d	v18, v19
	xtn.2s	v18, v18
	fcvtzs.2d	v19, v27
	ucvtf.2d	v6, v6
	stp	q8, q29, [x27]
	ucvtf.2d	v20, v20
	fdiv.2d	v20, v20, v1
	fdiv.2d	v6, v6, v1
	fcvtzs.2d	v6, v6
	xtn.2s	v6, v6
	xtn2.4s	v18, v19
	fcvtzs.2d	v19, v20
	ucvtf.2d	v5, v5
	ucvtf.2d	v16, v16
	fdiv.2d	v16, v16, v1
	fdiv.2d	v5, v5, v1
	xtn2.4s	v6, v19
	fcvtzs.2d	v5, v5
	xtn.2s	v5, v5
	fcvtzs.2d	v16, v16
	ucvtf.2d	v17, v17
	ucvtf.2d	v7, v7
	xtn2.4s	v5, v16
	fdiv.2d	v7, v7, v1
	fdiv.2d	v16, v17, v1
	fcvtzs.2d	v16, v16
	xtn.2s	v16, v16
	fcvtzs.2d	v7, v7
	xtn2.4s	v16, v7
	ucvtf.2d	v7, v26
	ucvtf.2d	v17, v22
	fdiv.2d	v17, v17, v1
	fdiv.2d	v7, v7, v1
	stp	q3, q18, [x27, #32]
	fcvtzs.2d	v3, v7
	xtn.2s	v3, v3
	fcvtzs.2d	v7, v17
	xtn2.4s	v3, v7
	stp	q21, q6, [x27, #64]
	ucvtf.2d	v6, v31
	ucvtf.2d	v7, v30
	fdiv.2d	v7, v7, v1
	fdiv.2d	v6, v6, v1
	stp	q4, q3, [x27, #128]
	fcvtzs.2d	v3, v6
	xtn.2s	v3, v3
	fcvtzs.2d	v4, v7
	xtn2.4s	v3, v4
	stp	q5, q16, [x27, #96]
	str	q3, [x27, #160]
	add	x11, x11, #1
	add	x10, x10, #46
	add	x9, x9, #45
	add	x8, x8, #44
	cmp	x11, #47
	b.ne	LBB2_1
; %bb.2:
	bl	_clock
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	sub	x8, x0, x8
	ucvtf	d0, x8
	mov	x8, #145685290680320
	movk	x8, #16686, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	str	d0, [sp]
Lloh32:
	adrp	x0, l_.str.6@PAGE
Lloh33:
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #16]               ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.loh AdrpLdr	Lloh28, Lloh29
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpLdrGot	Lloh30, Lloh31
	.loh AdrpAdd	Lloh32, Lloh33
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str.1:                               ; @.str.1
	.asciz	"ncols\t\t\t= %zu\n"

l_.str.2:                               ; @.str.2
	.asciz	"elem x cache line\t= %d\n"

l_.str.3:                               ; @.str.3
	.asciz	"Max rows x cache line\t= %u\n"

l_.str.4:                               ; @.str.4
	.asciz	"Empty spots x row\t= %u\n"

l_.str.5:                               ; @.str.5
	.asciz	"Percentage waste x row\t= %.4f\n"

	.comm	_ia,8836,2                      ; @ia
l_.str.6:                               ; @.str.6
	.asciz	"Elapsed = %.20lf\n"

l_str.7:                                ; @str.7
	.asciz	"================================="

.subsections_via_symbols
