	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 1
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112
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
	mov	x0, #0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	stur	xzr, [x29, #-40]
	sub	x19, x29, #40
	sub	x0, x29, #40
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
	b	LBB0_16
LBB0_2:
	ldur	x8, [x29, #-40]
	ldr	x9, [x8]
	stp	x8, x9, [sp, #8]
	str	x19, [sp]
Lloh5:
	adrp	x0, l_.str.1@PAGE
Lloh6:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	str	xzr, [sp, #48]
	add	x0, sp, #48
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
	sub	x0, x29, #40
	bl	_buyer_free
                                        ; kill: def $w19 killed $w19 killed $x19 def $x19
	b	LBB0_16
LBB0_4:
	mov	x19, #0
	str	xzr, [sp, #40]
	mov	x20, #2097152
	movk	x20, #15872, lsl #48
	mov	x21, #70368744177664
	movk	x21, #16527, lsl #48
LBB0_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
	ldur	x8, [x29, #-40]
	str	x19, [x8, x19, lsl #3]
	add	x0, sp, #40
	mov	w1, #50
	bl	_order_alloc
	cmp	w0, #128
	b.eq	LBB0_13
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=1
	mov	x22, #0
LBB0_7:                                 ;   Parent Loop BB0_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	bl	_rand
	scvtf	d0, w0
	fmov	d1, x20
	fmul	d0, d0, d1
	fmov	d1, x21
	fmul	d0, d0, d1
	fcvt	s0, d0
	ldr	x8, [sp, #40]
	str	s0, [x8, x22]
	add	x22, x22, #4
	cmp	x22, #200
	b.ne	LBB0_7
; %bb.8:                                ;   in Loop: Header=BB0_5 Depth=1
	ldr	x9, [sp, #48]
	str	x8, [x9, x19, lsl #3]
	add	x19, x19, #1
	cmp	x19, #100
	b.ne	LBB0_5
; %bb.9:
	ldr	x8, [sp, #48]
	add	x9, x8, #792
	stp	x8, x9, [sp]
Lloh12:
	adrp	x0, l_.str.4@PAGE
Lloh13:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	mov	x21, #0
Lloh14:
	adrp	x19, l_.str.6@PAGE
Lloh15:
	add	x19, x19, l_.str.6@PAGEOFF
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-40]
	ldr	x22, [x8, x21]
	ldr	x8, [sp, #48]
	ldr	x20, [x8, x22, lsl #3]
	add	x0, sp, #32
	mov	x1, x20
	mov	w2, #50
	bl	_order_sum_price
	cmp	w0, #130
	b.eq	LBB0_14
; %bb.11:                               ;   in Loop: Header=BB0_10 Depth=1
	ldr	d0, [sp, #32]
	str	d0, [sp, #16]
	stp	x22, x20, [sp]
	mov	x0, x19
	bl	_printf
	add	x21, x21, #8
	cmp	x21, #800
	b.ne	LBB0_10
; %bb.12:
	mov	w19, #0
	b	LBB0_15
LBB0_13:
Lloh16:
	adrp	x8, ___stderrp@GOTPAGE
Lloh17:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh18:
	ldr	x0, [x8]
	str	x19, [sp]
Lloh19:
	adrp	x1, l_.str.3@PAGE
Lloh20:
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fprintf
	sub	x0, x29, #40
	bl	_buyer_free
	add	x0, sp, #48
	mov	w1, #100
	bl	_order_head_free
	mov	w19, #1
	b	LBB0_16
LBB0_14:
Lloh21:
	adrp	x8, ___stderrp@GOTPAGE
Lloh22:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh23:
	ldr	x0, [x8]
	stp	x20, x22, [sp]
Lloh24:
	adrp	x1, l_.str.5@PAGE
Lloh25:
	add	x1, x1, l_.str.5@PAGEOFF
	bl	_fprintf
	mov	w19, #1
LBB0_15:
	sub	x0, x29, #40
	bl	_buyer_free
	add	x0, sp, #48
	mov	w1, #100
	bl	_order_head_free
LBB0_16:
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
	.loh AdrpAdd	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpAdd	Lloh5, Lloh6
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpLdrGotLdr	Lloh7, Lloh8, Lloh9
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh19, Lloh20
	.loh AdrpLdrGotLdr	Lloh16, Lloh17, Lloh18
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpLdrGotLdr	Lloh21, Lloh22, Lloh23
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
	.asciz	"paid_orders_head = %p\t(paid_orders_head+99) = %p\n"

l_.str.5:                               ; @.str.5
	.asciz	"Error while summing price: oinit = %p\tis= %llu\n"

l_.str.6:                               ; @.str.6
	.asciz	"id = %llu\toinit = %p\tprice = %.4f\n"

.subsections_via_symbols
