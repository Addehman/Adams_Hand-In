class CharacterManager
{
	PVector position, velocity;

	color characterColor = color(255);

	float radius;


	CharacterManager()
	{
		position = new PVector();
		position.x = random(width);
		position.y = random(height);

		velocity = new PVector();

		radius = 10;
	}


	void update()
	{
		position.add(velocity);

		// Wrap if the character hits the wall - come out on the opposite side of the screen.
		if (position.x < 0) {

			position.x = width;
		}
		else if (position.x > width) {

			position.x = 0;
		}

		if (position.y < 0) {

			position.y = height;
		}
		else if (position.y > height) {

			position.y = 0;
		}
	}


	void draw()
	{
		fill(characterColor);
		ellipse(position.x, position.y, radius * 2, radius * 2);
	}


	void setRanDir()
	{
		float angle = random(360);

		velocity.x = cos(radians(angle));
		velocity.y = sin(radians(angle));
	}


	PVector getPosition()
	{
		return position;
	}
}