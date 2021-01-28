class GameManager
{
	void start()
	{
// Create the characters
		zombies[0] = new Zombies();

		for (int i = 0; i < humans.length; i++) {

			humans[i] = new Humans();
		}
	}


	void update()
	{
		if (gameOver) {
			return;
		}
		
		collisionManager.collisionCheck();

		for (int i = 0; i < humans.length; i++) {

			if (humans[i] != null) {

				humans[i].update();
			}
		}

		for (int i = 0; i < zombies.length; i++) {

			if (zombies[i] != null) {

				zombies[i].update();
			}
		}
	}


	void draw()
	{
		for (int i = 0; i < humans.length; i++) {

			if (humans[i] != null) {

				humans[i].draw();
			}
		}

		for (int i = 0; i < zombies.length; i++) {

			if (zombies[i] != null) {

				zombies[i].draw();
			}
		}

		if (gameOver) {
			fill(255, 0, 0);
			textAlign(CENTER);
			textSize(72);
			text("Game Over", width/2, height/2);
		}
	}


	void humanConverted()
	{
		humansLeft--;

		if (humansLeft <= 0) {
			gameOver = true;
		}
	}
}