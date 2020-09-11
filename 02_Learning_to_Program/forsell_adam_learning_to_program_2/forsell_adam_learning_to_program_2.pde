//int gridBase = 0;
int frame = 0;

int spaceBetween = 10;

void setup()
{
	size(640, 640);
}

void draw() 
{
	background(141,141,141);
	
	

	

	for (int i = 0; i < height; i = i += spaceBetween)
	{
		/*if (i % 3 == 0) 
		{
			stroke(0);
		} 
		else 
		{
			stroke(150);
		}*/

		strokeWeight(2);


		// Swirling Triangle #1 (Blue)
		stroke(0, 77, 253);
		line((i + frame) % (width/4), height - ((i + frame) * 2) % (height/2), (width/4) + (i + frame) % (width/4), (height/2) + ((i + frame) * 2) % (height/2));
		line((width/4) + (i + frame) % (width/4), (height/2) + ((i + frame) * 2) % (height/2), (width/2) - ((i + frame) * 2) % (width/2), height);
		line((width/2) - ((i + frame) * 2) % (width/2), height, (i + frame) % (width/4), height - ((i + frame) * 2) % (height/2));


		// Swirling Triangle #2 (Red)
		stroke(251, 1, 1);
		line((width/4) + (i + frame) % (width/4), (height/2) - ((i + frame) * 2) % (height/2), (width/2) + (i + frame) % (width/4), ((i + frame) * 2) % (height/2));
		line((width/2) + (i + frame) % (width/4), ((i + frame) * 2) % (height/2), (width/4) * 3 - ((i + frame) * 2) % (width/2), (height/2));
		line((width/4) * 3 - ((i + frame) * 2) % (width/2), (height/2), (width/4) + (i + frame) % (width/4), (height/2) - ((i + frame) * 2) % (height/2));


		// Swirling Triangle #3 (Green)
		stroke(0, 255, 0);
		line((width/2) + (i + frame) % (width/4), height - ((i + frame) * 2) % (height/2), (width/4) * 3 + (i + frame) % (width/4), (height/2) + ((i + frame) * 2) % (height/2));
		line((width/4) * 3 + (i + frame) % (width/4), (height/2) + ((i + frame) * 2) % (height/2), width - ((i + frame) * 2) % (width/2), height);
		line(width - ((i + frame) * 2) % (width/2), height, (width/2) + (i + frame) % (width/4), height - ((i + frame) * 2) % (height/2));

		}

		strokeWeight(5);

		// Frame/Outline - Triangle #1 (Blue)
		stroke(0, 0, 244);
		line(0, height, width/4, height/2);
		line(width/4, height/2, width/2, height);
		line(width/2, height, 0, height);

		// Frame/Outline - Triangle #2 (Red)
		stroke(226, 0, 0);
		line(width/4, height/2, width/2, 0);
		line(width/2, 0, (width/4) * 3, height/2);
		line((width/4) * 3, height/2, width/4, height/2);

		// Frame/Outline - Triangle #3 (Green)
		stroke(0, 188, 0);
		line(width/2, height, (width/4) * 3, height/2);
		line((width/4) * 3, height/2, width, height);
		line(width, height, width/2, height);


		frame ++;
	
}
