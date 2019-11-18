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
} SEED;

// Constants
#define ENEMYCOUNT 25
#define BULLETCOUNT 25
#define PLANTCOUNT 25
#define SEEDCOUNT 3

// Variables
extern PLANT plants[PLANTCOUNT];
extern ZOMBIE enemies[ENEMYCOUNT];
extern BULLET bullets[BULLETCOUNT];
extern SEED seeds[SEEDCOUNT];

extern int enemiesRemaining;
extern int enemiesThisLevel;
extern int enemySpawnCooldown;
extern int zombieReachedHouse;

extern int seedsCollection;

extern int currentPlant;

extern int currentLevel;

// Prototypes
void initGame();
void drawGame();
void updateGame();

void initPlants();
void updatePlant(int, PLANT*);
void spawnPlant();
void lockPlant();

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