	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	stp	d9, d8, [sp, #-32]!             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset b8, -24
	.cfi_offset b9, -32
Lloh0:
	adrp	x0, _pos@GOTPAGE
Lloh1:
	ldr	x0, [x0, _pos@GOTPAGEOFF]
	mov	x8, #70368744177664
	movk	x8, #16527, lsl #48
	fmov	d8, x8
	fmov	d1, #10.00000000
	fmov	d0, d8
	bl	_particle3_cache_friendly_rand_init_pos3
Lloh2:
	adrp	x0, _acc@GOTPAGE
Lloh3:
	ldr	x0, [x0, _acc@GOTPAGEOFF]
	fmov	d1, #10.00000000
	fmov	d0, d8
	bl	_particle3_cache_friendly_rand_init_acc3
	mov	w0, #0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp], #32               ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.comm	_pos,49152,2                    ; @pos
	.comm	_acc,49152,2                    ; @acc
.subsections_via_symbols
