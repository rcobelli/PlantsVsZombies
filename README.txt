At this point in time, I haven't implemented the full instructions screen (I have the state in place but the content is missing), so for now: this file exists

From the start screen, press START to move to the instructions.
From the instructions screen, press START to begin the game
While in game:
    Press SELECT to move to the pause/store screen 
    Press A to spawn a new plant
        Use the arrow keys to move it around
        Press START to place it (it won't fire until placed)
    Press B to immediately lose
While paused:
    Press SELECT to move to the splash screen
    Press START to return to the game
From the win/lose screen, press START to move to the splash screen

The final game will have multiple levels, but I currently only have the game playing a single level (if you beat level 1, you win)
Level 1 has 10 zombies (red boxes) come through the top row (every level allows the zombies to use an additional row).
You lose by allowing a zombie to reach the house (the box on the left edge of the screen)

The zombies are the red boxes and plants are the green boxes. Their art isn't done but the art for bullets and seeds is.
Seeds are dropped when a zombie is killed but they don't have any meaning in this iteration because I haven't implemented the multiple level mechanic yet