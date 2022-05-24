

class Toggle {
  
  float PosX;
  float PosY;
  
  float Width;
  float Height;
  
  int Color = 165;
  
  String Act;
  
  boolean CanChange = true;
  boolean Activate = false;
  
  Toggle(float PosX,float PosY,float Width,float Height,String Act) {
    
    this.PosX = PosX;
    this.PosY = PosY;
    
    this.Width = Width;
    this.Height = Height;
    
    this.Act = Act;
    
  }
  
  void Display() {
    
    fill(Color);
    rect(PosX,PosY,Width,Height);
    
    pushStyle();
    textAlign(CENTER,CENTER);
    fill(0);
    textSize(Height*0.7);
    text(Act,PosX+(Width/2),PosY+(Height/2));
    popStyle();
    
    Activate();
    
  }
  
  void Activate() {
    
    if(MousePressedThisFrame && CanChange) {
      if(mouseX > PosX && mouseX < PosX+Width) {
        if(mouseY > PosY && mouseY < PosY+Height) {
          Action();
          Activate = !Activate;
          CanChange = false;
        }
      }
    }
    
    if(MouseReleasedThisFrame) {
      CanChange = true;
    }
    
    if(Activate) {
      Color = 125;
    }
    else if(!Activate) {
      Color = 165;
    }
    
  }
  
  void Action() {
    
    switch(Act) {
      
      case "1":
        ActorStatus = 0;
        break;
      
      case "2":
        ActorStatus = 1;
        break;
      
      case "3":
        ActorStatus = 2;
        break;
      
      case "4":
        ActorStatus = 3;
        break;
      
    }
    
  }
  
}
