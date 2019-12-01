// Plant Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int level;
    int shootCooldown;
	int placed;
	int active;
	int frame;
	int frameCounter;
} PLANT;

// Zombie Struct
typedef struct {
	int row;
	int col;
	int height;
    int cdel;
	int width;
	int active;
	int frame;
	int frameCounter;
} ZOMBIE;

// Bullet Struct
typedef struct {
	int row;
	int col;
	int cdel;
	int height;
	int width;
	int active;
} BULLET;

// Seed Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
	int frame;
	int frameCounter;
} SEED;

// Constants
#define ENEMYCOUNT 24
#define BULLETCOUNT 24
#define PLANTCOUNT 24
#define SEEDCOUNT 24

// Variables
extern PLANT plants[PLANTCOUNT];
extern ZOMBIE enemies[ENEMYCOUNT];
extern BULLET bullets[BULLETCOUNT];
extern SEED seeds[SEEDCOUNT];

extern int enemiesRemaining;
extern int enemiesThisLevel;
extern int enemySpawnCooldown;
extern int enemySpawnCountdown;
extern int zombieReachedHouse;

extern int seedsCollection;

extern int currentPlant;

extern int currentLevel;

extern int initialCountdown;

extern int cheatEnabled;

// Prototypes
void initGame();
void drawGame();
void updateGame();

void nextLevel();

void initPlants();
void updatePlant(int, PLANT*);
void spawnPlant();
void lockPlant();
void upgradePlant();

void initBullets();
void updateBullet(int, BULLET*);
void fireBullet(int, int);

void initZombies();
void updateZombie(int, ZOMBIE*);
void spawnZombie(int);

void initSeeds();
void updateSeed(int, SEED*);
void dropSeed(int, int);
void collectSeeds();