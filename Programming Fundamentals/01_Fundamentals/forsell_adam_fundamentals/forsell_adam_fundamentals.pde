int frame = 0;
int spaceBetweenLines = 10;

void setup()
{
  size(768, 432);
}

void draw()
{  
  background(#3f853f);

  stroke(#133510);
  strokeWeight(23); 
  A();
  D();
  A2();
  M();

  for (int i = 0; i < height; i = i + spaceBetweenLines) 
  {
    stroke(128,128,128,64);
    strokeWeight(2);
    line(1, (i + frame) % height, width, (i + frame) % height);
  }
  frame++;
}

void A()
{
  line(20,287,77,122);
  line(139,286,77,122);
  line(144,244,14,244);
}

void D()
{
  line(209,286,186,126);
  noFill();
  arc(186,208,167,169,-2.0,1.64);
}

void A2()
{

  line(296,286,358,122);
  line(418,286,359,122);
  line(418,245,294,247);
}

void M()
{
  line(454,285,454,131);
  line(525,248,447,116);
  line(525,249,586,117);
  line(587,286,581,134);
}