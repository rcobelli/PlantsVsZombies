	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #512
	mov	r2, #4096
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L4
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r1, .L4+4
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r3, #384
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+24
	ldr	r2, .L4+28
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	splashPal
	.word	splashTiles
	.word	100696064
	.word	splashMap
	.word	waitForVBlank
	.word	state
	.word	numGenSeed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	hideSprites
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #512
	mov	r2, #4096
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L12
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r1, .L12+4
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r3, #1520
	mov	r2, #100663296
	ldr	r1, .L12+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+12
	mov	r3, #1024
	ldr	r1, .L12+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L12+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instructionsPal
	.word	instructionsTiles
	.word	100696064
	.word	instructionsMap
	.word	waitForVBlank
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L21
	ldr	r3, [r4]
	ldr	r2, .L21+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	ldr	r0, [r4]
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToInstructions
.L22:
	.align	2
.L21:
	.word	numGenSeed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4352
	mov	r5, #67108864
	ldr	r4, .L25
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	ldr	r2, .L25+4
	ldr	r1, .L25+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L25+12
	ldr	r1, .L25+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L25+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #112
	mov	r2, #100663296
	ldr	r1, .L25+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L25+28
	ldr	r1, .L25+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #4096
	mov	r2, #1
	ldr	r3, .L25+36
	strh	r1, [r5, #8]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	bgPal
	.word	bgTiles
	.word	100696064
	.word	bgMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions.part.1, %function
instructions.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	goToGame
	ldr	r3, .L33+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	buttons
	.word	initGame
	.size	instructions.part.1, .-instructions.part.1
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	instructions.part.1
.L38:
	.align	2
.L37:
	.word	oldButtons
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #512
	mov	r2, #4096
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L41
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r1, .L41+4
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r3, #576
	mov	r2, #100663296
	ldr	r1, .L41+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L41+12
	mov	r3, #1024
	ldr	r1, .L41+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L41+20
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L41+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L42:
	.align	2
.L41:
	.word	DMANow
	.word	pausePal
	.word	pauseTiles
	.word	100696064
	.word	pauseMap
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L55
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L44
	ldr	r2, .L55+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L53
.L44:
	tst	r3, #4
	beq	.L43
	ldr	r3, .L55+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L54
.L43:
	pop	{r4, lr}
	bx	lr
.L54:
	pop	{r4, lr}
	b	goToStart
.L53:
	pop	{r4, lr}
	b	goToGame
.L56:
	.align	2
.L55:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #512
	mov	r2, #4096
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L59
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r1, .L59+4
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r3, #224
	mov	r2, #100663296
	ldr	r1, .L59+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L59+12
	mov	r3, #1024
	ldr	r1, .L59+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+20
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L59+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L60:
	.align	2
.L59:
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100696064
	.word	winMap
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L68
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
	ldr	r3, .L68+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
.L61:
	pop	{r4, lr}
	bx	lr
.L67:
	pop	{r4, lr}
	b	goToStart
.L69:
	.align	2
.L68:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #512
	mov	r2, #4096
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L72
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r1, .L72+4
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r3, #320
	mov	r2, #100663296
	ldr	r1, .L72+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L72+12
	mov	r3, #1024
	ldr	r1, .L72+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L72+20
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L72+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L73:
	.align	2
.L72:
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100696064
	.word	loseMap
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L124
	mov	lr, pc
	bx	r3
	ldr	r3, .L124+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L124+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L124+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L75
	ldr	r2, .L124+16
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L120
.L75:
	tst	r3, #1
	beq	.L76
	ldr	r2, .L124+16
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L76
	ldr	r3, .L124+20
	ldr	r3, [r3]
	cmn	r3, #1
	ldreq	r3, .L124+24
	ldrne	r3, .L124+28
	mov	lr, pc
	bx	r3
.L74:
	pop	{r4, lr}
	bx	lr
.L76:
	tst	r3, #2
	bne	.L121
.L79:
	tst	r3, #64
	beq	.L80
	ldr	r2, .L124+16
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L80
	ldr	r3, .L124+20
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L74
	add	r3, r3, r3, lsl #2
	ldr	r1, .L124+32
	lsl	r3, r3, #3
	ldr	r2, [r1, r3]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r1, r3]
	b	.L74
.L121:
	ldr	r2, .L124+16
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L79
	ldr	r3, .L124+20
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L74
	ldr	r3, .L124+36
	mov	lr, pc
	bx	r3
	b	.L74
.L80:
	tst	r3, #128
	beq	.L81
	ldr	r3, .L124+16
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L81
	ldr	r3, .L124+20
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L74
	ldr	r1, .L124+32
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #3
	ldr	r2, [r1, r3]
	cmp	r2, #4
	addle	r2, r2, #1
	strle	r2, [r1, r3]
	b	.L74
.L81:
	ldr	r3, .L124+40
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L82
	ldr	r3, .L124+20
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L74
	ldr	r2, .L124+32
	add	r3, r3, r3, lsl #2
	add	r3, r2, r3, lsl #3
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	b	.L74
.L120:
	pop	{r4, lr}
	b	goToPause
.L82:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L83
	ldr	r3, .L124+20
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L74
	ldr	r2, .L124+32
	add	r3, r3, r3, lsl #2
	add	r3, r2, r3, lsl #3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	b	.L74
.L83:
	ldr	r3, .L124+44
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L122
	ldr	r3, .L124+48
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L123
	ldr	r3, .L124+52
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L74
	pop	{r4, lr}
	b	goToLose
.L122:
	pop	{r4, lr}
	b	goToWin
.L123:
	ldr	r3, .L124+56
	mov	lr, pc
	bx	r3
	b	.L74
.L125:
	.align	2
.L124:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	currentPlant
	.word	spawnPlant
	.word	lockPlant
	.word	plants
	.word	upgradePlant
	.word	67109120
	.word	currentLevel
	.word	enemiesRemaining
	.word	zombieReachedHouse
	.word	nextLevel
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L139
	mov	lr, pc
	bx	r3
	ldr	r3, .L139+4
	mov	lr, pc
	bx	r3
	ldr	fp, .L139+8
	ldr	r5, .L139+12
	ldr	r10, .L139+16
	ldr	r9, .L139+20
	ldr	r8, .L139+24
	ldr	r7, .L139+28
	ldr	r6, .L139+32
	ldr	r4, .L139+36
.L127:
	ldrh	r2, [fp]
	strh	r2, [r5]	@ movhi
	ldr	r3, [r10]
	ldrh	r1, [r4, #48]
	strh	r1, [fp]	@ movhi
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L127
.L130:
	.word	.L129
	.word	.L131
	.word	.L132
	.word	.L133
	.word	.L134
	.word	.L134
.L134:
	mov	lr, pc
	bx	r6
	b	.L127
.L133:
	mov	lr, pc
	bx	r7
	b	.L127
.L132:
	tst	r2, #8
	beq	.L127
	ldr	r3, .L139+40
	mov	lr, pc
	bx	r3
	b	.L127
.L131:
	mov	lr, pc
	bx	r8
	b	.L127
.L129:
	mov	lr, pc
	bx	r9
	b	.L127
.L140:
	.align	2
.L139:
	.word	hideSprites
	.word	goToStart
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.word	instructions.part.1
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	buffer,41,4
	.comm	numGenSeed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
