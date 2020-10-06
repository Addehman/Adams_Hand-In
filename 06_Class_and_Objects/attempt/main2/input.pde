boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
PVector inputVector = new PVector();

public boolean gravity;

// Remember to also adjust the maxSpeed in the main-file when adjusting the jump height!
float jumpForce = 20;



// Key pressed, set our variables to true

void keyPressed()
{
	// Stop Application
	if ( key == ESC)
	{
		exit();
	}


	// toggle gravity-function
	if (key == 'g')
	{
		gravity = !gravity;
	}


	if (keyCode == LEFT || key == 'a')
	{
		moveLeft = true;
	}
	else if (keyCode == RIGHT || key == 'd')
	{
		moveRight = true;
	}

	if (!gravity)
	{
		if (keyCode == UP || key == 'w')
		{
			moveUp = true;
		}
		else if (keyCode == DOWN || key == 's')
		{
			moveDown = true;
		}
	}
	// If Gravity is on, and the ball is on the floor but slightly above (to make it slightly easier to jump, 
	// which otherwise is pretty hard to achieve), then it's possible to press to jump.
	else if (gravity && player.position.y >= height - ((player.playerSize/4) * 3))
	{
		if (keyCode == UP || key == ' ')
		{
			player.velocity.y -= jumpForce;
		}
	}


	// Modify the Difficulty/FrameRate of the game.
	if (key == '+' && framerateMod < 60)
	{
		framerateMod += 10;
	}
	else if (key == '-' && framerateMod > 0)
	{
		framerateMod -= 10;
	}
}

// When a key is released, we will set our variable to false
void keyReleased()
{
	if (keyCode == LEFT || key == 'a')
	{
		moveLeft = false;
	}
	else if (keyCode == RIGHT || key == 'd')
	{
		moveRight = false;
	}


	if (!gravity)
	{
		if (keyCode == UP || key == 'w')
		{
			moveUp = false;
		}
	}

	
	if (keyCode == DOWN || key == 's')
	{
		moveDown = false;
	}
}

// Returns a normalized PVector input
PVector input()
{
	inputVector.x = 0;
	inputVector.y = 0;


	// Adjust acceleration from user
	if (moveLeft)
	{
		inputVector.x -= 1;
	}

	if (moveRight)
	{
		inputVector.x += 1;
	}

	if (moveUp)
	{
		inputVector.y -= 1;
	}

	if (moveDown)
	{
		inputVector.y += 1;
	}

	inputVector.normalize();

	return inputVector;
}
