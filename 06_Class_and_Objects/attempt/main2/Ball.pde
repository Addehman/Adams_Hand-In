class Ball
{
	// Object data
	PVector position; //Ball position
	PVector velocity; //Ball direction
	int ballSize = 20;

	color ballColor;

	//Constructor without arguments
	public Ball()
	{
		//Create vector objects
		position = new PVector();

		/*float randomXpos = random(2);
		float randomYpos = random(2);
		println(randomYpos + "  " + randomYpos);*/

		//Set random start pos, but not too close to player.
		position.x = random(0, width);

		position.y = random(0, height);

		if (position.x >= player.position.x - 40 && position.x < player.position.x + 40)
		{
			if (random(2) < 0.5)
			{
				position.x += 60;
				println("Moved Right");
			}
			else
			{
				position.x -= 60;
				println("Moved Left");
			}
		}

		if (position.y >= player.position.y - 40 && position.y < player.position.y + 40)
		{
			if (random(2) < 0.5)
			{
				position.y += 60;
				println("Moved Down");
			}
			else
			{
				position.y -= 60;
				println("Moved Up");
			}
		}


		/*if (randomXpos < 0.5)
		{
			position.x = random(0, player.position.x - 30);
		}
		else 
		{
			position.x = random(player.position.x + 30, height);
		}

		if (randomYpos == 0.5)
		{
			position.y = random(0, player.position.y - 30);
		}
		else
		{
			position.y = random(player.position.y + 30, height);
		}*/

		


		//Create vector for velocity and set random direction
		velocity = new PVector();
		velocity.x = random(10) - 5;
		velocity.y = random(10) - 5;

		//Set a random size
		ballSize = (int)random(5, 25);

		//Set a random color
		ballColor = color(random(0, 256), random(0, 256), random(0, 256));
	}

	//Constructor with position arguments
	public Ball(int x, int y)
	{
		//Create vector objects
		position = new PVector(x, y);

		//Create vector for velocity and set random direction
		velocity = new PVector();
		velocity.x = random(10) - 5;
		velocity.y = random(10) - 5;

		//Set random size
		ballSize = (int)random(5, 25);

		//Set random color
		ballColor = color(random(0, 256), random(0, 256), random(0, 256));
	}


	//Update our ball
	void update()
	{
		//Update our position
		position.x += velocity.x;
		position.y += velocity.y;

		//Bounce if we hit a wall (reverse velocity)
		if (position.x < 0 + ballSize/2 || position.x > width - ballSize/2)
		{
			velocity.x *= -1;
		}

		if (position.y < 0 + ballSize/2 || position.y > height - ballSize/2)
		{
			velocity.y *= -1;
		}
	}


	void draw()
	{
		//Draw our ball on the screen
		fill(ballColor);
		ellipse(position.x - ballSize/2, position.y - ballSize/2, ballSize, ballSize);
	}
}