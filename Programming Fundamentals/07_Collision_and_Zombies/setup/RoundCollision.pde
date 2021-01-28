// boolean roundCollision(float char1X, float char1Y, float char1Size, float char2X, float char2Y, float char2Size) {

// 	float maxDistance = char1Size + char2Size;


// 	if (dist(char1X, char1Y, char2X, char2Y) > maxDistance) {

// 		return false;
// 	}
// 	else {
// 		return true;

// 	}
// }

boolean roundCollision(CharacterManager zombie, CharacterManager human)
{
	float maxDistance = zombie.radius + human.radius;

	if (abs(zombie.position.x - human.position.x) > maxDistance || 
		abs(zombie.position.y - human.position.y) > maxDistance) {

		return false;
	}

	else if (PVector.dist(zombie.position, human.position) > maxDistance) {

		return false;
	}

	return true;
}