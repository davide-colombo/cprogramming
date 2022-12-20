	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
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
	.cfi_offset b8, -72
	.cfi_offset b9, -80
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	str	xzr, [sp, #40]
	add	x19, sp, #40
	add	x0, sp, #40
	mov	w1, #100
	bl	_buyer_alloc
	cmp	w0, #128
	b.ne	LBB0_2
; %bb.1:
Lloh0:
	adrp	x8, ___stderrp@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh2:
	ldr	x3, [x8]
Lloh3:
	adrp	x0, l_.str@PAGE
Lloh4:
	add	x0, x0, l_.str@PAGEOFF
	mov	w19, #1
	mov	w1, #21
	mov	w2, #1
	bl	_fwrite
	b	LBB0_11
LBB0_2:
	ldr	x8, [sp, #40]
	ldr	x9, [x8]
	stp	x8, x9, [sp, #8]
	str	x19, [sp]
Lloh5:
	adrp	x0, l_.str.1@PAGE
Lloh6:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	str	xzr, [sp, #32]
	add	x0, sp, #32
	mov	w1, #100
	bl	_order_head_alloc
	cmp	w0, #128
	b.ne	LBB0_4
; %bb.3:
Lloh7:
	adrp	x8, ___stderrp@GOTPAGE
Lloh8:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh9:
	ldr	x3, [x8]
Lloh10:
	adrp	x0, l_.str.2@PAGE
Lloh11:
	add	x0, x0, l_.str.2@PAGEOFF
	mov	w19, #1
	mov	w1, #31
	mov	w2, #1
	bl	_fwrite
	add	x0, sp, #40
	bl	_buyer_free
                                        ; kill: def $w19 killed $w19 killed $x19 def $x19
	b	LBB0_11
LBB0_4:
	mov	x20, #0
	str	xzr, [sp, #24]
	mov	x21, #2097152
	movk	x21, #15872, lsl #48
	mov	x22, #70368744177664
	movk	x22, #16527, lsl #48
Lloh12:
	adrp	x19, l_.str.4@PAGE
Lloh13:
	add	x19, x19, l_.str.4@PAGEOFF
LBB0_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
	ldr	x8, [sp, #40]
	str	x20, [x8]
	add	x0, sp, #24
	mov	w1, #50
	bl	_order_alloc
	cmp	w0, #128
	b.eq	LBB0_10
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=1
	mov	x23, #0
LBB0_7:                                 ;   Parent Loop BB0_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	bl	_rand
	scvtf	d0, w0
	fmov	d1, x21
	fmul	d8, d0, d1
	fmov	d0, x22
	fmul	d0, d8, d0
	str	d0, [sp]
	mov	x0, x19
	bl	_printf
	fcvt	s0, d8
	ldr	x8, [sp, #24]
	str	s0, [x8, x23]
	add	x23, x23, #4
	cmp	x23, #200
	b.ne	LBB0_7
; %bb.8:                                ;   in Loop: Header=BB0_5 Depth=1
	ldr	x9, [sp, #32]
	str	x8, [x9, x20, lsl #3]
	add	x20, x20, #1
	cmp	x20, #100
	b.ne	LBB0_5
; %bb.9:
	add	x0, sp, #40
	bl	_buyer_free
	mov	w19, #0
	b	LBB0_11
LBB0_10:
Lloh14:
	adrp	x8, ___stderrp@GOTPAGE
Lloh15:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh16:
	ldr	x0, [x8]
	str	x20, [sp]
Lloh17:
	adrp	x1, l_.str.3@PAGE
Lloh18:
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fprintf
	add	x0, sp, #40
	bl	_buyer_free
	add	x0, sp, #32
	bl	_order_head_free
	mov	w19, #1
LBB0_11:
	mov	x0, x19
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpAdd	Lloh5, Lloh6
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpLdrGotLdr	Lloh7, Lloh8, Lloh9
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh17, Lloh18
	.loh AdrpLdrGotLdr	Lloh14, Lloh15, Lloh16
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Bad alloc for buyers\n"

l_.str.1:                               ; @.str.1
	.asciz	"&buyers = %p\tbuyers = %p\tbuyers->id = %llu\n"

l_.str.2:                               ; @.str.2
	.asciz	"Bad alloc for paid orders head\n"

l_.str.3:                               ; @.str.3
	.asciz	"Bad alloc for paid orders array %llu\n"

l_.str.4:                               ; @.str.4
	.asciz	"p1 = %.4f\n"

.subsections_via_symbols
