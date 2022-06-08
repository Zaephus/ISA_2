

class Toggle {
  
  float posX;
  float posY;
  
  float toggleWidth;
  float toggleHeight;
  
  int shade = 165;
  
  String act;
  
  boolean canChange = true;
  boolean isActivated = false;
  
  Toggle(float x,float y,float w,float h,String a) {
    
    posX = x;
    posY = y;
    
    toggleWidth = w;
    toggleHeight = h;
    
    act = a;
    
  }
  
  void Display() {
    
    fill(shade);
    rect(posX,posY,toggleWidth,toggleHeight);
    
    pushStyle();
    textAlign(CENTER,CENTER);
    fill(0);
    textSize(toggleHeight*0.7);
    text(act,posX + (toggleWidth/2),posY + (toggleHeight/2));
    popStyle();
    
    Activate();
    
  }
    
  void Activate() {
    
    if(mousePressedThisFrame && canChange) {
      if(mouseX > posX && mouseX < posX + toggleWidth) {
        if(mouseY > posY && mouseY < posY + toggleHeight) {
          Action();
          isActivated = !isActivated;
          canChange = false;
        }
      }
    }
    
    if(mouseReleasedThisFrame) {
      canChange = true;
    }
    
    if(isActivated) {
      shade = 125;
    }
    else if(!isActivated) {
      shade = 165;
    }
    
  }
  
  void Action() {
    
    switch(act) {
      
      case "1":
        actorStatus = 0;
        break;
      
      case "2":
        actorStatus = 1;
        break;
      
      case "3":
        actorStatus = 2;
        break;
      
      case "4":
        actorStatus = 3;
        break;
      
    }
    
  }
  
}
