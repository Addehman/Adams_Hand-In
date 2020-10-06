class CollisionManager
{
	void collisionCheck()
	{
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

		for (int i = 0; i < humans.length; i++) {

			if (humans[i] != null) {

				for (int j = 0; j < zombies.length; j++) {

					if (zombies[j] != null) {

						if (roundCollision(zombies[j], humans[i])) {

							for (int k = 0; k < zombies.length; k++) {

								if (zombies[k] == null) {

									zombies[k] = new Zombies();
									zombies[k].position = humans[i].position;

									humans[i] = null;

									gameManager.humanConverted();

									break;
								}
							}
							break;
						}
					}
				}
			}
		}
	}
}