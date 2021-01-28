PVector position = new PVector();
PVector velocity = new PVector();
PVector acceleration = new PVector();

float accelerationMultiplier = 0.75;
float deaccelerationMultiplier = 0.1;
float speed = 60.0;

// Adjust here when adjusting the Jump height! also in Input-file (the float "jumpForce")
float maxSpeed = 20;

long time;
float deltaTime;

public int ballSize = 20;

Ball myBall;
int numberOfBalls = 10;
Ball[] balls;


void setup() 
{
	size(640, 480);
	ellipseMode(CENTER);

	// Set the Run/Preview window semi-centered on the second monitor
	//surface.setLocation(-1280, 525/4);

	frameRate(60);
	position = new PVector(width/2, height/2);

	myBall = new Ball(100, 100);

	balls = new Ball[numberOfBalls];
}


void draw() 
{
	background(0);

	acceleration = input();


	long currentTime = millis();

	//we want this in fractions of a second
	deltaTime = (currentTime - time) *  0.001f;
	

	//prepare our acceleration
	
	acceleration.mult(accelerationMultiplier * speed * deltaTime);

	if (acceleration.mag() == 0)
	{
		acceleration.x -= velocity.x * deaccelerationMultiplier;
		
		if (!gravity)
		{
			acceleration.y -= velocity.y * deaccelerationMultiplier;
		}
	}



	//update velocity
	velocity.add(acceleration);
	velocity.limit(maxSpeed);

	PVector move = velocity.copy();

	move.mult(speed * deltaTime);	

	position.add(velocity);

	//draw 
	ellipse(position.x, position.y, ballSize, ballSize);


	myBall.update();
	myBall.draw();

	for (int i = 0; i < numberOfBalls; i++)
	{
		myBall;
	}

	
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