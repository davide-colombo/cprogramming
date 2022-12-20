	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_particle3_cache_friendly_grav_force ; -- Begin function particle3_cache_friendly_grav_force
	.p2align	2
_particle3_cache_friendly_grav_force:   ; @particle3_cache_friendly_grav_force
	.cfi_startproc
; %bb.0:
                                        ; kill: def $s0 killed $s0 def $q0
	mov	x8, #0
	dup.4s	v1, v0[0]
	mov	w9, #12
	fmov.4s	v2, #1.00000000
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_2 Depth 2
	mov	x10, #0
	madd	x11, x8, x9, x1
	add	x12, x11, #8
	ld1r.4s	{ v4 }, [x11], #4
	ld1r.4s	{ v5 }, [x11]
	ld1r.4s	{ v6 }, [x12]
	movi	d3, #0000000000000000
	movi	d16, #0000000000000000
	movi	d7, #0000000000000000
LBB0_2:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x11, x1, x10
	add	x10, x10, #96
	ld3.4s	{ v17, v18, v19 }, [x11], #48
	fsub.4s	v20, v17, v4
	ld3.4s	{ v21, v22, v23 }, [x11]
	fsub.4s	v24, v21, v4
	fsub.4s	v25, v18, v5
	fsub.4s	v17, v19, v6
	fsub.4s	v18, v22, v5
	fsub.4s	v19, v23, v6
	fmul.4s	v21, v20, v20
	fmul.4s	v22, v24, v24
	fmul.4s	v23, v25, v25
	fadd.4s	v21, v21, v23
	fmul.4s	v23, v18, v18
	fadd.4s	v22, v22, v23
	fmul.4s	v23, v17, v17
	fadd.4s	v21, v21, v23
	fmul.4s	v23, v19, v19
	fadd.4s	v22, v22, v23
	fsqrt.4s	v21, v21
	fsqrt.4s	v22, v22
	fdiv.4s	v21, v2, v21
	fdiv.4s	v22, v2, v22
	fmul.4s	v23, v21, v21
	fmul.4s	v21, v21, v1
	fmul.4s	v21, v21, v23
	fmul.4s	v23, v22, v22
	fmul.4s	v22, v22, v0[0]
	fmul.4s	v22, v22, v23
	fmul.4s	v20, v20, v21
	fmul.4s	v23, v25, v21
	fmul.4s	v17, v17, v21
	fmul.4s	v21, v24, v22
	fmul.4s	v18, v18, v22
	fmul.4s	v19, v19, v22
	mov	s22, v20[1]
	fadd	s7, s7, s20
	fadd	s7, s7, s22
	mov	s22, v20[2]
	fadd	s7, s7, s22
	mov	s20, v20[3]
	fadd	s7, s7, s20
	mov	s20, v21[1]
	fadd	s7, s7, s21
	fadd	s7, s7, s20
	mov	s20, v21[2]
	fadd	s7, s7, s20
	mov	s20, v21[3]
	fadd	s7, s7, s20
	mov	s20, v23[1]
	fadd	s16, s16, s23
	fadd	s16, s16, s20
	mov	s20, v23[2]
	fadd	s16, s16, s20
	mov	s20, v23[3]
	fadd	s16, s16, s20
	mov	s20, v18[1]
	fadd	s16, s16, s18
	fadd	s16, s16, s20
	mov	s20, v18[2]
	fadd	s16, s16, s20
	mov	s18, v18[3]
	fadd	s16, s16, s18
	mov	s18, v17[1]
	fadd	s3, s3, s17
	fadd	s3, s3, s18
	mov	s18, v17[3]
	mov	s17, v17[2]
	fadd	s3, s3, s17
	mov	s17, v19[3]
	fadd	s3, s3, s18
	mov	s18, v19[2]
	fadd	s3, s3, s19
	mov	s19, v19[1]
	fadd	s3, s3, s19
	fadd	s3, s3, s18
	fadd	s3, s3, s17
	cmp	x10, #12, lsl #12               ; =49152
	b.ne	LBB0_2
; %bb.3:                                ;   in Loop: Header=BB0_1 Depth=1
	madd	x10, x8, x9, x0
	ldr	d4, [x10]
	mov.s	v7[1], v16[0]
	fadd.2s	v4, v7, v4
	str	d4, [x10]
	ldr	s4, [x10, #8]
	fadd	s3, s3, s4
	str	s3, [x10, #8]
	add	x8, x8, #1
	cmp	x8, #1, lsl #12                 ; =4096
	b.ne	LBB0_1
; %bb.4:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_cache_friendly_rand_init_pos3 ; -- Begin function particle3_cache_friendly_rand_init_pos3
	.p2align	2
_particle3_cache_friendly_rand_init_pos3: ; @particle3_cache_friendly_rand_init_pos3
	.cfi_startproc
; %bb.0:
	stp	d15, d14, [sp, #-96]!           ; 16-byte Folded Spill
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset b8, -40
	.cfi_offset b9, -48
	.cfi_offset b10, -56
	.cfi_offset b11, -64
	.cfi_offset b12, -72
	.cfi_offset b13, -80
	.cfi_offset b14, -88
	.cfi_offset b15, -96
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
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d11, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d12, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d13, d8, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d14, d8, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d1, d10, d13
	fcvt	s1, d1
	add	x8, x19, x20
	fadd	d2, d11, d14
	fcvt	s2, d2
	stp	s1, s2, [x8]
	fadd	d0, d12, d0
	fcvt	s0, d0
	str	s0, [x8, #8]
	add	x20, x20, #12
	cmp	x20, #12, lsl #12               ; =49152
	b.ne	LBB1_1
; %bb.2:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #96             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_cache_friendly_rand_init_acc3 ; -- Begin function particle3_cache_friendly_rand_init_acc3
	.p2align	2
_particle3_cache_friendly_rand_init_acc3: ; @particle3_cache_friendly_rand_init_acc3
	.cfi_startproc
; %bb.0:
	stp	d15, d14, [sp, #-96]!           ; 16-byte Folded Spill
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset b8, -40
	.cfi_offset b9, -48
	.cfi_offset b10, -56
	.cfi_offset b11, -64
	.cfi_offset b12, -72
	.cfi_offset b13, -80
	.cfi_offset b14, -88
	.cfi_offset b15, -96
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
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	bl	_rand
	scvtf	d0, w0
	fmul	d10, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d11, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d12, d9, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d13, d8, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d14, d8, d0
	bl	_rand
	scvtf	d0, w0
	fmul	d0, d8, d0
	fadd	d1, d10, d13
	fcvt	s1, d1
	add	x8, x19, x20
	fadd	d2, d11, d14
	fcvt	s2, d2
	stp	s1, s2, [x8]
	fadd	d0, d12, d0
	fcvt	s0, d0
	str	s0, [x8, #8]
	add	x20, x20, #12
	cmp	x20, #12, lsl #12               ; =49152
	b.ne	LBB2_1
; %bb.2:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #96             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_particle3_cache_friendly_print_pos3 ; -- Begin function particle3_cache_friendly_print_pos3
	.p2align	2
_particle3_cache_friendly_print_pos3:   ; @particle3_cache_friendly_print_pos3
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
Lloh0:
	adrp	x19, l_.str@PAGE
Lloh1:
	add	x19, x19, l_.str@PAGEOFF
Lloh2:
	adrp	x20, l_.str.1@PAGE
Lloh3:
	add	x20, x20, l_.str.1@PAGEOFF
Lloh4:
	adrp	x21, l_.str.2@PAGE
Lloh5:
	add	x21, x21, l_.str.2@PAGEOFF
Lloh6:
	adrp	x22, l_.str.3@PAGE
Lloh7:
	add	x22, x22, l_.str.3@PAGEOFF
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
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
	add	x24, x24, #12
	cmp	x23, #1, lsl #12                ; =4096
	b.ne	LBB3_1
; %bb.2:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"particle %d, "

l_.str.1:                               ; @.str.1
	.asciz	"x = %.4f, "

l_.str.2:                               ; @.str.2
	.asciz	"y = %.4f, "

l_.str.3:                               ; @.str.3
	.asciz	"z = %.4f, "

.subsections_via_symbols
