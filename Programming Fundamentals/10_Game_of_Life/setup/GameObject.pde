class GameObject
{
   PVector position = new PVector();
   
   boolean active = false;
   
   color activeColor = color(255, 0, 0), inActiveColor = color(0);
   
   public GameObject (boolean alive, PVector position) 
   {
     active = alive;
     // Our PVector position is equal to incoming position, and so forth
     this.position = position;
   }
   
   
   void draw()
   {
     if (active) {
       fill(activeColor);
     }
     else {
       fill(inActiveColor);
     }
     rect(position.x, position.y, cellSize, cellSize);
   }
}
