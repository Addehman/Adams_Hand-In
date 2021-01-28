//Check collision, 2 circles
//plX, plY is the position of the first circle(player)
//plSize is the radius of the first circle(Player)
//then the same data for circle number two

//function will return true (collision) or false (no collision)
//boolean is the return type

boolean roundCollision(float plX, float plY, float plSize, float colX, float colY, float colSize)
{
	float maxDistance = plSize + colSize;

	//First a quick check to see if we are too far away in X or Y direction,
	//if we are far away we don't collide so just return false and be done.
	if (abs(plX - colX) > maxDistance || abs(plY - colY) > maxDistance)
	{
		return false;
	}

	//we then run the slower distance calculation
	//dist uses Pythagoras to get exact distance, if we still are to far away we are not colliding
	else if (dist(plX, plY, colX, colY) > maxDistance)
	{
		return false;
	}
	//We now know the points are closer than the distance so we are colliding!
	else
	{
		return true;
	}
}
//A better way to do this is to have a circle object and pass the objects into the function,
//then we just have to pass 2 objects instead of 6 different values.