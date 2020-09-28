Ball[] balls; 	//Array with all our balls
public Player player; 	//Our player

int numberOfBalls = 20;
int score, highscore;


float deltaTime;
float time;
float framerateMod = 30;

//boolean invert = true;
boolean startMenu = true;


void setup() 
{
  size(640, 480);
  ellipseMode(CENTER);

  background(100);

  // Make it possible to resize the window, like Maximize. Though this affects the playfield, 
  // and not the objects, giving lots more space if maximized!
  //surface.setResizable(true);
  

  // Set the Run/Preview window semi-centered on the second monitor
  //surface.setLocation(-1280, 525/4);

  frameRate(framerateMod);
}


//Create our objects
void start()
{
  frameCount = 0;

  //Create our player
  player = new Player();

  //Prepare our ball array
  balls = new Ball[numberOfBalls];

  //Create our balls
  for (int i = 0; i < numberOfBalls; i++)
  {
    if ((int)random(2) == 0)
    {
      balls[i] = new Apple();
    } else
    {
      balls[i] = new Pear();
    }
  }
}


void draw() 
{
  //clear our background with fade effect.
  clearBackground();


  if (startMenu)
  {
  	menu();
  }
  else
  {
  	game();
  }

  // Run the user interface
  gui();
}


void clearBackground()
{
  //fill screen with rect, with alpha for cool effect.
  fill(236, 199, 155, 80);
  rect(0, 0, width, height);
}


void gameOver()
{
  //make it black and white for cool effect
  filter(GRAY);

  //Display game over message in the middle of the screen.
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2, height/2);

  if (score > highscore)
  	{
  		highscore = score;
  	}


  // When we are in the game over state, check key ENTER for restart.
  // keyPressed is needed to only check this when the key is pressed, 
  // if it is not used, the key will always be set to 'r' or 'R' 
  // until it is set to something else.
  if (keyPressed)
  {
    if (key == 'r' || key == 'R')
    {
      startMenu = true;
      //menu();
    }
  }
}

void gui()
{
	//Show frameRate (Difficulty)
	fill(0);
	textSize(20);
	
	if (startMenu)
	{
		textAlign(CENTER, CENTER);
		text("fps " + (int)framerateMod, width/2, height * 0.85);
	}
	else 
	{
		textAlign(LEFT, BOTTOM);
		text("fps " + (int)framerateMod, 10, height);
	}


  if (!player.dead)
  {
    score = frameCount;
    //Show score/seconds
    textAlign(LEFT, TOP);
    text(score, 10, 10);

    //Highscore
  	textAlign(RIGHT, BOTTOM);
 	text("Highscore: " + highscore, width - 10, height - 10);
  } 
  else if (player.dead && !startMenu)
  {
    //Show score/seconds
    fill(0, 255, 0);
    textSize(48);
    textAlign(CENTER, CENTER);
    text(score, width/2, height/3);
    score = score;

	fill(200, 100, 0);
	textAlign(CENTER, CENTER);
 	text("Highscore: " + highscore, width/2, height * 0.75);
  }
  else if(player.dead && startMenu)
  {
    textSize(32);
	fill(200, 100, 0);
	textAlign(CENTER, CENTER);
 	text("Highscore: " + highscore, width/2, height * 0.75);
  }
}

void menu()
 {
 	player.dead = true;

 	// Title
 	fill(random(150, 255), random(0, 50), random(0, 30));
	textSize(72);
	textAlign(CENTER, CENTER);
	text("FRUIT DODGE", width/2, height/4);

	// Instructions to Start game
	fill(0);
	textSize(16);
	text("Press 'ENTER' to begin!", width/2, height/2);
	text("Press '+' to increase Difficulty and '-' to decrease.", width/2, height * 0.9);
	text("It is based on Frames per Second, meaning that the higher the number,", width/2, height * 0.93);
	text("the faster the game will run", width/2, height * 0.96);
 
 
 	if(keyPressed)
 	{
 		if (key == ENTER)
 		{
 			startMenu = false;
 			player.dead = false;
 			start();
 		}
 	}
 }

void game()
{
	frameRate(framerateMod);

	//Calculate delta time
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;


	//Loop through all balls
	for (int i = 0; i < numberOfBalls; i++)
	{
		//Run collision check code, player against ball[i].
	    boolean hasCollided = roundCollision(player.position.x, 
	    player.position.y, 
	    player.playerSize/2, 

	    balls[i].position.x, 
	    balls[i].position.y, 
	    balls[i].ballSize/2);

	    //If we have collided set size to zero.
	    //A bad way of "killing" the player.
	    if (hasCollided && !player.dead)
	    {
	    	player.playerSize = 0;
	    	player.dead = true;
	    }

	    //Run the ball update function for movement
	    balls[i].update();
	}

	//Loop through all the balls again and draw them on the screen.
	for (int i = 0; i < numberOfBalls; i++)
	{
	  balls[i].draw();
	}

	//Update player and draw it on screen
  	player.update(deltaTime);
	player.draw();

	//draw our playersdw
	if (player.dead)
	{
	  gameOver();
	}

  	//update time for next frame.
	time = currentTime;
}