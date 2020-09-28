Player player; // Our player

int numberOfBalls = 10;
Ball[] balls; // array with all our balls

float deltaTime;

void setup() 
{
	size(640, 480);
	ellipseMode(CENTER);

	// Set the Run/Preview window semi-centered on the second monitor
	surface.setLocation(-1280, 525/4);

	frameRate(60);
	position = new PVector(width/2, height/2);
}

void draw() 
{
	clearBackground();

	//we want this in fractions of a second
		deltaTime = (currentTime - time) *  0.001f;
	

	//draw 
	ellipse(position.x, position.y, ballSize, ballSize);

	
	// update time for next frame.
	time = currentTime;


	

	if (gravity)
	{
		bounce();
		myGravity();
	}
	else 
	{
		wrap();
	}

	println(velocity.y);


	
	
}

void wrap()
{
	if (position.x < 0)
	{
		position.x = width;
	}
	else if (position.x > width)
	{
		position.x = 0;
	}

	// Limit movement on Y axis
	if (position.y <= 0 + (ballSize/2))
	{
		position.y = 0 + (ballSize/2);
	}
	else if (position.y >= height - (ballSize/2))
	{
		position.y = height - (ballSize/2);
	}
}

void bounce()
{
	

	// bounce on sides
	if (position.x < 0 + (ballSize/2) || position.x > width - (ballSize/2))
	{
		velocity.x = velocity.x * -1;
	}

	// bounce on top or bottom
	if (position.y < 0 + (ballSize/2) || position.y > height - (ballSize/2))
	{
		// decrease bounce slightly on every bounce
		velocity.y = velocity.y * -0.75;
	}


	// Boundaries when bouncing - force ball inside window
	if (position.x < 0 + (ballSize/2))
	{
		position.x = 0 + (ballSize/2);
	}
	else if (position.x > width - (ballSize/2))
	{
		position.x = width - (ballSize/2);
	}

	if (position.y < 0 + (ballSize/2))
	{
		position.y = 0 + (ballSize/2);
	}
	else if (position.y > height - (ballSize/2))
	{
		position.y = height - (ballSize/2);
	}
	
}

void myGravity()
{
	if (gravity && position.y < height - (ballSize/2))
	{
		velocity.y += 0.5;
	}
}

void update()
{

}

void draw()
{

}

void clearBackground()
{
	fill(255, 255, 255, 40);
	rect(0, 0, width, height);
}