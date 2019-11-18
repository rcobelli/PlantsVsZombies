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
	mov	r3, #64
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
	.word	gameBGPal
	.word	gameBGTiles
	.word	100696064
	.word	gameBGMap
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
	ldr	r3, .L116
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L75
	ldr	r2, .L116+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L111
.L75:
	tst	r3, #4
	beq	.L77
	ldr	r2, .L116+16
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L112
.L77:
	tst	r3, #1
	beq	.L78
	ldr	r2, .L116+16
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L78
	ldr	r3, .L116+20
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L113
.L74:
	pop	{r4, lr}
	bx	lr
.L78:
	tst	r3, #2
	bne	.L114
.L79:
	ldr	r3, .L116+24
	ldrh	r2, [r3, #48]
	tst	r2, #64
	bne	.L80
	ldr	r3, .L116+20
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L74
	ldr	r1, .L116+28
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #3
	ldr	r2, [r1, r3]
	sub	r2, r2, #1
	str	r2, [r1, r3]
	pop	{r4, lr}
	bx	lr
.L114:
	ldr	r3, .L116+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L79
.L85:
	pop	{r4, lr}
	b	goToLose
.L80:
	ldrh	r2, [r3, #48]
	tst	r2, #128
	bne	.L81
	ldr	r3, .L116+20
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L74
	ldr	r1, .L116+28
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #3
	ldr	r2, [r1, r3]
	add	r2, r2, #1
	str	r2, [r1, r3]
	b	.L74
.L111:
	ldr	r3, .L116+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L112:
	pop	{r4, lr}
	b	goToPause
.L81:
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L82
	ldr	r3, .L116+20
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L74
	ldr	r2, .L116+28
	add	r3, r3, r3, lsl #2
	add	r3, r2, r3, lsl #3
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	b	.L74
.L82:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L83
	ldr	r3, .L116+20
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L74
	ldr	r2, .L116+28
	add	r3, r3, r3, lsl #2
	add	r3, r2, r3, lsl #3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	b	.L74
.L113:
	ldr	r3, .L116+36
	mov	lr, pc
	bx	r3
	b	.L74
.L83:
	ldr	r3, .L116+40
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L115
	ldr	r3, .L116+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L74
	b	.L85
.L115:
	pop	{r4, lr}
	b	goToWin
.L117:
	.align	2
.L116:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	currentPlant
	.word	67109120
	.word	plants
	.word	lockPlant
	.word	spawnPlant
	.word	enemiesRemaining
	.word	zombieReachedHouse
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
	ldr	r3, .L131
	mov	lr, pc
	bx	r3
	ldr	r3, .L131+4
	mov	lr, pc
	bx	r3
	ldr	fp, .L131+8
	ldr	r5, .L131+12
	ldr	r10, .L131+16
	ldr	r9, .L131+20
	ldr	r8, .L131+24
	ldr	r7, .L131+28
	ldr	r6, .L131+32
	ldr	r4, .L131+36
.L119:
	ldrh	r2, [fp]
	strh	r2, [r5]	@ movhi
	ldr	r3, [r10]
	ldrh	r1, [r4, #48]
	strh	r1, [fp]	@ movhi
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L119
.L122:
	.word	.L121
	.word	.L123
	.word	.L124
	.word	.L125
	.word	.L126
	.word	.L126
.L126:
	mov	lr, pc
	bx	r6
	b	.L119
.L125:
	mov	lr, pc
	bx	r7
	b	.L119
.L124:
	tst	r2, #8
	beq	.L119
	ldr	r3, .L131+40
	mov	lr, pc
	bx	r3
	b	.L119
.L123:
	mov	lr, pc
	bx	r8
	b	.L119
.L121:
	mov	lr, pc
	bx	r9
	b	.L119
.L132:
	.align	2
.L131:
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
