color c = color(255);
float x;
//float y = (height/2) + (random(-5, 5));
float speed = 10;

void setup()
{
	size(640, 480);
	rectMode(CENTER);
}

void draw()
{
	background(0);
	display();
	drive();
}

void drive()
{
	x = x + speed;

	if (x >= width)
	{
		x = 0;
	}
}

void display()
{
	fill(c);
	rect(x, (height/2) + (random(-2, 2)), 50, 30);
}