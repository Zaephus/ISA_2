
int ActorStatus;

class Tile {
  
  float TileX;
  float TileY;
  
  float TileWidth;
  float TileHeight;
  
  float PosX = 0;
  float PosY = 0;
  
  float SpeedX = 0;
  float SpeedY = 0;
  float MaxSpeed = 10;
  
  int Color = 255;
  
  float Scale = 1;
  
  boolean Activated = false;
  
  boolean MoveRight;
  boolean MoveLeft;
  
  boolean MoveUp;
  boolean MoveDown;
  
  int Status;
  
  Tile() {}
  
  Tile(float x,float y,float w,float h) {
    
    TileX = x;
    TileY = y;
    
    TileWidth = w;
    TileHeight = h;
    
  }
  
  void Display(float s) {
    
    Scale = s;
    
    pushMatrix();
    translate(PosX,PosY);
    scale(Scale);
    
    fill(Color);
    stroke(0);
    rect(TileX,TileY,TileWidth,TileHeight);
    
    switch(Status) {
      
      case 0:
        Color = 255;
        break;
        
      case 1:
        Color = 200;
        break;
        
      case 2:
        Color = 100;
        break;
        
      case 3:
        Color = 25;
        break;
        
    }
    
    Activate(ActorStatus);
    
    Move();
    
    popMatrix();
    
  }
  
  boolean SetMove(char k,boolean b) {
    
    switch(k) {
      
      case 'a':
      case 'A':
        return MoveLeft = b;
      
      case 'd':
      case 'D':
        return MoveRight = b;
      
      case 'w':
      case 'W':
        return MoveUp = b;
      
      case 's':
      case 'S':
        return MoveDown = b;
      
      default:
        return b;
        
    }
    
  }
  
  void Activate(int Status) {
    
    if((mouseX-PosX)/Scale >= TileX && (mouseX-PosX)/Scale <= TileX+TileWidth) {
      if((mouseY-PosY)/Scale >= TileY && (mouseY-PosY)/Scale <= TileY+TileHeight) {
        if(MousePressedThisFrame && !Activated) {
          Activated = true;
          SetState(Status);
        }
        
        if(MouseReleasedThisFrame && Activated) {
          Activated = false;
        }
      }
    }
    
  }
  
  void Move() {
    
    if(MoveRight) {
      PosX -= MaxSpeed;
    }
    if(MoveLeft) {
      PosX += MaxSpeed;
    }
    if(MoveUp) {
      PosY += MaxSpeed;
    }
    if(MoveDown) {
      PosY -= MaxSpeed;
    }
    
  }
  
  void SetState(int status) {
    
    Status = status;
    
  }
  
  int GetState() {
    
    return Status;
    
  }
  
}
