class Humans extends CharacterManager
{
	int randomHumanColor;


	Humans()
	{
		super();
		
		randomHumanColor = (int)random(2);

		
		if (randomHumanColor == 0){
			characterColor = color(255, 172, 153); // Brighter Human color 
		}
		else if (randomHumanColor == 1) {
			characterColor = color(166, 119, 110); // Darker Human color
		}

		velocity.x = random(-1, 1);
		velocity.y = random(-1, 1);
	}
}