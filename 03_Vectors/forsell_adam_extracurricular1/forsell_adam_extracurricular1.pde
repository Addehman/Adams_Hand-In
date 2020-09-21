
PVector randomVect;

int hitArea = 10;

void setup() 
{
	size(512, 512);
	randomVect = new PVector(random(0, width), random(0, height));

	println("Click where you think these coordinates are located within the play area!");
	println("The size of the Play Area is " + width + " on X, and " + height + " on Y.") ;
	println("Be at least within 10 pixels on both X and Y axis to win!");
	println("These are the Coordinates: " + randomVect);
}

void draw() 
{
	background(255);

	if (mousePressed)
	{
		// Show where the position was when player clicks 
		fill(0);
		ellipse(randomVect.x, randomVect.y, 10, 10);
	}
}

void mousePressed()
{
	int score = 0;

	if (mouseX >= (randomVect.x - hitArea) && mouseX <= (randomVect.x + hitArea))
	{
		score += 1;
		println("Hit on X Axis!");
	}
	else
	{
		println("Off on the X Axis...");
	}

	if (mouseY >= (randomVect.y - hitArea) && mouseY <= (randomVect.y + hitArea))
	{
		score += 1;
		println("Hit on the Y Axis!");
	}
	else 
	{
		println("Off on the Y Axis...");
	}

	// Check for if both the axes were correct
	if (score == 2)
	{
		println("Congratulations! You Win!");
	}

}

void mouseReleased()
{
	// Reset the game with new coordinates every time the use has clicked/tried
	randomVect = new PVector(random(0, width), random(0, height));

	println("#########################################################################");
	println("Try Again!");
	println("Click where you think these coordinates are located within the play area!");
	println("The size of the Play Area is " + width + " on X, and " + height + " on Y.");
	println("Be at least within 10 pixels on both X and Y axis to win!");
	println("These are the Coordinates: " + randomVect);
}

