#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"

#include "pause.h"
#include "splash.h"
#include "win.h"
#include "lose.h"
#include "bg.h"
#include "spritesheet.h"
#include "instructions.h"

/*
Oligatory Comment Box

Finished:
  - Core gameplay mechanics
  - Upgrading plants
  - Multiple levels
  - State machine

Todo:
  - Balance the game (actually make it fun)
  - Provide in-game instructions
  - Artwork
  - Implement levels 3-10(+)
  - Sound

Instructions:

The goal of the game is to place plants in the way of zombies to shoot them (as they move from right to left).
Level 1 only uses the top row and each subsequent level uses an additional row
If a zombie reaches the left side of the screen, you lose
If you beat level 3, you win (for now)

Use START to navigate from the splash screen to instructions
Use START to navigate from instructions to game play
While in game:
    Press A to spawn a new plant (assuming you have at least 1 seed available)
        Use arrows to move it around
        Press A again to place it (it won't fire until it's been placed)
        You can tell if it's been placed by artwork
        Press B before placing it to upgrade it (this will consume more seeds)
            There are only 3 levels
            Levels are distinguished by color (for now)
            Higher levels = less shooting cooldown time
    Press SELECT to pause the game
While paused:
    Press START to resume
    Press SELECT to start over

*/

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum {START, GAME, INSTRUCTIONS, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int numGenSeed;

// Text Buffer
char buffer[41];

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
        }

    }
}

// Sets up GBA
void initialize() {
    // Hide all sprites with hideSprites()
	hideSprites();

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    // Set BG1 to be the splash screen
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(16);
    DMANow(3, splashPal, PALETTE, splashPalLen/2);
    DMANow(3, splashTiles, &CHARBLOCK[0], splashTilesLen/2);
    DMANow(3, splashMap, &SCREENBLOCK[16], splashMapLen/2);

    waitForVBlank();

    state = START;

    // Begin the seed randomization
    numGenSeed = 0;
}

// Runs every frame of the start state
void start() {

    numGenSeed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed the random generator
        srand(numGenSeed);

        goToInstructions();
    }
}

void goToInstructions() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    // Set BG1 to be the splash screen
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(16);
    DMANow(3, instructionsPal, PALETTE, instructionsPalLen/2);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen/2);
    DMANow(3, instructionsMap, &SCREENBLOCK[16], instructionsMapLen/2);

    waitForVBlank();

    state = INSTRUCTIONS;
}

void instructions() {
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    // Load the sprite palette
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    // Load the game BG into BG 0
    DMANow(3, bgPal, PALETTE, bgPalLen/2);
    DMANow(3, bgTiles, &CHARBLOCK[0], bgTilesLen/2);
    DMANow(3, bgMap, &SCREENBLOCK[16], bgMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_SMALL;

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();

    waitForVBlank();

    // State transition logic
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    else if (BUTTON_PRESSED(BUTTON_A)) {
        if (currentPlant == -1) {
            spawnPlant();
        } else {
            lockPlant();
        }
    }
    else if (BUTTON_PRESSED(BUTTON_B)) {
        if (currentPlant != -1) {
            upgradePlant();
        }
    }
    else if (BUTTON_PRESSED(BUTTON_UP)) {
        if (currentPlant != -1) {
            if (plants[currentPlant].row > 0) {
                plants[currentPlant].row--;
            }
        }
    }
    else if (BUTTON_PRESSED(BUTTON_DOWN)) {
        if (currentPlant != -1) {
            if (plants[currentPlant].row < 5) {
                plants[currentPlant].row++;
            }
        }
    }
    else if (BUTTON_HELD(BUTTON_LEFT)) {
        if (currentPlant != -1) {
            plants[currentPlant].col--;
        }
    }
    else if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (currentPlant != -1) {
            plants[currentPlant].col++;
        }
    }
    else if (currentLevel > 3) {
        goToWin();
    }
    else if (enemiesRemaining == 0) {
        nextLevel();
    }
    else if (zombieReachedHouse) {
        goToLose();
    }
}

// Sets up the pause state
void goToPause() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    // Setup the pause screen BG
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(16);
    DMANow(3, pausePal, PALETTE, pausePalLen/2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen/2);
    DMANow(3, pauseMap, &SCREENBLOCK[16], pauseMapLen/2);

    waitForVBlank();

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    // Setup the win screen BG
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(16);
    DMANow(3, winPal, PALETTE, winPalLen/2);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen/2);
    DMANow(3, winMap, &SCREENBLOCK[16], winMapLen/2);

    waitForVBlank();

    state = WIN;
}

// Runs every frame of the win state
void win() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    // Setup the lose screen BG
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(16);
    DMANow(3, losePal, PALETTE, losePalLen/2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen/2);
    DMANow(3, loseMap, &SCREENBLOCK[16], loseMapLen/2);

    waitForVBlank();

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}