
int actorStatus;

class Tile {
  
  float tileX;
  float tileY;
  
  float tileWidth;
  float tileHeight;
  
  float posX = 0;
  float posY = 0;
  
  //float speedX = 0;
  //float speedY = 0;
  float maxSpeed = 10;
  
  int shade = 255;
  
  float scale = 1;
  
  boolean isActivated = false;
  
  boolean moveRight;
  boolean moveLeft;
  boolean moveUp;
  boolean moveDown;
  
  int status;
  
  Tile() {}
  
  Tile(float x,float y,float w,float h) {
    tileX = x;
    tileY = y;
    
    tileWidth = w;
    tileHeight = h;
  }
  
  void Display(float s) {
    
    scale = s;
    
    pushMatrix();
    translate(posX,posY);
    scale(scale);
    
    fill(shade);
    stroke(0);
    rect(tileX,tileY,tileWidth,tileHeight);
    
    switch(status) {
      
      case 0:
        shade = 255;
        break;
        
      case 1:
        shade = 200;
        break;
        
      case 2:
        shade = 100;
        break;
        
      case 3:
        shade = 25;
        break;
        
    }
    
    Activate(actorStatus);
    
    Move();
    
    popMatrix();
    
  }
  
  boolean SetMove(char k,boolean b) {
    
    switch(k) {
      
      case 'a':
      case 'A':
        return moveLeft = b;
      
      case 'd':
      case 'D':
        return moveRight = b;
      
      case 'w':
      case 'W':
        return moveUp = b;
      
      case 's':
      case 'S':
        return moveDown = b;
      
      default:
        return b;
        
    }
    
  }
  
  void Activate(int s) {
    
    if((mouseX - posX)/scale >= tileX && (mouseX - posX)/scale <= tileX + tileWidth) {
      if((mouseY - posY)/scale >= tileY && (mouseY - posY)/scale <= tileY + tileHeight) {
        if(mousePressedThisFrame && !isActivated) {
          isActivated = true;
          SetState(s);
        }
        
        if(mouseReleasedThisFrame && isActivated) {
          isActivated = false;
        }
      }
    }
  }
  
  void Move() {
    
    if(moveRight) {
      posX -= maxSpeed;
    }
    if(moveLeft) {
      posX += maxSpeed;
    }
    if(moveUp) {
      posY += maxSpeed;
    }
    if(moveDown) {
      posY -= maxSpeed;
    }
    
  }
  
  void SetState(int s) {
    status = s;
  }
  
  int GetState() {
    return status;
  }
  
}
