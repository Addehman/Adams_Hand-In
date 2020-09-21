Ball myBall;

void setup() 
{
	size(640, 480);
	myBall = new Ball(100, 100);
	myBall.position.x = width/2;
	myBall.position.y = height/2;
}

void draw() 
{
	background(0);
	myBall.update();
	myBall.draw();
}