class Ball
{
	//object data
	PVector position;
	PVector velocity;


	// Constructor with position arguments
	public Ball (int x, int y)
	{
		
	}


	void update()
	{
		// tpdate our position
		position.x += velocity.x;
		position.y += velocity.y
	}

	void draw()
	{

	}
}