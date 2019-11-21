#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Variables
PLANT plants[PLANTCOUNT];
BULLET bullets[BULLETCOUNT];
ZOMBIE enemies[ENEMYCOUNT];
SEED seeds[SEEDCOUNT];
int enemiesRemaining;
int enemiesThisLevel;
int enemySpawnCooldown;
int enemySpawnCountdown;
int zombieReachedHouse;

int seedsCollection;

int currentPlant;
int spawnCoord;

int currentLevel;


// Sprite Documentation -----------------------------------------------
// 0                = Unused
// 1 through 25     = Plants
// 26 through 50    = Zombies
// 51 through 75    = Bullets
// 76 through 100  	= Seeds
// 101 				= Level Counter
// 102				= Level Label
// 103 				= Seeds Counter
// 104				= Seeds Label
// 105				= Enemies Counter
// 106				= Enemies Label
// 101 through 127  = Misc

// Initialize the game
void initGame() {

	initPlants();
	initBullets();
	initZombies();
    initSeeds();

	currentPlant = -1;
	zombieReachedHouse = 0;

	currentLevel = 0;
	nextLevel();

	seedsCollection = 1;

	spawnCoord = 20;

	// Setup level sprites
	shadowOAM[101].attr0 = (SCREENHEIGHT - 20) | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[101].attr1 = (SCREENWIDTH - 15) | ATTR1_SMALL;
	shadowOAM[101].attr2 = ATTR2_TILEID(30, 2);

	shadowOAM[102].attr0 = (SCREENHEIGHT - 20) | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[102].attr1 = (SCREENWIDTH - 30) | ATTR1_SMALL;
	shadowOAM[102].attr2 = ATTR2_TILEID(0, 30);

	// Setup seeds sprites
	shadowOAM[103].attr0 = (SCREENHEIGHT - 20) | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[103].attr1 = (SCREENWIDTH - 75) | ATTR1_SMALL;
	shadowOAM[103].attr2 = ATTR2_TILEID(30, 2);

	shadowOAM[104].attr0 = (SCREENHEIGHT - 20) | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[104].attr1 = (SCREENWIDTH - 90) | ATTR1_SMALL;
	shadowOAM[104].attr2 = ATTR2_TILEID(2, 30);


	// Setup enemies sprites
	shadowOAM[105].attr0 = (SCREENHEIGHT - 20) | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[105].attr1 = (SCREENWIDTH - 135) | ATTR1_SMALL;
	shadowOAM[105].attr2 = ATTR2_TILEID(30, 2);

	shadowOAM[106].attr0 = (SCREENHEIGHT - 20) | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[106].attr1 = (SCREENWIDTH - 150) | ATTR1_SMALL;
	shadowOAM[106].attr2 = ATTR2_TILEID(4, 30);
}

// Updates the game each frame
void updateGame() {
	for (int i = 0; i < ENEMYCOUNT; i++) {
		updateZombie(i, &enemies[i]);
	}

	for (int i = 0; i < BULLETCOUNT; i++) {
		updateBullet(i, &bullets[i]);
	}

    for (int i = 0; i < PLANTCOUNT; i++) {
		updatePlant(i, &plants[i]);
	}

    for (int i = 0; i < SEEDCOUNT; i++) {
		updateSeed(i, &seeds[i]);
	}

	if (enemiesRemaining > 0 && enemySpawnCountdown <= 0) {
		spawnZombie(currentLevel);
		enemySpawnCountdown = enemySpawnCooldown;
	} else {
		enemySpawnCountdown--;
	}

	// Update level sprite
	shadowOAM[101].attr2 = ATTR2_TILEID(30, currentLevel * 2);

	// Update seed sprite
	shadowOAM[103].attr2 = ATTR2_TILEID(30, seedsCollection * 2);

	// Update enemy sprite
	shadowOAM[105].attr2 = ATTR2_TILEID(30, enemiesRemaining * 2);
}

// Draws the game each frame
void drawGame() {
	DMANow(3, shadowOAM, OAM, 128 * 4);
}

void nextLevel() {
	currentLevel++;

	if (currentLevel == 1) {
		enemiesThisLevel = 5;
		enemySpawnCooldown = 100;
	} else if (currentLevel == 2) {
		enemiesThisLevel = 8;
		enemySpawnCooldown = 90;
	} else if (currentLevel == 3) {
		enemiesThisLevel = 11;
		enemySpawnCooldown = 80;
	} else if (currentLevel == 4) {
		enemiesThisLevel = 14;
		enemySpawnCooldown = 70;
	} else if (currentLevel == 5) {
		enemiesThisLevel = 17;
		enemySpawnCooldown = 60;
	} else if (currentLevel == 6) {
		enemiesThisLevel = 20;
		enemySpawnCooldown = 50;
	} else if (currentLevel == 7) {
		enemiesThisLevel = 23;
		enemySpawnCooldown = 40;
	} else if (currentLevel == 8) {
		enemiesThisLevel = 26;
		enemySpawnCooldown = 30;
	} else if (currentLevel == 9) {
		enemiesThisLevel = 29;
		enemySpawnCooldown = 20;
	} else if (currentLevel == 10) {
		enemiesThisLevel = 32;
		enemySpawnCooldown = 10;
	}
	
	enemiesRemaining = enemiesThisLevel;
	enemySpawnCountdown = enemySpawnCooldown;

	collectSeeds();
}

// Initialize the player
void initPlants() {
	for (int i = 0; i < ENEMYCOUNT; i++) {
		PLANT p = {
			.height = 16,
			.width = 16,
			.active = 0,
			.frame = 0,
			.placed = 0,
			.frameCounter = 0,
            .shootCooldown = 0,
			.level = 0
		};
		
		plants[i] = p;

        shadowOAM[1 + i].attr0 = ATTR0_HIDE;
		shadowOAM[1 + i].attr1 = ATTR1_SMALL;
		shadowOAM[1 + i].attr2 = ATTR2_TILEID(0, 5);
	}
}

// Handle every-frame actions of the player
void updatePlant(int i, PLANT* p) {
    if (!p->active) {
		shadowOAM[1 + i].attr0 = ATTR0_HIDE;
	} else {
		if (p->placed) {
			if (p->shootCooldown >= (125 - (p->level * 15))) {
				p->shootCooldown = 0;
				fireBullet(p->col, ((p->row * 24) + 2));
			} else {
				p->shootCooldown++;
			}

			if (p->frameCounter == 20) {
				p->frameCounter = 0;
				if (p->frame == 3) {
					p->frame = 0;
				} else {
					p->frame++;
				}

				shadowOAM[1 + i].attr2 = ATTR2_TILEID(p->level * 2, p->frame * 2);
			} else {
				p->frameCounter++;
			}
		} else {
			shadowOAM[1 + i].attr2 = ATTR2_TILEID(p->level * 2, 8);
		}

		shadowOAM[1 + i].attr0 = ((p->row * 24) + 2) | ATTR0_SQUARE | ATTR0_REGULAR;
		shadowOAM[1 + i].attr1 = p->col | ATTR1_SMALL;
	}
}

void spawnPlant() {
	if (seedsCollection > 0) {
		seedsCollection--;
		// Find the first inactive plant
		for (int i = 0; i < PLANTCOUNT; i++) {
			if (!plants[i].active) {
				// Position the new zombie
				plants[i].row = 0;
				plants[i].col = spawnCoord;

				spawnCoord += 3;

				plants[i].active = 1;

				currentPlant = i;

				// Break out of the loop
				break;
			}
		}
	}
}

void lockPlant() {
	plants[currentPlant].placed = 1;
	currentPlant = -1;
}

void upgradePlant() {
	if (plants[currentPlant].level == 0) {
		// Upgrade to level 1
		if (seedsCollection > 3) {
			seedsCollection -= 3;
			plants[currentPlant].level++;
		}
	} else if (plants[currentPlant].level == 1) {
		// Upgrade to level 2
		if (seedsCollection > 3) {
			seedsCollection -= 3;
			plants[currentPlant].level++;
		}
	} else {
		// TODO: Play error sound
	}
}

// Initialize the pool of bullets
void initBullets() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		BULLET b = {
			.height = 4,
			.width = 2,
			.row = 100,
			.col = 100,
			.active = 0
		};
		
		bullets[i] = b;

		shadowOAM[51 + i].attr0 = ATTR0_HIDE;
		shadowOAM[51 + i].attr1 = ATTR1_TINY;
		shadowOAM[51 + i].attr2 = ATTR2_TILEID(8, 0);
	}
}

// Handle every-frame actions of a block
void updateBullet(int i, BULLET* b) {
	if (!b->active) {
        shadowOAM[51 + i].attr0 = ATTR0_HIDE;
    } else {
		b->col += b->cdel;

		shadowOAM[51 + i].attr1 = b->col | ATTR1_TINY;

		// Handle bullet to player collision if the bullet is moving down
		// Loop through all the enemies
		for (int i = 0; i < ENEMYCOUNT; i++) {
			if (enemies[i].active) {
				// Check if the bullet and enemy have collided
				if (collision(enemies[i].col, enemies[i].row, enemies[i].width, enemies[i].height, b->col, b->row, b->width, b->height)) {
					b->active = 0;
					enemies[i].active = 0;
					enemiesRemaining--;
					if (rand() % 2 == 0) {
						dropSeed(b->col, b->row);
					}
				}
			}
		}

		// Deactivate the bullet if it goes off screen
		if (b->col >= SCREENWIDTH) {
			b->active = 0;
		}
	}
}

// Spawn a bullet
void fireBullet(int x, int y) {
	// Find the first inactive bullet
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!bullets[i].active) {
            // Position the new bullet
            bullets[i].row = y + 7;
            bullets[i].col = x + 16 - bullets[i].width/2;

            bullets[i].cdel = 2;

            shadowOAM[51 + i].attr0 = bullets[i].row | ATTR0_REGULAR | ATTR0_SQUARE;
            shadowOAM[51 + i].attr1 = bullets[i].col | ATTR1_TINY;

            // Take the bullet out of the pool
            bullets[i].active = 1;

            // Break out of the loop
            break;
        }
    }
}

// Initialize the pool of enemies
void initZombies() {
	for (int i = 0; i < ENEMYCOUNT; i++) {
		ZOMBIE z = {
			.height = 16,
			.width = 16,
			.active = 0,
			.frame = 0,
			.frameCounter = i % 20,
            .cdel = -1
		};
		
		enemies[i] = z;

        shadowOAM[26 + i].attr0 = ATTR0_HIDE;
		shadowOAM[26 + i].attr1 = ATTR1_SMALL;
		shadowOAM[26 + i].attr2 = ATTR2_TILEID(6, 0);
	}
}

// Handle every-frame actions of a block
void updateZombie(int i, ZOMBIE* z) {
	if (!z->active) {
		shadowOAM[26 + i].attr0 = ATTR0_HIDE;
	} else {
		if (z->frameCounter == 20) {
			z->frameCounter = 0;
			if (z->frame == 3) {
				z->frame = 0;
			} else {
				z->frame++;
			}

			shadowOAM[26 + i].attr2 = ATTR2_TILEID(6, z->frame * 2);
		} else {
			z->frameCounter++;
		}

		// Check for collision with plant
		for (int i = 0; i < PLANTCOUNT; i++) {
			if (plants[i].active) {
				// Check if the plant and enemy have collided
				if (collision(plants[i].col, plants[i].row, plants[i].width, plants[i].height, z->col, z->row, z->width, z->height)) {
					plants[i].active = 0;
				}
			}
		}

		if (z->col <= 4) {
			zombieReachedHouse = 1;
		}

		shadowOAM[26 + i].attr0 = z->row | ATTR0_REGULAR | ATTR0_SQUARE;
		shadowOAM[26 + i].attr1 = z->col | ATTR1_SMALL;

		z->col += z->cdel;

		if (z->col <= 0) {
			z->active = 0;
		}
	}
}

void spawnZombie(int rows) {
	// Find the first inactive zombie
	for (int i = 0; i < ENEMYCOUNT; i++) {
		if (!enemies[i].active) {
			// Position the new zombie
			enemies[i].col = SCREENWIDTH;
			enemies[i].row = (((rand() % (rows % 6)) * 24) + 2);
			
			shadowOAM[26 + i].attr0 = enemies[i].row | ATTR0_REGULAR | ATTR0_SQUARE;
			shadowOAM[26 + i].attr1 = enemies[i].col | ATTR1_SMALL;

			// Take the bullet out of the pool
			enemies[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}


// Initialize the pool of enemies
void initSeeds() {
	for (int i = 0; i < SEEDCOUNT; i++) {
		SEED s = {
			.height = 16,
			.width = 16,
			.active = 0,
			.frame = 0,
			.frameCounter = 0,
		};
		
		seeds[i] = s;

        shadowOAM[76 + i].attr0 = ATTR0_HIDE;
		shadowOAM[76 + i].attr1 = ATTR1_SMALL;
		shadowOAM[76 + i].attr2 = ATTR2_TILEID(10, 0);
	}
}

// Handle every-frame actions of a block
void updateSeed(int i, SEED* s) {
	if (!s->active) {
		shadowOAM[76 + i].attr0 = ATTR0_HIDE;
	} else {
		if (s->frameCounter == 20) {
			s->frameCounter = 0;
			if (s->frame == 3) {
				s->frame = 0;
			} else {
				s->frame++;
			}

			shadowOAM[76 + i].attr2 = ATTR2_TILEID(10, s->frame * 2);
		} else {
			s->frameCounter++;
		}
	}
}

// Spawn a bullet
void dropSeed(int x, int y) {
	// Find the first inactive bullet
	for (int i = 0; i < SEEDCOUNT; i++) {
		if (!seeds[i].active) {
			// Position the new bullet
			seeds[i].row = y - 8;
			seeds[i].col = x;

			shadowOAM[76 + i].attr0 = seeds[i].row | ATTR0_REGULAR | ATTR0_SQUARE;
			shadowOAM[76 + i].attr1 = seeds[i].col | ATTR1_SMALL;

			// Take the bullet out of the pool
			seeds[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

void collectSeeds() {
	// Find the first inactive bullet
	for (int i = 0; i < SEEDCOUNT; i++) {
		if (seeds[i].active) {
			seeds[i].active = 0;

			seedsCollection++;
		}
	}
}