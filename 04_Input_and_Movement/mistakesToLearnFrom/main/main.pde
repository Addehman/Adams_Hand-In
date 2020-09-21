PVector position = new PVector();
PVector velocity = new PVector();
PVector acceleration = new PVector();

float accelerationMultiplier = 0.75;
float deaccelerationMultiplier = 0.5;
float speed = 60.0;
float maxSpeed = 8;

long time;
float deltaTime;

float x = 0;
float y = 0;

public int ballSize = 20;

void setup() 
{
	size(640, 480);
	ellipseMode(CENTER);
	//surface.setLocation(-1880, 620);
	frameRate(60);
	position = new PVector(width/2, height/2);
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

	
	// update time for next frame.
	time = currentTime;


	wrap();

	if (gravity)
	{
		position.y += 2.5;
	}

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

	if (position.y <= 0 + (ballSize/2))
	{
		position.y = 0 + (ballSize/2);
	}
	else if (position.y >= height - (ballSize/2))
	{
		position.y = height - (ballSize/2);
	}
}
