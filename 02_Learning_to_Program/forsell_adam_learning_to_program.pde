//int gridBase = 0;
//int frame = 0;
int spaceBetween = 10;
//int everyThird = 3;

void setup()
{
	size(500, 500);
}

void draw() 
{
	background(255,255,255);

	for (int i = 0; i < height; i = i += spaceBetween)
	{
		strokeWeight(2);

		if (i % 3 == 0) 
		{
			stroke(0);
		} 
		else 
		{
			stroke(150);
		}

		line(0, i, i, 500);
		line(500, i, i, 0);
	}
	
}
