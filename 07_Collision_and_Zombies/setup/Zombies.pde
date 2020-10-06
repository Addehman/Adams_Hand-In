class Zombies extends CharacterManager
{
	Zombies()
	{
		super();

		characterColor = color(0, 255, 0);

		setRanDir();

		velocity.x = random(-0.2, 0.2);
		velocity.y = random(-0.2, 0.2);
	}
}