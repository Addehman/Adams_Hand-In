GameObject[][] cells; // Our game grid matrix
GameObject[][] buffer;
Life life;

float cellSize = 5; // Size of our cells

int numberOfColumns, numberOfRows, activeNeighbors, numberOfDeaths,
fillPercent = 10; // Number of starting dots


void setup()
{
  size(1920, 1080);
  rectMode(CORNER);
  frameRate(120);
  
  init();
}

void draw()
{
  // For each row
  for (int y = 0; y < numberOfRows; y++) {
    // For each column
    for (int x = 0; x < numberOfColumns; x++) {
      // Draw current cell
      cells[x][y].draw();
      
      buffer[x][y] = new GameObject(cells[x][y].active, cells[x][y].position);
    }
  }
  
  life.cycle();
  
   for (int y = 0; y < numberOfRows; y++) {
    for (int x = 0; x < numberOfColumns; x++) {
      
      cells[x][y] = buffer[x][y];
    }
  }
}

void init()
{
  numberOfDeaths = 0;
  
  numberOfColumns = floor(width/cellSize);
  numberOfRows = floor(height/cellSize);
  
  cells = new GameObject[numberOfColumns][numberOfRows];
  buffer = new GameObject[numberOfColumns][numberOfRows];
  life = new Life();

// For each row
  for (int y = 0; y < numberOfRows; y++) {
      
    // For each column in each row
    for (int x = 0; x < numberOfColumns; x++) {
      
      // Create our game objects, multiply by cellSize for correct placement
      cells[x][y] = new GameObject(random(100) < fillPercent, new PVector(x, y).mult(cellSize));
      
      // Random if it should be active
      //if (random(100) < fillPercent) {
     //   cells[x][y].active = true;
     // }
    }
  }
}
