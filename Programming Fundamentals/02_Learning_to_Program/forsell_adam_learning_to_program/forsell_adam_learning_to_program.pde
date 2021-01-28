//int gridBase = 0;
int frame = 0;

int spaceBetween = 10;

void setup()
{
	size(500, 500);
}

void draw() 
{
	background(255,255,255);
	strokeWeight(2);

	line(0, height, width/2, 0);

	for (int i = 0; i < height; i = i += spaceBetween)
	{
		if (i % 3 == 0) 
		{
			stroke(0);
		} 
		else 
		{
			stroke(150);
		}
		// Swirling Triangle
		line((i + frame) % (width/2), height - ((i + frame) * 2) % height, (width/2) + (i + frame) % (width/2), 0 + ((i + frame) * 2) % height);
		line((width/2) + (i + frame) % (width/2), 0 + ((i + frame) *2) % height, width - ((i + frame) * 2) % width, height);
		line(width - ((i + frame) * 2) % width, height, 0 + (i + frame) % 250, height - ((i + frame) * 2) % height);



		/*
		line(0, i, i, 500);
		line(500, i, i, 0);
		line(i, 500, 500, 500 - i);
		line(500 - i, 0, 0, i);
		
		//clockwise
		line(i, 0, 500, i);
		line(500, i, 500 - i, 500);
		line(i, 500, 0, i);
		line(0, 500 - i, i, 0);
		

		line(i, 0, 500, i);
		line(500, i, 500 - i, 500);
		line(i, 500, 0, i);
		line(0, 500 - i, i, 0);
		*/

		/*//Square Swirling Clockwise
		line(width - (i + frame) % width, height, 0, height - (i + frame) % height);
		line(0, height - (i + frame) % height, (i + frame) % width, 0);
		line(width, (i + frame) % height, width - (i + frame) % width, height);
		line((i + frame) % width, 0, width, (i + frame) % height);
		*/

		//Triangle - Line 1 (0,500, 250,0) ; Line 2 (250,0, 500,500) ; Line 3 (500,500, 0,500) 
		// Considering that the first two lines has different amounts of steps but are travelling 
		//at the same speed, a solution to alter the distance one or the other travels in is needed.
		// Either an in- or decrease of speed. 
		// Current code is smaller than desired, the Y axix should start at the bottom of the screen.

		}

		frame ++;
		//frame2 += 2;
	
}
