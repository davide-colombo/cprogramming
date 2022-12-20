	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_particle3_gravitational_force  ; -- Begin function particle3_gravitational_force
	.p2align	2
_particle3_gravitational_force:         ; @particle3_gravitational_force
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #144
	stp	d9, d8, [sp, #80]               ; 16-byte Folded Spill
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
	.cfi_offset b8, -56
	.cfi_offset b9, -64
                                        ; kill: def $s0 killed $s0 def $q0
	mov	x19, x0
	mov	x21, #0
	dup.4s	v8, v0[0]
	mov	w22, #36
	fmov.4s	v9, #1.00000000
Lloh0:
	adrp	x20, l_.str@PAGE
Lloh1:
	add	x20, x20, l_.str@PAGEOFF
	stp	q8, q0, [sp, #48]               ; 32-byte Folded Spill
	str	q9, [sp, #32]                   ; 16-byte Folded Spill
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_2 Depth 2
	mov	x8, #0
	madd	x9, x21, x22, x19
	add	x10, x9, #8
	ld1r.4s	{ v31 }, [x9], #4
	ld1r.4s	{ v1 }, [x9]
	ld1r.4s	{ v2 }, [x10]
	movi	d3, #0000000000000000
	movi	d4, #0000000000000000
	movi	d5, #0000000000000000
LBB0_2:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x9, x19, x8
	add	x2, x9, #36
	add	x3, x9, #72
	add	x10, x9, #108
	add	x14, x9, #180
	add	x15, x9, #216
	add	x11, x9, #252
	add	x16, x9, #324
	add	x17, x9, #360
	add	x12, x9, #396
	add	x1, x9, #468
	add	x0, x9, #504
	add	x13, x9, #540
	ldp	s6, s7, [x9]
	ld1.s	{ v6 }[1], [x2]
	ld1.s	{ v6 }[2], [x3]
	ldp	s16, s17, [x9, #144]
	ld1.s	{ v16 }[1], [x14]
	ld1.s	{ v16 }[2], [x15]
	ldr	s18, [x9, #288]
	ld1.s	{ v18 }[1], [x16]
	ldr	s19, [x9, #432]
	ld1.s	{ v18 }[2], [x17]
	ld1.s	{ v19 }[1], [x1]
	add	x14, x9, #40
	add	x15, x9, #76
	ld1.s	{ v19 }[2], [x0]
	add	x16, x9, #112
	add	x17, x9, #184
	add	x0, x9, #220
	add	x1, x9, #256
	ld1.s	{ v6 }[3], [x10]
	add	x10, x9, #328
	add	x2, x9, #364
	add	x3, x9, #400
	add	x4, x9, #472
	ld1.s	{ v16 }[3], [x11]
	ld1.s	{ v7 }[1], [x14]
	ld1.s	{ v7 }[2], [x15]
	ld1.s	{ v18 }[3], [x12]
	ld1.s	{ v17 }[1], [x17]
	ld1.s	{ v17 }[2], [x0]
	ld1.s	{ v19 }[3], [x13]
	add	x11, x9, #508
	ldr	s20, [x9, #292]
	ld1.s	{ v20 }[1], [x10]
	ld1.s	{ v7 }[3], [x16]
	add	x10, x9, #544
	ld1.s	{ v20 }[2], [x2]
	ldr	s26, [x9, #436]
	ld1.s	{ v17 }[3], [x1]
	ld1.s	{ v26 }[1], [x4]
	ld1.s	{ v26 }[2], [x11]
	ld1.s	{ v20 }[3], [x3]
	ld1.s	{ v26 }[3], [x10]
	add	x10, x9, #44
	add	x11, x9, #80
	add	x12, x9, #116
	fsub.4s	v25, v6, v31
	add	x13, x9, #188
	add	x14, x9, #224
	add	x15, x9, #260
	add	x16, x9, #332
	add	x17, x9, #368
	fsub.4s	v23, v16, v31
	add	x0, x9, #404
	add	x1, x9, #476
	ldr	s6, [x9, #8]
	ld1.s	{ v6 }[1], [x10]
	fsub.4s	v22, v7, v1
	add	x10, x9, #512
	ld1.s	{ v6 }[2], [x11]
	ld1.s	{ v6 }[3], [x12]
	fsub.4s	v24, v18, v31
	ldr	s16, [x9, #152]
	ld1.s	{ v16 }[1], [x13]
	ld1.s	{ v16 }[2], [x14]
	fsub.4s	v7, v19, v31
	ld1.s	{ v16 }[3], [x15]
	ldr	s27, [x9, #296]
	ld1.s	{ v27 }[1], [x16]
	fsub.4s	v21, v17, v1
	add	x11, x9, #548
	ld1.s	{ v27 }[2], [x17]
	ld1.s	{ v27 }[3], [x0]
	fsub.4s	v19, v20, v1
	ldr	s28, [x9, #440]
	ld1.s	{ v28 }[1], [x1]
	ld1.s	{ v28 }[2], [x10]
	fsub.4s	v20, v26, v1
	ld1.s	{ v28 }[3], [x11]
	fsub.4s	v18, v6, v2
	fsub.4s	v17, v16, v2
	fsub.4s	v16, v27, v2
	fsub.4s	v6, v28, v2
	fmul.4s	v26, v25, v25
	fmul.4s	v27, v23, v23
	fmul.4s	v28, v24, v24
	fmul.4s	v29, v22, v22
	fadd.4s	v26, v26, v29
	fmul.4s	v29, v7, v7
	fmul.4s	v30, v21, v21
	fadd.4s	v27, v27, v30
	fmul.4s	v30, v19, v19
	fadd.4s	v28, v28, v30
	fmul.4s	v30, v20, v20
	fadd.4s	v29, v29, v30
	fmul.4s	v30, v18, v18
	fadd.4s	v26, v26, v30
	fmul.4s	v30, v17, v17
	fadd.4s	v27, v27, v30
	fmul.4s	v30, v16, v16
	fadd.4s	v28, v28, v30
	fmul.4s	v30, v6, v6
	fadd.4s	v29, v29, v30
	fsqrt.4s	v26, v26
	fsqrt.4s	v27, v27
	fsqrt.4s	v28, v28
	fsqrt.4s	v29, v29
	fdiv.4s	v26, v9, v26
	fdiv.4s	v27, v9, v27
	fdiv.4s	v28, v9, v28
	fmul.4s	v30, v26, v26
	fmul.4s	v26, v26, v30
	fdiv.4s	v29, v9, v29
	fmul.4s	v30, v27, v27
	fmul.4s	v30, v27, v30
	fmul.4s	v27, v28, v28
	fmul.4s	v28, v28, v27
	fmul.4s	v27, v29, v29
	fmul.4s	v27, v29, v27
	fmul.4s	v26, v26, v8
	fmul.4s	v25, v25, v26
	mov	s29, v25[1]
	fadd	s5, s5, s25
	fadd	s5, s5, s29
	mov	s29, v25[2]
	fadd	s5, s5, s29
	fmul.4s	v29, v30, v8
	mov	s25, v25[3]
	fmul.4s	v23, v23, v29
	fadd	s5, s5, s25
	mov	s25, v23[1]
	fadd	s5, s5, s23
	fadd	s5, s5, s25
	mov	s25, v23[2]
	fadd	s5, s5, s25
	fmul.4s	v25, v28, v8
	mov	s23, v23[3]
	fmul.4s	v24, v24, v25
	fadd	s5, s5, s23
	mov	s23, v24[1]
	fadd	s5, s5, s24
	fadd	s5, s5, s23
	mov	s23, v24[2]
	fadd	s5, s5, s23
	fmul.4s	v22, v22, v26
	mov	s23, v22[1]
	fadd	s4, s4, s22
	fadd	s4, s4, s23
	mov	s23, v22[2]
	fadd	s4, s4, s23
	mov	s22, v22[3]
	fadd	s4, s4, s22
	mov	s22, v24[3]
	fmul.4s	v21, v21, v29
	fadd	s5, s5, s22
	mov	s22, v21[1]
	fadd	s4, s4, s21
	fadd	s4, s4, s22
	mov	s22, v21[2]
	fadd	s4, s4, s22
	fmul.4s	v22, v27, v0[0]
	fmul.4s	v7, v7, v22
	mov	s21, v21[3]
	fmul.4s	v19, v19, v25
	fadd	s4, s4, s21
	mov	s21, v19[1]
	fadd	s4, s4, s19
	fadd	s4, s4, s21
	mov	s21, v19[2]
	fadd	s4, s4, s21
	mov	s21, v7[1]
	fadd	s5, s5, s7
	fadd	s5, s5, s21
	mov	s19, v19[3]
	fmul.4s	v20, v20, v22
	fadd	s4, s4, s19
	mov	s19, v20[1]
	fadd	s4, s4, s20
	fadd	s4, s4, s19
	fmul.4s	v18, v18, v26
	fmul.4s	v17, v17, v29
	fmul.4s	v16, v16, v25
	fmul.4s	v6, v6, v22
	mov	s19, v7[2]
	fadd	s5, s5, s19
	mov	s19, v18[1]
	fadd	s3, s3, s18
	fadd	s3, s3, s19
	mov	s19, v18[2]
	fadd	s3, s3, s19
	mov	s18, v18[3]
	fadd	s3, s3, s18
	mov	s18, v17[1]
	fadd	s3, s3, s17
	fadd	s3, s3, s18
	mov	s18, v20[2]
	fadd	s4, s4, s18
	mov	s18, v17[2]
	fadd	s3, s3, s18
	mov	s17, v17[3]
	fadd	s3, s3, s17
	mov	s7, v7[3]
	fadd	s5, s5, s7
	mov	s7, v16[1]
	fadd	s3, s3, s16
	fadd	s3, s3, s7
	mov	s7, v16[2]
	fadd	s3, s3, s7
	mov	s7, v16[3]
	fadd	s3, s3, s7
	mov	s7, v6[1]
	fadd	s3, s3, s6
	fadd	s3, s3, s7
	mov	s7, v20[3]
	fadd	s4, s4, s7
	mov	s7, v6[2]
	fadd	s3, s3, s7
	mov	s6, v6[3]
	fadd	s3, s3, s6
	add	x8, x8, #576
	cmp	x8, #36, lsl #12                ; =147456
	b.ne	LBB0_2
; %bb.3:                                ;   in Loop: Header=BB0_1 Depth=1
	madd	x8, x21, x22, x19
	ldr	d2, [x8, #24]
	mov.16b	v1, v5
	mov.s	v1[1], v4[0]
	fadd.2s	v1, v1, v2
	str	d1, [x8, #24]
	ldr	s1, [x8, #32]
	fadd	s1, s3, s1
	str	s1, [x8, #32]
	fcvt	d5, s5
	fcvt	d1, s4
	fcvt	d2, s3
	stp	d1, d2, [sp, #8]
	str	d5, [sp]
	mov	x0, x20
	bl	_printf
	ldp	q9, q8, [sp, #32]               ; 32-byte Folded Reload
	ldr	q0, [sp, #64]                   ; 16-byte Folded Reload
	add	x21, x21, #1
	cmp	x21, #1, lsl #12                ; =4096
	b.ne	LBB0_1
; %bb.4:
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #80]               ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_rand_init            ; -- Begin function particle3_rand_init
	.p2align	2
_particle3_rand_init:                   ; @particle3_rand_init
	.cfi_startproc
; %bb.0:
	stp	d9, d8, [sp, #-64]!             ; 16-byte Folded Spill
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
	.cfi_offset b8, -56
	.cfi_offset b9, -64
	mov	x19, x0
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	mov	x20, #0
	add	x19, x19, #16
	mov	x21, #2097152
	movk	x21, #15872, lsl #48
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
	scvtf	d0, w0
	fmov	d8, x21
	fmul	d0, d0, d8
	fcvt	s0, d0
	add	x22, x19, x20
	stur	s0, [x22, #-16]
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d0, d8
	fcvt	s0, d0
	stur	s0, [x22, #-12]
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d0, d8
	fcvt	s0, d0
	stur	s0, [x22, #-8]
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d0, d8
	fcvt	s0, d0
	stur	s0, [x22, #-4]
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d0, d8
	fcvt	s0, d0
	str	s0, [x22]
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d0, d8
	fcvt	s0, d0
	str	s0, [x22, #4]
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d0, d8
	fcvt	s0, d0
	str	s0, [x22, #8]
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d0, d8
	fcvt	s0, d0
	str	s0, [x22, #12]
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d0, d8
	fcvt	s0, d0
	str	s0, [x22, #16]
	add	x20, x20, #36
	cmp	x20, #36, lsl #12               ; =147456
	b.ne	LBB1_1
; %bb.2:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp], #64               ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_print                ; -- Begin function particle3_print
	.p2align	2
_particle3_print:                       ; @particle3_print
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
	stp	d11, d10, [sp, #16]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               ; 16-byte Folded Spill
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
	.cfi_offset b8, -72
	.cfi_offset b9, -80
	.cfi_offset b10, -88
	.cfi_offset b11, -96
	mov	x23, #0
	add	x24, x0, #4
Lloh2:
	adrp	x19, l_.str.1@PAGE
Lloh3:
	add	x19, x19, l_.str.1@PAGEOFF
Lloh4:
	adrp	x20, l_.str.2@PAGE
Lloh5:
	add	x20, x20, l_.str.2@PAGEOFF
Lloh6:
	adrp	x21, l_.str.3@PAGE
Lloh7:
	add	x21, x21, l_.str.3@PAGEOFF
Lloh8:
	adrp	x22, l_.str.4@PAGE
Lloh9:
	add	x22, x22, l_.str.4@PAGEOFF
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldp	s8, s9, [x24, #-4]
	ldr	s10, [x24, #4]
	str	x23, [sp]
	mov	x0, x19
	bl	_printf
	fcvt	d0, s8
	str	d0, [sp]
	mov	x0, x20
	bl	_printf
	fcvt	d0, s9
	str	d0, [sp]
	mov	x0, x21
	bl	_printf
	fcvt	d0, s10
	str	d0, [sp]
	mov	x0, x22
	bl	_printf
	add	x23, x23, #1
	add	x24, x24, #36
	cmp	x23, #1, lsl #12                ; =4096
	b.ne	LBB2_1
; %bb.2:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"net_acc.x = %.8f\tnet_acc.y = %.8f\tnet_acc.z = %.8f\n"

l_.str.1:                               ; @.str.1
	.asciz	"particle %d: "

l_.str.2:                               ; @.str.2
	.asciz	"pos.x = %.4f, "

l_.str.3:                               ; @.str.3
	.asciz	"pos.y = %.4f, "

l_.str.4:                               ; @.str.4
	.asciz	"pos.z = %.4f\n"

.subsections_via_symbols
