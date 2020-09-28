class Player 
{
  //All player variables

  //Movement
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();

  float accelerationMultiplier = 0.75;
  float deaccelerationMultiplier = 0.15;
  float speed = 60.0;

  // Adjust here when adjusting the Jump height! also in Input-file (the float "jumpForce")
  float maxSpeed = 20;


  //Art
  float playerSize = 20;

  //status
  boolean dead = false;



  public Player ()
  {
    position.x = width/2;
    position.y = height/2;
  }


  void update(float deltaTime)
  {
    //Get input
    acceleration = input();

    //prepare our acceleration
    acceleration.mult(accelerationMultiplier * speed * deltaTime);

    //if no input, slow down
    if (acceleration.mag() == 0)
    {
      acceleration.x -= velocity.x * deaccelerationMultiplier;

      if (!gravity)
      {
        acceleration.y -= velocity.y * deaccelerationMultiplier;
      }
    }


    //update velocity
    velocity.add(acceleration);
    velocity.limit(maxSpeed);

    PVector move = velocity.copy();

    move.mult(speed * deltaTime);	

    position.add(velocity);


    if (gravity)
    {
      bounce();
      myGravity();
    } else 
    {
      wrap();
    }

    //println(velocity.y);
  }


  void wrap()
  {
    if (position.x < 0)
    {
      position.x = width;
    } else if (position.x > width)
    {
      position.x = 0;
    }

    // Limit movement on Y axis
    if (position.y < 0)
    {
      position.y = height;
    } else if (position.y > height)
    {
      position.y = 0;
    }
  }

  void bounce()
  {
    // bounce on sides
    if (position.x < 0 + (playerSize/2) || position.x > width - (playerSize/2))
    {
      velocity.x = velocity.x * -1;
    }

    // bounce on top or bottom
    if (position.y < 0 + (playerSize/2) || position.y > height - (playerSize/2))
    {
      // decrease bounce slightly on every bounce
      velocity.y = velocity.y * -0.75;
    }


    // Boundaries when bouncing - force ball inside window
    if (position.x < 0 + (playerSize/2))
    {
      position.x = 0 + (playerSize/2);
    } else if (position.x > width - (playerSize/2))
    {
      position.x = width - (playerSize/2);
    }

    if (position.y < 0 + (playerSize/2))
    {
      position.y = 0 + (playerSize/2);
    } else if (position.y > height - (playerSize/2))
    {
      position.y = height - (playerSize/2);
    }
  }

  void myGravity()
  {
    if (gravity && position.y < height - (playerSize/2))
    {
      velocity.y += 0.5;
    }
  }


  void draw()
  {
    //Draw our player with red color.
    fill(255);
    stroke(0);
    strokeWeight(3);
    ellipse(position.x, position.y, playerSize, playerSize);
  }
}
