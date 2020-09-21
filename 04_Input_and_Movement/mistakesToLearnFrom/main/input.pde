boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
PVector inputVector = new PVector();

boolean buttonReleased = false;
boolean jumping = false;

public boolean gravity;

int jumpForce = 5;
int jumpLimit = 10;
int jumpTimer = 0;


// Key pressed, set our variables to true

void keyPressed()
{
  buttonReleased = false;


  // toggle gravity-function
  if (key == 'g')
  {
    gravity = !gravity;
  }


  if (keyCode == LEFT || key == 'a')
  {
    moveLeft = true;
  } else if (keyCode == RIGHT || key == 'd')
  {
    moveRight = true;
  }

  if (!gravity)
  {
    if (keyCode == UP || key == 'w')
    {
      moveUp = true;
    } else if (keyCode == DOWN || key == 's')
    {
      moveDown = true;
    }
  }
  // --- Jump button pressed ---
  // Here I am very lost - too tired atm, but need to somehow get the conditions right:
  // Jumping should be possible only if on the "floor" and the jumpTimer is not counting.
  // it should start counting from the point that these conditions are true and the
  else if (keyCode == UP || key == ' ')
  {
    if (position.y >= height - (ballSize/2))
    {
      jumpTimer = 0;
      jumping = true;
    }

    if (jumping == true && jumpTimer < jumpLimit)
    {
      // Continuously increase position.y until timer reaches limit
      jumpButton();
      jumpTimer ++;
    } else if (jumping == true && jumpTimer >= jumpLimit)
    {
      jumping = false;
      velocity.y = 0;
      // Seems to work now, but not ideally.. Possibly something is wrong with the use of the different vectors, 
      //like maybe I should be using the "acceleration" instead of "velocity"...
    }
  }

  // When a key is released, we will set our variable to false
  void keyReleased()
  {
    buttonReleased = true;


    if (keyCode == LEFT || key == 'a')
    {
      moveLeft = false;
    } else if (keyCode == RIGHT || key == 'd')
    {
      moveRight = false;
    }

    if (!gravity)
    {
      if (keyCode == UP || key == 'w')
      {
        moveUp = false;
      }
    } else 
    {
      if (keyCode == UP || key == ' ')
      {
        velocity.y = 0;
        jumping = false;
      }
    }


    if (keyCode == DOWN || key == 's')
    {
      moveDown = false;
    }
  }

  // Returns a normalized PVector input
  PVector input()
  {
    inputVector.x = 0;
    inputVector.y = 0;

    // Adjust acceleration from user
    if (moveLeft)
    {
      acceleration.x -= 1;
    }

    if (moveRight)
    {
      acceleration.x += 1;
    }

    if (moveUp)
    {
      acceleration.y -= 1;
    }

    if (moveDown)
    {
      acceleration.y += 1;
    }

    inputVector.normalize();

    return inputVector;
  }

  void jumpButton ()
  {
    velocity.y = -jumpForce;
    println(jumpTimer);
  }
