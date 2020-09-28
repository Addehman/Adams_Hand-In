// Extends keyword gives the class all the funcitons and variables
// from the Ball class.
class Apple extends Ball
{
	Apple ()
	{
		//super calls the parent class constructor
		super();
		//some other code that overrides the color, size
		//Anything we want :)

		ballSize = (int)random(12, 50);
		ballColor = color(random(150, 255), random(0, 40), random(0, 20));
	}


	void draw()
		{
			push();
			translate(position.x, position.y);
			noStroke();
			fill(ballColor);
			ellipse(0, 0, 35, 30);
			stroke(0);
			line(0, -12, 0, -20);
			pop();
		}
}