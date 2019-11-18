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
	.file	"game.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateZombie.part.1, %function
updateZombie.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1, #4]
	cmp	r3, #4
	movle	ip, #1
	ldrle	r2, .L6
	str	lr, [sp, #-4]!
	strle	ip, [r2]
	ldr	r2, [r1, #12]
	ldr	lr, [r1]
	ldr	ip, .L6+4
	add	r0, r0, #26
	add	r2, r3, r2
	lsl	r0, r0, #3
	strh	lr, [ip, r0]	@ movhi
	orr	r3, r3, #16384
	cmp	r2, #0
	add	r0, ip, r0
	strh	r3, [r0, #2]	@ movhi
	movle	r3, #0
	str	r2, [r1, #4]
	strle	r3, [r1, #20]
	ldr	lr, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	zombieReachedHouse
	.word	shadowOAM
	.size	updateZombie.part.1, .-updateZombie.part.1
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet.part.2, %function
updateBullet.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r9, .L22
	ldmib	r1, {r3, ip}
	add	ip, r3, ip
	add	r0, r0, #51
	ldr	r4, .L22+4
	add	r0, r9, r0, lsl #3
	str	ip, [r1, #4]
	sub	sp, sp, #20
	mov	r5, r1
	ldr	r8, .L22+8
	strh	ip, [r0, #2]	@ movhi
	ldr	r10, .L22+12
	ldr	r7, .L22+16
	add	r6, r4, #800
	b	.L12
.L9:
	add	r4, r4, #32
	cmp	r4, r6
	beq	.L21
.L12:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L9
	add	fp, r5, #12
	ldm	fp, {fp, lr}
	str	ip, [sp]
	ldr	ip, [r5]
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #16]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	str	fp, [sp, #12]
	stmib	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L10
	add	r4, r4, #32
	cmp	r4, r6
	ldr	ip, [r5, #4]
	bne	.L12
.L21:
	cmp	ip, #239
	movgt	r3, #0
	strgt	r3, [r5, #20]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L10:
	mov	r2, #0
	ldr	r1, [r10]
	ldr	r3, [r7, #16]
	str	r2, [r5, #20]
	str	r2, [r4, #20]
	sub	r1, r1, #1
	cmp	r3, r2
	ldm	r5, {r2, ip}
	str	r1, [r10]
	moveq	r1, #76
	beq	.L11
	ldr	r3, [r7, #36]
	cmp	r3, #0
	movne	r1, #78
	moveq	r1, #77
	movne	r3, #2
	moveq	r3, #1
.L11:
	mov	r0, #1
	sub	r2, r2, #8
	add	r3, r3, r3, lsl #2
	lsl	r1, r1, #3
	strh	r2, [r9, r1]	@ movhi
	str	r2, [r7, r3, lsl #2]
	add	r1, r9, r1
	add	r3, r7, r3, lsl #2
	orr	r2, ip, #16384
	str	ip, [r3, #4]
	strh	r2, [r1, #2]	@ movhi
	str	r0, [r3, #16]
	b	.L9
.L23:
	.align	2
.L22:
	.word	shadowOAM
	.word	enemies
	.word	collision
	.word	enemiesRemaining
	.word	seeds
	.size	updateBullet.part.2, .-updateBullet.part.2
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L26
	mov	r2, #117440512
	ldr	r1, .L26+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.align	2
	.global	initPlants
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlants, %function
initPlants:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #0
	mov	r6, #16
	ldr	r4, .L32
	ldr	r5, .L32+4
	ldr	r8, .L32+8
	sub	sp, sp, #44
	add	r7, r4, #200
.L29:
	mov	r2, #40
	mov	r1, #0
	mov	r0, sp
	mov	lr, pc
	bx	r8
	mov	lr, sp
	mov	ip, r5
	mov	fp, #512
	mov	r10, #16384
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	strh	r9, [r4, #12]	@ movhi
	strh	fp, [r4, #8]	@ movhi
	strh	r10, [r4, #10]	@ movhi
	ldm	lr, {r0, r1}
	add	r4, r4, #8
	cmp	r4, r7
	add	r5, r5, #40
	stm	ip, {r0, r1}
	bne	.L29
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	shadowOAM
	.word	plants
	.word	memset
	.size	initPlants, .-initPlants
	.align	2
	.global	spawnPlant
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnPlant, %function
spawnPlant:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L44
	mov	r3, #0
	mov	r2, r0
	b	.L37
.L35:
	add	r3, r3, #1
	cmp	r3, #25
	add	r2, r2, #40
	bxeq	lr
.L37:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	bne	.L35
	str	lr, [sp, #-4]!
	mov	lr, #1
	mov	r1, #16
	add	r2, r3, r3, lsl #2
	lsl	r2, r2, #3
	add	ip, r0, r2
	str	lr, [ip, #28]
	ldr	lr, .L44+4
	str	r1, [ip, #4]
	str	r3, [lr]
	str	r1, [r0, r2]
	ldr	lr, [sp], #4
	bx	lr
.L45:
	.align	2
.L44:
	.word	plants
	.word	currentPlant
	.size	spawnPlant, .-spawnPlant
	.align	2
	.global	lockPlant
	.syntax unified
	.arm
	.fpu softvfp
	.type	lockPlant, %function
lockPlant:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	ip, #0
	mov	r0, #1
	ldr	r1, .L47
	ldr	r3, [r1]
	ldr	r2, .L47+4
	add	r3, r3, r3, lsl #2
	add	r3, r2, r3, lsl #3
	str	ip, [r1]
	str	r0, [r3, #24]
	bx	lr
.L48:
	.align	2
.L47:
	.word	currentPlant
	.word	plants
	.size	lockPlant, .-lockPlant
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #0
	mov	r8, #100
	mov	r7, #4
	mov	fp, #2
	mov	r10, #512
	ldr	r5, .L53
	ldr	r4, .L53+4
	sub	sp, sp, #28
	add	r9, r5, #600
.L50:
	mov	lr, sp
	mov	ip, r5
	str	r6, [sp, #8]
	str	r6, [sp, #20]
	str	fp, [sp, #16]
	str	r8, [sp]
	str	r8, [sp, #4]
	str	r7, [sp, #12]
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r5, r5, #24
	ldm	lr, {r0, r1}
	cmp	r5, r9
	strh	r10, [r4]	@ movhi
	strh	r6, [r4, #2]	@ movhi
	strh	r7, [r4, #4]	@ movhi
	stm	ip, {r0, r1}
	add	r4, r4, #8
	bne	.L50
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	bullets
	.word	shadowOAM+408
	.size	initBullets, .-initBullets
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #20]
	cmp	r3, #0
	bne	updateBullet.part.2
.L59:
	mov	r1, #512
	add	r3, r0, #51
	ldr	r2, .L60
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L61:
	.align	2
.L60:
	.word	shadowOAM
	.size	updateBullet, .-updateBullet
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	lr, .L68
	mov	r3, #0
	mov	r2, lr
	b	.L65
.L63:
	add	r3, r3, #1
	cmp	r3, #25
	add	r2, r2, #24
	beq	.L62
.L65:
	ldr	ip, [r2, #20]
	cmp	ip, #0
	bne	.L63
	mov	r4, #1
	mov	r5, #2
	add	ip, r3, r3, lsl r4
	lsl	ip, ip, #3
	add	r2, lr, ip
	add	r1, r1, #7
	str	r1, [lr, ip]
	ldr	ip, [r2, #16]
	add	r0, r0, #16
	add	ip, ip, ip, lsr #31
	sub	r0, r0, ip, asr r4
	add	r3, r3, #51
	ldr	ip, .L68+4
	lsl	r3, r3, #3
	str	r0, [r2, #4]
	strh	r1, [ip, r3]	@ movhi
	add	r3, ip, r3
	strh	r0, [r3, #2]	@ movhi
	str	r5, [r2, #8]
	str	r4, [r2, #20]
.L62:
	pop	{r4, r5, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	bullets
	.word	shadowOAM
	.size	fireBullet, .-fireBullet
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlant.part.0, %function
updatePlant.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r1, #36]
	cmp	r2, #20
	push	{r4, lr}
	mov	r3, r1
	add	r0, r0, #1
	beq	.L81
	add	r2, r2, #1
	ldr	ip, .L83
	str	r2, [r1, #36]
	lsl	r2, r0, #3
.L74:
	ldr	lr, [r3, #24]
	ldr	r0, [r3, #4]
	ldr	r1, [r3]
	orr	r4, r0, #16384
	cmp	lr, #0
	add	lr, ip, r2
	strh	r1, [ip, r2]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	beq	.L70
	ldr	r2, [r3, #20]
	cmp	r2, #99
	addle	r2, r2, #1
	strle	r2, [r3, #20]
	bgt	.L82
.L70:
	pop	{r4, lr}
	bx	lr
.L81:
	mov	r1, #0
	mov	lr, #0
	ldr	r2, [r3, #32]
	cmp	r2, #2
	addne	r2, r2, #1
	ldr	ip, .L83
	strne	r2, [r3, #32]
	lsl	r2, r0, #3
	str	r1, [r3, #36]
	streq	r1, [r3, #32]
	add	r1, ip, r2
	strh	lr, [r1, #4]	@ movhi
	b	.L74
.L82:
	mov	r2, #0
	pop	{r4, lr}
	str	r2, [r3, #20]
	b	fireBullet
.L84:
	.align	2
.L83:
	.word	shadowOAM
	.size	updatePlant.part.0, .-updatePlant.part.0
	.align	2
	.global	updatePlant
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlant, %function
updatePlant:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #28]
	cmp	r3, #0
	mov	r3, r0
	bne	updatePlant.part.0
.L89:
	mov	r2, #512
	ldr	r0, .L90
	add	r0, r0, r3, lsl #3
	strh	r2, [r0, #8]	@ movhi
	bx	lr
.L91:
	.align	2
.L90:
	.word	shadowOAM
	.size	updatePlant, .-updatePlant
	.align	2
	.global	initZombies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initZombies, %function
initZombies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	mov	r7, #16
	mov	r6, r4
	mvn	fp, #0
	mov	r10, #512
	mov	r9, #16384
	mov	r8, #2
	ldr	r5, .L96
	sub	sp, sp, #36
.L93:
	mov	lr, sp
	ldr	r3, .L96+4
	smull	r0, r1, r4, r3
	asr	r3, r4, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	sub	r3, r4, r3, lsl #2
	str	r6, [sp]
	str	r6, [sp, #4]
	str	r6, [sp, #20]
	str	r6, [sp, #24]
	str	r7, [sp, #16]
	str	r3, [sp, #28]
	str	r7, [sp, #8]
	str	fp, [sp, #12]
	ldr	ip, .L96+8
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, ip, r4, lsl #5
	stmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #1
	ldm	lr, {r0, r1, r2, r3}
	cmp	r4, #25
	strh	r10, [r5, #208]	@ movhi
	strh	r9, [r5, #210]	@ movhi
	strh	r8, [r5, #212]	@ movhi
	stm	ip, {r0, r1, r2, r3}
	add	r5, r5, #8
	bne	.L93
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	shadowOAM
	.word	1717986919
	.word	enemies
	.size	initZombies, .-initZombies
	.align	2
	.global	updateZombie
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateZombie, %function
updateZombie:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #20]
	cmp	r3, #0
	mov	r3, r0
	bne	updateZombie.part.1
.L102:
	mov	r2, #512
	ldr	r0, .L103
	add	r0, r0, r3, lsl #3
	strh	r2, [r0, #208]	@ movhi
	bx	lr
.L104:
	.align	2
.L103:
	.word	shadowOAM
	.size	updateZombie, .-updateZombie
	.global	__aeabi_idivmod
	.align	2
	.global	spawnZombie
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnZombie, %function
spawnZombie:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L111
	mov	r4, #0
	mov	r3, r5
	b	.L108
.L106:
	add	r4, r4, #1
	cmp	r4, #25
	add	r3, r3, #32
	beq	.L105
.L108:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L106
	mov	r2, #240
	mov	r6, r0
	add	r7, r5, r4, lsl #5
	str	r2, [r7, #4]
	ldr	r3, .L111+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L111+8
	mov	r1, r6
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldr	r2, [r7, #4]
	ldr	r0, .L111+12
	add	r3, r4, #26
	lsl	r3, r3, #3
	lsl	r1, r1, #4
	str	ip, [r7, #20]
	add	r1, r1, #3
	orr	r2, r2, #16384
	add	ip, r0, r3
	str	r1, [r5, r4, lsl #5]
	strh	r1, [r0, r3]	@ movhi
	strh	r2, [ip, #2]	@ movhi
.L105:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	enemies
	.word	rand
	.word	__aeabi_idivmod
	.word	shadowOAM
	.size	spawnZombie, .-spawnZombie
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L139
	mov	r5, #0
	mov	r7, r6
	mov	r8, #512
	ldr	r4, .L139+4
	b	.L116
.L115:
	add	r5, r5, #1
	cmp	r5, #25
	add	r4, r4, #32
	add	r7, r7, #8
	beq	.L135
.L116:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	strheq	r8, [r7, #208]	@ movhi
	beq	.L115
	mov	r1, r4
	mov	r0, r5
	bl	updateZombie.part.1
	b	.L115
.L135:
	mov	r4, #0
	mov	r7, #512
	ldr	r5, .L139+8
	b	.L119
.L118:
	add	r4, r4, #1
	cmp	r4, #25
	add	r5, r5, #24
	beq	.L136
.L119:
	ldr	r2, [r5, #20]
	lsl	r3, r4, #3
	cmp	r2, #0
	add	r3, r3, #408
	strheq	r7, [r6, r3]	@ movhi
	beq	.L118
	mov	r1, r5
	mov	r0, r4
	add	r4, r4, #1
	bl	updateBullet.part.2
	cmp	r4, #25
	add	r5, r5, #24
	bne	.L119
.L136:
	mov	r0, #0
	mov	r7, #512
	ldr	r5, .L139+12
	b	.L122
.L121:
	cmp	r4, #25
	add	r5, r5, #40
	mov	r0, r4
	beq	.L137
.L122:
	ldr	r3, [r5, #28]
	add	r4, r0, #1
	cmp	r3, #0
	lsl	r3, r4, #3
	strheq	r7, [r6, r3]	@ movhi
	beq	.L121
	mov	r1, r5
	bl	updatePlant.part.0
	cmp	r4, #25
	add	r5, r5, #40
	mov	r0, r4
	bne	.L122
.L137:
	ldr	r4, .L139+16
	ldr	r3, [r4, #16]
	cmp	r3, #0
	moveq	r2, #512
	ldreq	r3, .L139+20
	strheq	r2, [r3]	@ movhi
	ldr	r3, [r4, #36]
	cmp	r3, #0
	moveq	r2, #512
	ldreq	r3, .L139+24
	strheq	r2, [r3]	@ movhi
	ldr	r3, [r4, #56]
	cmp	r3, #0
	moveq	r2, #512
	ldreq	r3, .L139+28
	ldr	r6, .L139+32
	strheq	r2, [r3]	@ movhi
	ldr	r3, [r6]
	ldr	r5, .L139+36
	cmp	r3, #0
	ldr	r2, [r5]
	ble	.L126
	cmp	r2, #0
	ble	.L138
.L126:
	sub	r2, r2, #1
	str	r2, [r5]
.L127:
	cmp	r3, #0
	bne	.L113
	ldr	r2, [r4, #16]
	cmp	r2, #0
	bne	.L129
	ldr	r3, [r4, #36]
	cmp	r3, #0
	moveq	r3, #2
	movne	r3, #1
.L129:
	mov	r0, #0
	ldr	r1, .L139+40
	ldr	r2, [r1]
	add	r3, r3, r3, lsl #2
	add	r4, r4, r3, lsl #2
	add	r3, r2, #1
	str	r0, [r4, #16]
	str	r3, [r1]
.L113:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L138:
	ldr	r3, .L139+44
	ldr	r0, [r3]
	bl	spawnZombie
	mov	r2, #200
	ldr	r3, [r6]
	str	r2, [r5]
	b	.L127
.L140:
	.align	2
.L139:
	.word	shadowOAM
	.word	enemies
	.word	bullets
	.word	plants
	.word	seeds
	.word	shadowOAM+608
	.word	shadowOAM+616
	.word	shadowOAM+624
	.word	enemiesRemaining
	.word	enemySpawnCooldown
	.word	seedsCollection
	.word	currentLevel
	.size	updateGame, .-updateGame
	.align	2
	.global	initSeeds
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSeeds, %function
initSeeds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	mov	r7, #16
	mov	r6, r4
	mov	fp, #512
	mov	r10, #16384
	mov	r9, #6
	ldr	r5, .L145
	sub	sp, sp, #28
.L142:
	mov	ip, r5
	mov	r8, #0
	str	r6, [sp, #4]
	str	r6, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	add	lr, sp, #4
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, .L145+4
	add	r3, r3, r4
	add	r4, r4, #8
	add	r2, r3, #608
	cmp	r4, #24
	add	r3, r3, #612
	strh	fp, [r2]	@ movhi
	strh	r10, [r2, #2]	@ movhi
	add	r5, r5, #20
	str	r8, [ip]
	strh	r9, [r3]	@ movhi
	bne	.L142
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L146:
	.align	2
.L145:
	.word	seeds
	.word	shadowOAM
	.size	initSeeds, .-initSeeds
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initPlants
	bl	initBullets
	bl	initZombies
	bl	initSeeds
	mvn	lr, #0
	mov	r2, #0
	mov	r3, #10
	mov	r1, #200
	ldr	ip, .L149
	ldr	r0, .L149+4
	str	lr, [ip]
	ldr	lr, .L149+8
	str	r2, [r0]
	str	r2, [lr]
	ldr	ip, .L149+12
	ldr	r0, .L149+16
	ldr	r2, .L149+20
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L150:
	.align	2
.L149:
	.word	currentPlant
	.word	zombieReachedHouse
	.word	currentLevel
	.word	enemiesThisLevel
	.word	enemiesRemaining
	.word	enemySpawnCooldown
	.size	initGame, .-initGame
	.align	2
	.global	updateSeed
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSeed, %function
updateSeed:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #16]
	cmp	r3, #0
	moveq	r2, #512
	addeq	r0, r0, #76
	ldreq	r3, .L153
	lsleq	r0, r0, #3
	strheq	r2, [r3, r0]	@ movhi
	bx	lr
.L154:
	.align	2
.L153:
	.word	shadowOAM
	.size	updateSeed, .-updateSeed
	.align	2
	.global	dropSeed
	.syntax unified
	.arm
	.fpu softvfp
	.type	dropSeed, %function
dropSeed:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L160
	ldr	r3, [r2, #16]
	cmp	r3, #0
	push	{r4, lr}
	moveq	ip, #76
	beq	.L156
	ldr	r3, [r2, #36]
	cmp	r3, #0
	movne	ip, #78
	moveq	ip, #77
	movne	r3, #2
	moveq	r3, #1
.L156:
	mov	r4, #1
	add	r3, r3, r3, lsl #2
	ldr	lr, .L160+4
	lsl	r3, r3, #2
	sub	r1, r1, #8
	str	r1, [r2, r3]
	lsl	ip, ip, #3
	add	r3, r2, r3
	str	r0, [r3, #4]
	str	r4, [r3, #16]
	orr	r0, r0, #16384
	add	r3, lr, ip
	strh	r1, [lr, ip]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L161:
	.align	2
.L160:
	.word	seeds
	.word	shadowOAM
	.size	dropSeed, .-dropSeed
	.align	2
	.global	collectSeeds
	.syntax unified
	.arm
	.fpu softvfp
	.type	collectSeeds, %function
collectSeeds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L166
	ldr	r2, [r3, #16]
	cmp	r2, #0
	movne	r2, #0
	bne	.L163
	ldr	r2, [r3, #36]
	cmp	r2, #0
	movne	r2, #1
	moveq	r2, #2
.L163:
	mov	ip, #0
	ldr	r0, .L166+4
	ldr	r1, [r0]
	add	r2, r2, r2, lsl #2
	add	r3, r3, r2, lsl #2
	add	r2, r1, #1
	str	ip, [r3, #16]
	str	r2, [r0]
	bx	lr
.L167:
	.align	2
.L166:
	.word	seeds
	.word	seedsCollection
	.size	collectSeeds, .-collectSeeds
	.comm	currentLevel,4,4
	.comm	currentPlant,4,4
	.comm	seedsCollection,4,4
	.comm	zombieReachedHouse,4,4
	.comm	enemySpawnCooldown,4,4
	.comm	enemiesThisLevel,4,4
	.comm	enemiesRemaining,4,4
	.comm	seeds,60,4
	.comm	enemies,800,4
	.comm	bullets,600,4
	.comm	plants,1000,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
