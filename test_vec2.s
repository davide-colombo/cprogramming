	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
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
	bl	_vector2_print_vector2_type_info
Lloh0:
	adrp	x19, _v@GOTPAGE
Lloh1:
	ldr	x19, [x19, _v@GOTPAGEOFF]
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	fmov	d0, x8
	fmov	d1, #10.00000000
	mov	x0, x19
	bl	_vector2_rand_init_vector2
	mov	x0, x19
	bl	_vector2_print_vector2_data
	bl	_vector2_alloc_vector2
	cbz	x0, LBB0_3
; %bb.1:
	mov	x19, x0
	bl	_vector2_alloc_vector2
	cbz	x0, LBB0_4
; %bb.2:
	mov	x20, x0
	mov	x8, #4650248090236747776
	fmov	d0, x8
	fmov	d1, #20.00000000
	mov	x0, x19
	bl	_vector2_rand_init_vector2
	mov	x0, x19
	bl	_vector2_print_vector2_data
	mov	x0, x19
	bl	_vector2_free_vector2
	mov	x0, x20
	bl	_vector2_free_vector2
	mov	w19, #0
	b	LBB0_5
LBB0_3:
Lloh2:
	adrp	x8, ___stderrp@GOTPAGE
Lloh3:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh4:
	ldr	x3, [x8]
Lloh5:
	adrp	x0, l_.str@PAGE
Lloh6:
	add	x0, x0, l_.str@PAGEOFF
	mov	w19, #1
	mov	w1, #37
	mov	w2, #1
	bl	_fwrite
	b	LBB0_5
LBB0_4:
Lloh7:
	adrp	x8, ___stderrp@GOTPAGE
Lloh8:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh9:
	ldr	x3, [x8]
Lloh10:
	adrp	x0, l_.str.1@PAGE
Lloh11:
	add	x0, x0, l_.str.1@PAGEOFF
	mov	w1, #38
	mov	w2, #1
	bl	_fwrite
	mov	w19, #2
LBB0_5:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh0, Lloh1
	.loh AdrpAdd	Lloh5, Lloh6
	.loh AdrpLdrGotLdr	Lloh2, Lloh3, Lloh4
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpLdrGotLdr	Lloh7, Lloh8, Lloh9
	.cfi_endproc
                                        ; -- End function
	.comm	_v,800,3                        ; @v
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Cannot allocate memory for v2 object\n"

l_.str.1:                               ; @.str.1
	.asciz	"Cannot allocate memory for sum object\n"

.subsections_via_symbols
