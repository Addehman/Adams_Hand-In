int numberOfBalls = 10;
Ball[] balls;

balls = new Ball[numberOfBalls];

for (int i = 0; i < balls.length; i++)
{
	//Add some code for creating balls here.
	balls = new Ball(20, 20);
	//balls.draw();
}

//Tell each ball to update its position
for (int i = 0; i < balls.length; i++)
{
	balls[i].update();
}
