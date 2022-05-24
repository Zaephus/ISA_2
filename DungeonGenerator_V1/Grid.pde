

class Grid extends Tile {
  
  float posX;
  float posY;
  
  int amountX;
  int amountY;
  
  float tileSize;
  
  Tile tiles[][];
  
  Grid(float x,float y,float s,int ax,int ay) {
    posX = x;
    posY = y;
    
    tileSize = s;
    
    amountX = ax;
    amountY = ay;
  }
  
  void GridCreate() {
    
    tiles = new Tile[amountX][amountY];
    
    for(int i = 0; i < amountX; i++) {
      for(int j = 0; j < amountY; j++) {
        tiles[i][j] = new Tile((i*tileSize) + posX,(j*tileSize) + posY,tileSize,tileSize);
        tiles[i][j].SetState(2);
      }
    }
    
  }
  
  void Display() {
    
    for(int i = 0; i < amountX; i++) {
      for(int j = 0; j < amountY; j++) {
        tiles[i][j].Display();
      }
    }
    
  }
  
}
