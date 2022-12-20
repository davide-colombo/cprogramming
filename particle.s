	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_particle3_gravitational_force  ; -- Begin function particle3_gravitational_force
	.p2align	2
_particle3_gravitational_force:         ; @particle3_gravitational_force
	.cfi_startproc
; %bb.0:
	stp	d9, d8, [sp, #-16]!             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	.cfi_offset b8, -8
	.cfi_offset b9, -16
                                        ; kill: def $s0 killed $s0 def $q0
	mov	x8, #0
	dup.4s	v1, v0[0]
	mov	w9, #36
	fmov.4s	v2, #1.00000000
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_2 Depth 2
	mov	x10, #0
	madd	x11, x8, x9, x0
	add	x12, x11, #8
	ld1r.4s	{ v3 }, [x11], #4
	ld1r.4s	{ v4 }, [x11]
	ld1r.4s	{ v5 }, [x12]
	movi	d6, #0000000000000000
	movi	d7, #0000000000000000
	movi	d16, #0000000000000000
LBB0_2:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x11, x0, x10
	add	x5, x11, #36
	add	x6, x11, #72
	add	x12, x11, #108
	add	x16, x11, #180
	add	x17, x11, #216
	add	x13, x11, #252
	add	x1, x11, #324
	add	x2, x11, #360
	add	x14, x11, #396
	add	x4, x11, #468
	add	x3, x11, #504
	add	x15, x11, #540
	ldp	s17, s18, [x11]
	ld1.s	{ v17 }[1], [x5]
	ld1.s	{ v17 }[2], [x6]
	ldp	s19, s20, [x11, #144]
	ld1.s	{ v19 }[1], [x16]
	ld1.s	{ v19 }[2], [x17]
	ldr	s21, [x11, #288]
	ld1.s	{ v21 }[1], [x1]
	ldr	s22, [x11, #432]
	ld1.s	{ v21 }[2], [x2]
	ld1.s	{ v22 }[1], [x4]
	add	x16, x11, #40
	add	x17, x11, #76
	ld1.s	{ v22 }[2], [x3]
	add	x1, x11, #112
	add	x2, x11, #184
	add	x3, x11, #220
	add	x4, x11, #256
	ld1.s	{ v17 }[3], [x12]
	add	x12, x11, #328
	add	x5, x11, #364
	add	x6, x11, #400
	add	x7, x11, #472
	ld1.s	{ v19 }[3], [x13]
	ld1.s	{ v18 }[1], [x16]
	ld1.s	{ v18 }[2], [x17]
	ld1.s	{ v21 }[3], [x14]
	ld1.s	{ v20 }[1], [x2]
	ld1.s	{ v20 }[2], [x3]
	ld1.s	{ v22 }[3], [x15]
	add	x13, x11, #508
	ldr	s23, [x11, #292]
	ld1.s	{ v23 }[1], [x12]
	ld1.s	{ v18 }[3], [x1]
	add	x12, x11, #544
	ld1.s	{ v23 }[2], [x5]
	ldr	s29, [x11, #436]
	ld1.s	{ v20 }[3], [x4]
	ld1.s	{ v29 }[1], [x7]
	ld1.s	{ v29 }[2], [x13]
	ld1.s	{ v23 }[3], [x6]
	ld1.s	{ v29 }[3], [x12]
	add	x12, x11, #44
	add	x13, x11, #80
	add	x14, x11, #116
	fsub.4s	v28, v17, v3
	add	x15, x11, #188
	add	x16, x11, #224
	add	x17, x11, #260
	add	x1, x11, #332
	add	x2, x11, #368
	fsub.4s	v26, v19, v3
	add	x3, x11, #404
	add	x4, x11, #476
	ldr	s17, [x11, #8]
	ld1.s	{ v17 }[1], [x12]
	fsub.4s	v25, v18, v4
	add	x12, x11, #512
	ld1.s	{ v17 }[2], [x13]
	ld1.s	{ v17 }[3], [x14]
	fsub.4s	v27, v21, v3
	ldr	s19, [x11, #152]
	ld1.s	{ v19 }[1], [x15]
	ld1.s	{ v19 }[2], [x16]
	fsub.4s	v18, v22, v3
	ld1.s	{ v19 }[3], [x17]
	ldr	s30, [x11, #296]
	ld1.s	{ v30 }[1], [x1]
	fsub.4s	v24, v20, v4
	add	x13, x11, #548
	ld1.s	{ v30 }[2], [x2]
	ld1.s	{ v30 }[3], [x3]
	fsub.4s	v22, v23, v4
	ldr	s31, [x11, #440]
	ld1.s	{ v31 }[1], [x4]
	ld1.s	{ v31 }[2], [x12]
	fsub.4s	v23, v29, v4
	ld1.s	{ v31 }[3], [x13]
	fsub.4s	v21, v17, v5
	fsub.4s	v20, v19, v5
	fsub.4s	v19, v30, v5
	fsub.4s	v17, v31, v5
	fmul.4s	v29, v28, v28
	fmul.4s	v30, v26, v26
	fmul.4s	v31, v27, v27
	fmul.4s	v8, v25, v25
	fadd.4s	v29, v29, v8
	fmul.4s	v8, v18, v18
	fmul.4s	v9, v24, v24
	fadd.4s	v30, v30, v9
	fmul.4s	v9, v22, v22
	fadd.4s	v31, v31, v9
	fmul.4s	v9, v23, v23
	fadd.4s	v8, v8, v9
	fmul.4s	v9, v21, v21
	fadd.4s	v29, v29, v9
	fmul.4s	v9, v20, v20
	fadd.4s	v30, v30, v9
	fmul.4s	v9, v19, v19
	fadd.4s	v31, v31, v9
	fmul.4s	v9, v17, v17
	fadd.4s	v8, v8, v9
	fsqrt.4s	v29, v29
	fsqrt.4s	v30, v30
	fsqrt.4s	v31, v31
	fsqrt.4s	v8, v8
	fdiv.4s	v29, v2, v29
	fdiv.4s	v30, v2, v30
	fdiv.4s	v31, v2, v31
	fmul.4s	v9, v29, v29
	fmul.4s	v29, v29, v9
	fdiv.4s	v8, v2, v8
	fmul.4s	v9, v30, v30
	fmul.4s	v9, v30, v9
	fmul.4s	v30, v31, v31
	fmul.4s	v31, v31, v30
	fmul.4s	v30, v8, v8
	fmul.4s	v30, v8, v30
	fmul.4s	v29, v29, v1
	fmul.4s	v28, v28, v29
	mov	s8, v28[1]
	fadd	s16, s16, s28
	fadd	s16, s16, s8
	mov	s8, v28[2]
	fadd	s16, s16, s8
	fmul.4s	v8, v9, v1
	mov	s28, v28[3]
	fmul.4s	v26, v26, v8
	fadd	s16, s16, s28
	mov	s28, v26[1]
	fadd	s16, s16, s26
	fadd	s16, s16, s28
	mov	s28, v26[2]
	fadd	s16, s16, s28
	fmul.4s	v28, v31, v1
	mov	s26, v26[3]
	fmul.4s	v27, v27, v28
	fadd	s16, s16, s26
	mov	s26, v27[1]
	fadd	s16, s16, s27
	fadd	s16, s16, s26
	mov	s26, v27[2]
	fadd	s16, s16, s26
	fmul.4s	v25, v25, v29
	mov	s26, v25[1]
	fadd	s7, s7, s25
	fadd	s7, s7, s26
	mov	s26, v25[2]
	fadd	s7, s7, s26
	mov	s25, v25[3]
	fadd	s7, s7, s25
	mov	s25, v27[3]
	fmul.4s	v24, v24, v8
	fadd	s16, s16, s25
	mov	s25, v24[1]
	fadd	s7, s7, s24
	fadd	s7, s7, s25
	mov	s25, v24[2]
	fadd	s7, s7, s25
	fmul.4s	v25, v30, v0[0]
	fmul.4s	v18, v18, v25
	mov	s24, v24[3]
	fmul.4s	v22, v22, v28
	fadd	s7, s7, s24
	mov	s24, v22[1]
	fadd	s7, s7, s22
	fadd	s7, s7, s24
	mov	s24, v22[2]
	fadd	s7, s7, s24
	mov	s24, v18[1]
	fadd	s16, s16, s18
	fadd	s16, s16, s24
	mov	s22, v22[3]
	fmul.4s	v23, v23, v25
	fadd	s7, s7, s22
	mov	s22, v23[1]
	fadd	s7, s7, s23
	fadd	s7, s7, s22
	fmul.4s	v21, v21, v29
	fmul.4s	v20, v20, v8
	fmul.4s	v19, v19, v28
	fmul.4s	v17, v17, v25
	mov	s22, v18[2]
	fadd	s16, s16, s22
	mov	s22, v21[1]
	fadd	s6, s6, s21
	fadd	s6, s6, s22
	mov	s22, v21[2]
	fadd	s6, s6, s22
	mov	s21, v21[3]
	fadd	s6, s6, s21
	mov	s21, v20[1]
	fadd	s6, s6, s20
	fadd	s6, s6, s21
	mov	s21, v23[2]
	fadd	s7, s7, s21
	mov	s21, v20[2]
	fadd	s6, s6, s21
	mov	s20, v20[3]
	fadd	s6, s6, s20
	mov	s18, v18[3]
	fadd	s16, s16, s18
	mov	s18, v19[1]
	fadd	s6, s6, s19
	fadd	s6, s6, s18
	mov	s18, v19[2]
	fadd	s6, s6, s18
	mov	s18, v19[3]
	fadd	s6, s6, s18
	mov	s18, v17[1]
	fadd	s6, s6, s17
	fadd	s6, s6, s18
	mov	s18, v23[3]
	fadd	s7, s7, s18
	mov	s18, v17[2]
	fadd	s6, s6, s18
	mov	s17, v17[3]
	fadd	s6, s6, s17
	add	x10, x10, #576
	cmp	x10, #36, lsl #12               ; =147456
	b.ne	LBB0_2
; %bb.3:                                ;   in Loop: Header=BB0_1 Depth=1
	madd	x10, x8, x9, x0
	ldr	d3, [x10, #24]
	mov.s	v16[1], v7[0]
	fadd.2s	v3, v16, v3
	str	d3, [x10, #24]
	ldr	s3, [x10, #32]
	fadd	s3, s6, s3
	str	s3, [x10, #32]
	add	x8, x8, #1
	cmp	x8, #1, lsl #12                 ; =4096
	b.ne	LBB0_1
; %bb.4:
	ldp	d9, d8, [sp], #16               ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
