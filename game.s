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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, [r1, #28]
	cmp	r3, #20
	sub	sp, sp, #16
	mov	r5, r1
	add	r0, r0, #26
	beq	.L18
	add	r3, r3, #1
	str	r3, [r1, #28]
	ldr	r8, .L20
	lsl	r9, r0, #3
.L5:
	ldr	r4, .L20+4
	mov	r10, #0
	ldr	ip, [r5, #4]
	ldr	lr, [r5]
	ldr	r7, .L20+8
	add	r6, r4, #960
	b	.L8
.L6:
	add	r4, r4, #40
	cmp	r6, r4
	beq	.L19
.L8:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L6
	str	lr, [sp, #4]
	ldr	lr, [r5, #8]
	str	ip, [sp]
	ldr	ip, [r5, #16]
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r10, [r4, #28]
	add	r4, r4, #40
	cmp	r6, r4
	ldr	ip, [r5, #4]
	ldr	lr, [r5]
	bne	.L8
.L19:
	cmp	ip, #4
	movle	r2, #1
	ldrle	r3, .L20+12
	strle	r2, [r3]
	ldr	r3, [r5, #12]
	add	r3, ip, r3
	strh	lr, [r8, r9]	@ movhi
	cmp	r3, #0
	orr	ip, ip, #16384
	add	r8, r8, r9
	strh	ip, [r8, #2]	@ movhi
	str	r3, [r5, #4]
	movle	r3, #0
	strle	r3, [r5, #20]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L18:
	mov	r2, #0
	ldr	r3, [r1, #24]
	cmp	r3, #3
	moveq	r3, #6
	str	r2, [r1, #28]
	addne	r2, r3, #1
	lslne	r3, r2, #22
	ldr	r8, .L20
	addne	r3, r3, #393216
	lsl	r9, r0, #3
	streq	r2, [r1, #24]
	strne	r2, [r1, #24]
	lsrne	r3, r3, #16
	add	r2, r8, r9
	strh	r3, [r2, #4]	@ movhi
	b	.L5
.L21:
	.align	2
.L20:
	.word	shadowOAM
	.word	plants
	.word	collision
	.word	zombieReachedHouse
	.size	updateZombie.part.1, .-updateZombie.part.1
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet.part.3, %function
updateBullet.part.3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r9, .L36
	ldmib	r1, {r3, ip}
	add	ip, r3, ip
	add	r0, r0, #51
	ldr	r4, .L36+4
	add	r0, r9, r0, lsl #3
	str	ip, [r1, #4]
	sub	sp, sp, #20
	mov	r5, r1
	ldr	r7, .L36+8
	strh	ip, [r0, #2]	@ movhi
	ldr	r8, .L36+12
	ldr	r10, .L36+16
	add	r6, r4, #768
	b	.L27
.L23:
	add	r4, r4, #32
	cmp	r4, r6
	beq	.L35
.L27:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L23
	ldr	fp, [r5, #12]
	str	ip, [sp]
	ldr	lr, [r5, #16]
	str	fp, [sp, #12]
	ldr	ip, [r5]
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #16]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	stmib	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L24
	add	r4, r4, #32
	cmp	r4, r6
	ldr	ip, [r5, #4]
	bne	.L27
.L35:
	cmp	ip, #239
	movgt	r3, #0
	strgt	r3, [r5, #20]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L24:
	mov	r1, #0
	ldr	r2, [r8]
	str	r1, [r5, #20]
	str	r1, [r4, #20]
	sub	r2, r2, #1
	str	r2, [r8]
	mov	r3, r1
	ldr	ip, [r5, #4]
	ldr	r2, .L36+16
	b	.L26
.L25:
	add	r3, r3, #1
	cmp	r3, #24
	add	r2, r2, #28
	beq	.L23
.L26:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	bne	.L25
	mov	r1, #1
	ldr	r2, [r5]
	add	r0, r3, #76
	sub	r2, r2, #8
	lsl	r0, r0, #3
	rsb	r3, r3, r3, lsl #3
	strh	r2, [r9, r0]	@ movhi
	str	r2, [r10, r3, lsl #2]
	add	r0, r9, r0
	add	r3, r10, r3, lsl #2
	orr	r2, ip, #16384
	str	ip, [r3, #4]
	strh	r2, [r0, #2]	@ movhi
	str	r1, [r3, #16]
	b	.L23
.L37:
	.align	2
.L36:
	.word	shadowOAM
	.word	enemies
	.word	collision
	.word	enemiesRemaining
	.word	seeds
	.size	updateBullet.part.3, .-updateBullet.part.3
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
	ldr	r4, .L40
	mov	r2, #117440512
	ldr	r1, .L40+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.align	2
	.global	nextLevel
	.syntax unified
	.arm
	.fpu softvfp
	.type	nextLevel, %function
nextLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L60
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #1
	push	{r4, lr}
	str	r3, [r2]
	beq	.L58
	cmp	r3, #2
	beq	.L59
	cmp	r3, #3
	beq	.L46
	ldr	r3, .L60+4
	ldr	r2, .L60+8
	ldr	r3, [r3]
	ldr	r2, [r2]
.L44:
	mov	ip, #0
	mov	lr, ip
	ldr	r0, .L60+12
	ldr	r1, .L60+16
	ldr	r4, .L60+20
	str	r3, [r0]
	ldr	r3, .L60+24
	str	r2, [r1]
	ldr	r1, [r4]
	add	r0, r3, #672
.L48:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	movne	ip, #1
	strne	lr, [r3, #16]
	add	r3, r3, #28
	addne	r1, r1, ip
	cmp	r3, r0
	bne	.L48
	cmp	ip, #0
	strne	r1, [r4]
	pop	{r4, lr}
	bx	lr
.L59:
	mov	r3, #8
	mov	r2, #180
	ldr	r0, .L60+4
	ldr	r1, .L60+8
	str	r3, [r0]
	str	r2, [r1]
	b	.L44
.L58:
	mov	r3, #5
	mov	r2, #200
	ldr	r0, .L60+4
	ldr	r1, .L60+8
	str	r3, [r0]
	str	r2, [r1]
	b	.L44
.L46:
	mov	r0, #11
	mov	r1, #160
	ldr	lr, .L60+4
	ldr	ip, .L60+8
	mov	r3, r0
	mov	r2, r1
	str	r0, [lr]
	str	r1, [ip]
	b	.L44
.L61:
	.align	2
.L60:
	.word	currentLevel
	.word	enemiesThisLevel
	.word	enemySpawnCooldown
	.word	enemiesRemaining
	.word	enemySpawnCountdown
	.word	seedsCollection
	.word	seeds
	.size	nextLevel, .-nextLevel
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
	mov	r6, #16
	ldr	r4, .L66
	ldr	r5, .L66+4
	ldr	r9, .L66+8
	sub	sp, sp, #44
	add	r8, r4, #192
.L63:
	mov	r2, #40
	mov	r1, #0
	mov	r0, sp
	mov	lr, pc
	bx	r9
	mov	lr, sp
	mov	ip, r5
	mov	fp, #512
	mov	r10, #16384
	mov	r7, #160
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	strh	fp, [r4, #8]	@ movhi
	strh	r10, [r4, #10]	@ movhi
	strh	r7, [r4, #12]	@ movhi
	ldm	lr, {r0, r1}
	add	r4, r4, #8
	cmp	r4, r8
	add	r5, r5, #40
	stm	ip, {r0, r1}
	bne	.L63
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L67:
	.align	2
.L66:
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
	ldr	ip, .L79
	ldr	r1, [ip]
	cmp	r1, #0
	bxle	lr
	ldr	r0, .L79+4
	sub	r1, r1, #1
	mov	r3, #0
	mov	r2, r0
	str	r1, [ip]
	b	.L72
.L70:
	add	r3, r3, #1
	cmp	r3, #24
	add	r2, r2, #40
	bxeq	lr
.L72:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	bne	.L70
	push	{r4, r5, lr}
	mov	r4, #1
	ldr	lr, .L79+8
	ldr	ip, [lr]
	add	r2, r3, r3, lsl #2
	add	r5, ip, #3
	str	r5, [lr]
	lsl	r2, r2, #3
	ldr	lr, .L79+12
	str	r1, [r0, r2]
	add	r0, r0, r2
	str	r4, [r0, #28]
	str	r3, [lr]
	str	ip, [r0, #4]
	pop	{r4, r5, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	seedsCollection
	.word	plants
	.word	spawnCoord
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
	ldr	r1, .L82
	ldr	r3, [r1]
	ldr	r2, .L82+4
	add	r3, r3, r3, lsl #2
	add	r3, r2, r3, lsl #3
	str	ip, [r1]
	str	r0, [r3, #24]
	bx	lr
.L83:
	.align	2
.L82:
	.word	currentPlant
	.word	plants
	.size	lockPlant, .-lockPlant
	.align	2
	.global	upgradePlant
	.syntax unified
	.arm
	.fpu softvfp
	.type	upgradePlant, %function
upgradePlant:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L87
	ldr	r3, [r3]
	ldr	r2, .L87+4
	add	r3, r3, r3, lsl #2
	add	r3, r2, r3, lsl #3
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L85
	ldr	r1, .L87+8
	ldr	r2, [r1]
	cmp	r2, #3
	movgt	r0, #1
	subgt	r2, r2, #3
	strgt	r2, [r1]
	strgt	r0, [r3, #16]
	bx	lr
.L85:
	cmp	r2, #1
	bxne	lr
	ldr	r1, .L87+8
	ldr	r2, [r1]
	cmp	r2, #3
	movgt	r0, #2
	subgt	r2, r2, #3
	strgt	r2, [r1]
	strgt	r0, [r3, #16]
	bx	lr
.L88:
	.align	2
.L87:
	.word	currentPlant
	.word	plants
	.word	seedsCollection
	.size	upgradePlant, .-upgradePlant
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
	mov	r7, #100
	mov	fp, #4
	mov	r10, #2
	mov	r9, #512
	ldr	r5, .L93
	ldr	r4, .L93+4
	sub	sp, sp, #28
	add	r8, r5, #576
.L90:
	mov	lr, sp
	mov	ip, r5
	str	r6, [sp, #8]
	str	r6, [sp, #20]
	str	r10, [sp, #16]
	str	r7, [sp]
	str	r7, [sp, #4]
	str	fp, [sp, #12]
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	mov	r3, #8	@ movhi
	add	r5, r5, #24
	ldm	lr, {r0, r1}
	cmp	r5, r8
	strh	r9, [r4]	@ movhi
	strh	r6, [r4, #2]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	stm	ip, {r0, r1}
	add	r4, r4, #8
	bne	.L90
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L94:
	.align	2
.L93:
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
	bne	updateBullet.part.3
.L99:
	mov	r1, #512
	add	r3, r0, #51
	ldr	r2, .L100
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L101:
	.align	2
.L100:
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
	ldr	lr, .L108
	mov	r3, #0
	mov	r2, lr
	b	.L105
.L103:
	add	r3, r3, #1
	cmp	r3, #24
	add	r2, r2, #24
	beq	.L102
.L105:
	ldr	ip, [r2, #20]
	cmp	ip, #0
	bne	.L103
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
	ldr	ip, .L108+4
	lsl	r3, r3, #3
	str	r0, [r2, #4]
	strh	r1, [ip, r3]	@ movhi
	add	r3, ip, r3
	strh	r0, [r3, #2]	@ movhi
	str	r5, [r2, #8]
	str	r4, [r2, #20]
.L102:
	pop	{r4, r5, lr}
	bx	lr
.L109:
	.align	2
.L108:
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
	ldr	r3, [r1, #24]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	ldr	r3, [r1, #16]
	mov	r4, r1
	add	r5, r0, #1
	beq	.L111
	ldr	r2, [r1, #20]
	sub	r3, r3, r3, lsl #4
	add	r3, r3, #99
	cmp	r3, r2
	addge	r2, r2, #1
	strge	r2, [r1, #20]
	blt	.L119
	ldr	r3, [r4, #36]
	cmp	r3, #20
	beq	.L120
.L114:
	add	r3, r3, #1
	str	r3, [r4, #36]
	lsl	r0, r5, #3
	ldr	r1, .L121
	b	.L117
.L111:
	ldr	r1, .L121
	lsl	r0, r5, #3
	add	r3, r3, #128
	lsl	r3, r3, #1
	add	r2, r1, r0
	strh	r3, [r2, #4]	@ movhi
.L117:
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	add	r3, r3, r3, lsl #1
	lsl	r3, r3, #3
	add	r3, r3, #2
	orr	r2, r2, #16384
	add	ip, r1, r0
	strh	r3, [r1, r0]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [ip, #2]	@ movhi
	bx	lr
.L120:
	mov	r3, #0
	ldr	r2, [r4, #32]
	cmp	r2, #3
	str	r3, [r4, #36]
	addne	r3, r2, #1
	ldr	r2, [r4, #16]
	strne	r3, [r4, #32]
	ldr	r1, .L121
	lslne	r3, r3, #5
	streq	r3, [r4, #32]
	lsl	r0, r5, #3
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r2, r1, r0
	strh	r3, [r2, #4]	@ movhi
	b	.L117
.L119:
	mov	r3, #0
	ldr	r1, [r1]
	add	r1, r1, r1, lsl #1
	lsl	r1, r1, #3
	str	r3, [r4, #20]
	add	r1, r1, #2
	ldr	r0, [r4, #4]
	bl	fireBullet
	ldr	r3, [r4, #36]
	cmp	r3, #20
	bne	.L114
	b	.L120
.L122:
	.align	2
.L121:
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
.L127:
	mov	r2, #512
	ldr	r0, .L128
	add	r0, r0, r3, lsl #3
	strh	r2, [r0, #8]	@ movhi
	bx	lr
.L129:
	.align	2
.L128:
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
	mov	r8, #6
	ldr	r5, .L134
	sub	sp, sp, #36
.L131:
	mov	lr, sp
	ldr	r3, .L134+4
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
	ldr	ip, .L134+8
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, ip, r4, lsl #5
	stmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #1
	ldm	lr, {r0, r1, r2, r3}
	cmp	r4, #24
	strh	r10, [r5, #208]	@ movhi
	strh	r9, [r5, #210]	@ movhi
	strh	r8, [r5, #212]	@ movhi
	stm	ip, {r0, r1, r2, r3}
	add	r5, r5, #8
	bne	.L131
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L135:
	.align	2
.L134:
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
.L140:
	mov	r2, #512
	ldr	r0, .L141
	add	r0, r0, r3, lsl #3
	strh	r2, [r0, #208]	@ movhi
	bx	lr
.L142:
	.align	2
.L141:
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
	ldr	r6, .L149
	mov	r4, #0
	mov	r3, r6
	b	.L146
.L144:
	add	r4, r4, #1
	cmp	r4, #24
	add	r3, r3, #32
	beq	.L143
.L146:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L144
	mov	r2, #240
	mov	r5, r0
	add	r7, r6, r4, lsl #5
	ldr	r3, .L149+4
	str	r2, [r7, #4]
	mov	lr, pc
	bx	r3
	ldr	r1, .L149+8
	smull	r2, r3, r5, r1
	sub	r1, r3, r5, asr #31
	add	r1, r1, r1, lsl #1
	ldr	r3, .L149+12
	sub	r1, r5, r1, lsl #1
	mov	lr, pc
	bx	r3
	mov	lr, #1
	ldr	r2, [r7, #4]
	ldr	r0, .L149+16
	add	r1, r1, r1, lsl #2
	add	r3, r4, #26
	lsl	r3, r3, #3
	lsl	r1, r1, #2
	add	r1, r1, #3
	orr	r2, r2, #16384
	add	ip, r0, r3
	str	r1, [r6, r4, lsl #5]
	str	lr, [r7, #20]
	strh	r1, [r0, r3]	@ movhi
	strh	r2, [ip, #2]	@ movhi
.L143:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L150:
	.align	2
.L149:
	.word	enemies
	.word	rand
	.word	715827883
	.word	__aeabi_idivmod
	.word	shadowOAM
	.size	spawnZombie, .-spawnZombie
	.align	2
	.global	initSeeds
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSeeds, %function
initSeeds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	mov	r7, #16
	mov	fp, #512
	mov	r10, #16384
	mov	r9, #10
	ldr	r4, .L155
	ldr	r6, .L155+4
	sub	sp, sp, #36
	add	r8, r4, #192
.L152:
	mov	ip, r6
	str	r5, [sp, #4]
	str	r5, [sp, #8]
	str	r7, [sp, #12]
	str	r7, [sp, #16]
	add	lr, sp, #4
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	str	r5, [sp, #20]
	str	r5, [sp, #24]
	str	r5, [sp, #28]
	strh	fp, [r4]	@ movhi
	strh	r10, [r4, #2]	@ movhi
	strh	r9, [r4, #4]	@ movhi
	ldm	lr, {r0, r1, r2}
	add	r4, r4, #8
	cmp	r4, r8
	add	r6, r6, #28
	stm	ip, {r0, r1, r2}
	bne	.L152
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L156:
	.align	2
.L155:
	.word	shadowOAM+608
	.word	seeds
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
	push	{r4, r5, r6, lr}
	bl	initPlants
	bl	initBullets
	bl	initZombies
	bl	initSeeds
	mov	r3, #0
	mvn	ip, #0
	ldr	r0, .L159
	ldr	r1, .L159+4
	ldr	r2, .L159+8
	str	ip, [r0]
	str	r3, [r1]
	str	r3, [r2]
	bl	nextLevel
	mov	r2, #140
	mov	r1, #94
	mov	r5, #960
	mov	r4, #964
	mov	lr, #1
	mov	ip, #20
	ldr	r3, .L159+12
	ldr	r6, .L159+16
	add	r0, r3, #808
	strh	r2, [r0]	@ movhi
	strh	r6, [r0, #2]	@ movhi
	add	r0, r3, #812
	strh	r1, [r0]	@ movhi
	add	r0, r3, #828
	strh	r1, [r0]	@ movhi
	add	r0, r3, #844
	strh	r1, [r0]	@ movhi
	ldr	r0, .L159+20
	add	r1, r3, #816
	strh	r2, [r1]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	add	r1, r3, #820
	strh	r5, [r1]	@ movhi
	sub	r0, r0, #45
	add	r1, r3, #824
	strh	r2, [r1]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	add	r1, r3, #832
	sub	r0, r0, #15
	strh	r0, [r1, #2]	@ movhi
	ldr	r0, .L159+24
	strh	r2, [r1]	@ movhi
	add	r1, r3, #836
	strh	r0, [r1]	@ movhi
	ldr	r0, .L159+28
	add	r1, r3, #840
	strh	r2, [r1]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	add	r1, r3, #848
	add	r3, r3, #852
	strh	r2, [r1]	@ movhi
	strh	r4, [r3]	@ movhi
	ldr	r2, .L159+32
	ldr	r3, .L159+36
	sub	r0, r0, #15
	strh	r0, [r1, #2]	@ movhi
	str	lr, [r2]
	str	ip, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L160:
	.align	2
.L159:
	.word	currentPlant
	.word	zombieReachedHouse
	.word	currentLevel
	.word	shadowOAM
	.word	16609
	.word	16594
	.word	962
	.word	16489
	.word	seedsCollection
	.word	spawnCoord
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
	beq	.L167
	ldr	r3, [r1, #24]
	cmp	r3, #20
	beq	.L168
	add	r3, r3, #1
	str	r3, [r1, #24]
	bx	lr
.L167:
	mov	r2, #512
	add	r0, r0, #76
	ldr	r3, .L169
	lsl	r0, r0, #3
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L168:
	mov	r2, #0
	ldr	r3, [r1, #20]
	cmp	r3, #3
	moveq	r3, #10
	str	r2, [r1, #24]
	addne	r2, r3, #1
	lslne	r3, r2, #22
	streq	r2, [r1, #20]
	strne	r2, [r1, #20]
	ldr	r2, .L169
	addne	r3, r3, #655360
	add	r0, r0, #76
	lsrne	r3, r3, #16
	add	r0, r2, r0, lsl #3
	strh	r3, [r0, #4]	@ movhi
	bx	lr
.L170:
	.align	2
.L169:
	.word	shadowOAM
	.size	updateSeed, .-updateSeed
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
	ldr	r6, .L193
	mov	r5, #0
	mov	r7, r6
	mov	r8, #512
	ldr	r4, .L193+4
	b	.L174
.L173:
	add	r5, r5, #1
	cmp	r5, #24
	add	r4, r4, #32
	add	r7, r7, #8
	beq	.L189
.L174:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	strheq	r8, [r7, #208]	@ movhi
	beq	.L173
	mov	r1, r4
	mov	r0, r5
	bl	updateZombie.part.1
	b	.L173
.L189:
	mov	r4, #0
	mov	r7, #512
	ldr	r5, .L193+8
	b	.L177
.L176:
	add	r4, r4, #1
	cmp	r4, #24
	add	r5, r5, #24
	beq	.L190
.L177:
	ldr	r2, [r5, #20]
	lsl	r3, r4, #3
	cmp	r2, #0
	add	r3, r3, #408
	strheq	r7, [r6, r3]	@ movhi
	beq	.L176
	mov	r1, r5
	mov	r0, r4
	add	r4, r4, #1
	bl	updateBullet.part.3
	cmp	r4, #24
	add	r5, r5, #24
	bne	.L177
.L190:
	mov	r0, #0
	mov	r7, #512
	ldr	r5, .L193+12
	b	.L180
.L179:
	cmp	r4, #24
	add	r5, r5, #40
	mov	r0, r4
	beq	.L191
.L180:
	ldr	r3, [r5, #28]
	add	r4, r0, #1
	cmp	r3, #0
	lsl	r3, r4, #3
	strheq	r7, [r6, r3]	@ movhi
	beq	.L179
	mov	r1, r5
	bl	updatePlant.part.0
	cmp	r4, #24
	add	r5, r5, #40
	mov	r0, r4
	bne	.L180
.L191:
	mov	r4, #0
	ldr	r5, .L193+16
.L181:
	mov	r1, r5
	mov	r0, r4
	add	r4, r4, #1
	bl	updateSeed
	cmp	r4, #24
	add	r5, r5, #28
	bne	.L181
	ldr	r6, .L193+20
	ldr	r3, [r6]
	ldr	r4, .L193+24
	ldr	r5, .L193+28
	cmp	r3, #0
	ldr	r2, [r4]
	ldr	r0, [r5]
	ble	.L182
	cmp	r2, #0
	ble	.L192
.L182:
	sub	r2, r2, #1
	str	r2, [r4]
.L183:
	ldr	ip, .L193+32
	mov	r1, ip
	ldr	r2, .L193+36
	lsl	r0, r0, #6
	ldr	r2, [r2]
	add	r0, r0, #30
	strh	r0, [r1], #16	@ movhi
	lsl	r3, r3, #6
	lsl	r2, r2, #6
	add	r3, r3, #30
	add	r2, r2, #30
	strh	r2, [r1]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r3, [ip, #32]	@ movhi
	bx	lr
.L192:
	bl	spawnZombie
	ldr	r3, .L193+40
	ldr	r2, [r3]
	ldr	r0, [r5]
	ldr	r3, [r6]
	str	r2, [r4]
	b	.L183
.L194:
	.align	2
.L193:
	.word	shadowOAM
	.word	enemies
	.word	bullets
	.word	plants
	.word	seeds
	.word	enemiesRemaining
	.word	enemySpawnCountdown
	.word	currentLevel
	.word	shadowOAM+812
	.word	seedsCollection
	.word	enemySpawnCooldown
	.size	updateGame, .-updateGame
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
	push	{r4, lr}
	ldr	lr, .L201
	mov	r3, #0
	mov	r2, lr
	b	.L198
.L196:
	add	r3, r3, #1
	cmp	r3, #24
	add	r2, r2, #28
	beq	.L195
.L198:
	ldr	ip, [r2, #16]
	cmp	ip, #0
	bne	.L196
	mov	r4, #1
	rsb	r2, r3, r3, lsl #3
	lsl	r2, r2, #2
	ldr	ip, .L201+4
	sub	r1, r1, #8
	add	r3, r3, #76
	str	r1, [lr, r2]
	lsl	r3, r3, #3
	add	lr, lr, r2
	str	r0, [lr, #4]
	add	r2, ip, r3
	orr	r0, r0, #16384
	str	r4, [lr, #16]
	strh	r1, [ip, r3]	@ movhi
	strh	r0, [r2, #2]	@ movhi
.L195:
	pop	{r4, lr}
	bx	lr
.L202:
	.align	2
.L201:
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
	mov	ip, #0
	push	{r4, lr}
	mov	lr, ip
	ldr	r4, .L215
	ldr	r3, .L215+4
	ldr	r1, [r4]
	add	r0, r3, #672
.L205:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	movne	ip, #1
	strne	lr, [r3, #16]
	add	r3, r3, #28
	addne	r1, r1, ip
	cmp	r3, r0
	bne	.L205
	cmp	ip, #0
	strne	r1, [r4]
	pop	{r4, lr}
	bx	lr
.L216:
	.align	2
.L215:
	.word	seedsCollection
	.word	seeds
	.size	collectSeeds, .-collectSeeds
	.comm	currentLevel,4,4
	.comm	spawnCoord,4,4
	.comm	currentPlant,4,4
	.comm	seedsCollection,4,4
	.comm	zombieReachedHouse,4,4
	.comm	enemySpawnCountdown,4,4
	.comm	enemySpawnCooldown,4,4
	.comm	enemiesThisLevel,4,4
	.comm	enemiesRemaining,4,4
	.comm	seeds,672,4
	.comm	enemies,768,4
	.comm	bullets,576,4
	.comm	plants,960,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
