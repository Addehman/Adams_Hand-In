class Life
{
  void cycle()
  {
// Check for active neighbors
    for (int y = 1; y < numberOfRows - 1; y++) {
      for (int x = 1; x < numberOfColumns - 1; x++) {
        activeNeighbors = 0;
        
// Here we check for ACTIVE neighbors
        // If neighbor above to left is active, add to activeNeighbors
        if (cells[x-1][y-1].active) {
          activeNeighbors++;
        }
        // If neighbor above is active, add to activeNeighbors
        if (cells[x][y-1].active) {
          activeNeighbors++;
        }
        // If neighbor above to right is active, add activeNeighbors
        if (cells[x+1][y-1].active) {
          activeNeighbors++;
        }
        // If neighbor to right is active, add to activeNeighbors
        if (cells[x+1][y].active) {
          activeNeighbors++;
        }
        // If neighbor below to right is active, add to activeNeighbors
        if (cells[x+1][y+1].active) {
          activeNeighbors++;
        }
        // If neighbor below is active, add to activeNeighbors
        if (cells[x][y+1].active) {
          activeNeighbors++;
        }
        // If neighbor below to left is active, add to activeNeighbors
        if (cells[x-1][y+1].active) {
          activeNeighbors++;
        }
        // If neighbor to left is active, add to activeNeighbors
        if (cells[x-1][y].active) {
          activeNeighbors++;
        }
                
// Check if the neighbors are too few or many, if yes become dead        
        if (activeNeighbors < 2 || activeNeighbors > 3) {
          buffer[x][y].active = false;
          
          numberOfDeaths++;
        }
// Otherwise we check if a birth should happen when there's 3 neighbors
        else if (activeNeighbors == 3){
          buffer[x][y].active = true;
        }
        
        
// When clicking on a cell, we can toggle life/death - mind that one alone won't survive
        if (mousePressed && mouseX > cells[x][y].position.x && mouseX < cells[x][y].position.x + cellSize 
        && mouseY > cells[x][y].position.y && mouseY < cells[x][y].position.y + cellSize) {
          
          if (cells[x][y].active) {
            cells[x][y].active = false;
          }
          else {
            cells[x][y].active = true;
          }
        }
      }
    }
  }
}
