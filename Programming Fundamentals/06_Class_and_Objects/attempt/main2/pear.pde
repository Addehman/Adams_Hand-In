class Pear extends Ball
{
	Pear()
	{
		super();


		ballSize = (int)random(12, 20);
		ballColor = color(random(0, 50), random(150, 255), random(0, 20));
	}

	void draw()
	{
		push();
		translate(position.x, position.y);
		noStroke();
		fill(ballColor);
		ellipse(0, 0, 30, 30);
		ellipse(0, -15, 15, 15);
		stroke(0);
		line(0, -20, 0, -30);
		pop();
	}
}