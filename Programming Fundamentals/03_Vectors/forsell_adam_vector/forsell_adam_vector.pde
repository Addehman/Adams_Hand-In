

PVector eliPos = new PVector();
PVector dir = new PVector();

float size = 20, speed = 0.1;


void setup() 
{
	size(512, 512);
	eliPos.x = width/2;
	eliPos.y = height/2;

}

void draw() 
{
	background(0);
	ellipseMode(CENTER);

	noFill();
	stroke(255, 128);
	strokeWeight(3);
	ellipse(eliPos.x, eliPos.y, size, size);

	
	eliPos.add(dir);


	if (mousePressed == true)
	{
		line(eliPos.x, eliPos.y, mouseX, mouseY);

		/*float moveSpeed = 100, moveDecel = 0.1;

		if (eliPos.x < mousePos.x)
		{
			eliPos.x += (moveSpeed * moveDecel);
		}

		if (eliPos.x > mousePos.x)
		{
			eliPos.x -= (moveSpeed * moveDecel);
		}

		if (eliPos.y < mousePos.y)
		{
			eliPos.y += (moveSpeed * moveDecel);
		}

		if (eliPos.y > mousePos.y)
		{
			eliPos.y -= (moveSpeed * moveDecel);
		}*/
	}
	bounce();

	//if (speed == 0.05)
}

void bounce ()
{
	// when the position is either outside to the left or the right edge of the screen
	if (eliPos.x <= 0 || eliPos.x >= width)
	{
		dir.x = dir.x * -1;
		speed -= 0.01;
		println(speed);
	}

	if (eliPos.y <= 0 || eliPos.y >= height)
	{
		dir.y = dir.y * -1;
		speed -= 0.01;
		println(speed);
	}
}


void mousePressed ()
{
	//eliPos.x = mouseX;
	//eliPos.y = mouseY;

	//dir.x = 0;
	//dir.y = 0;
}

void mouseReleased ()
{
	PVector input = new PVector(mouseX, mouseY);

	dir = input.sub(eliPos);
	dir = dir.mult(speed = 0.05);

	//println(speed);
}
