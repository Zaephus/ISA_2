

class Tile {
  
  float tileX;
  float tileY;
  
  float tileWidth;
  float tileHeight;
  
  int shade = 255;
  
  int status;
  
  Tile() {}
  
  Tile(float x,float y,float w,float h) {
    tileX = x;
    tileY = y;
    
    tileWidth = w;
    tileHeight = h;
  }
  
  void Display() {
    
    pushMatrix();
    
    fill(shade);
    stroke(30);
    rect(tileX,tileY,tileWidth,tileHeight);
    
    switch(status) {
      
      case 0:
        shade = 255;
        break;
        
      case 1:
        shade = 150;
        break;
        
      case 2:
        shade = 60;
        break;
        
      case 3:
        shade = 0;
        break;
        
    }
    
    popMatrix();
    
  }
  
  void SetState(int s) {
    status = s;
  }
  
}
