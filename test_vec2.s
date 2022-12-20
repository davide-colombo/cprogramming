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
Lloh0:
	adrp	x19, _v@GOTPAGE
Lloh1:
	ldr	x19, [x19, _v@GOTPAGEOFF]
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	fmov	d0, x8
	fmov	d1, #10.00000000
	mov	x0, x19
	bl	_vector2_rand_init
	mov	x0, x19
	bl	_vector2_print
	mov	w0, #0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.comm	_v,800,3                        ; @v
.subsections_via_symbols
