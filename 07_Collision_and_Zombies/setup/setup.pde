//CharacterManager characterManager;
GameManager gameManager;
CharacterManager[] humans;
CharacterManager[] zombies;
CollisionManager collisionManager;

int numberOfCharacters = 100, numberOfZombies = 100, 
numberOfHumans = 99, humSize, zomSize, humansLeft;

float zomX, zomY, humX, humY;

boolean gameOver;

void setup() 
{
	size(640, 480);
	frameRate(30);
	ellipseMode(CENTER);

	init();
}


void draw() 
{
	gameManager.update();

	background(0);

	gameManager.draw();
}


void init()
{
	zombies = new Zombies[numberOfZombies];
	humans = new Humans[numberOfHumans];

	gameManager = new GameManager();
	collisionManager = new CollisionManager();
	
	gameManager.start();

	humansLeft = numberOfHumans;

	gameOver = false;
}