class Ball
{
	//Our class variables
	PVector position; //Ball position
	PVector velocity; //Ball direction

	//Ball Constructor, called when we type new Ball(x, y);
	Ball(float x, float y)
	{
		//Set our position when we create the code.
		position = new PVector(x, y);

		//Create the velocity vector and give it a random direction.
		velocity = new PVector();
		velocity.x = random(11) - 5;
		velocity.y = random(11) - 5;
	}

	//Update our ball
	void update()
	{
		position.x += velocity.x;
		position.y += velocity.y;
	}

	void draw()
	{
		ellipse(position.x, position.y, 50, 50);
	}
}