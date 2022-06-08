

class TextBox {
  
  float posX;
  float posY;
  
  float boxWidth;
  float boxHeight;
  
  int shade = 165;
  
  String input = "";
  
  boolean canChange = true;
  boolean isFocused = false;
  
  TextBox(float x,float y,float w,float h) {
    
    posX = x;
    posY = y;
    
    boxWidth = w;
    boxHeight = h;
    
  }
  
  void Display() {
    
    fill(shade);
    noStroke();
    rect(posX,posY,boxWidth,boxHeight);
    
    fill(0);
    textSize(boxHeight*0.75);
    textAlign(CENTER,CENTER);
    text(input,posX,posY,boxWidth,boxHeight);
    
    Focus();
    
  }
  
  void Focus() {
    
    if(mousePressedThisFrame && canChange) {
      if(mouseX > posX && mouseX < posX + boxWidth) {
        if(mouseY > posY && mouseY < posY + boxHeight) {
          isFocused = !isFocused;
          canChange = false;
        }
      }
    }
    
    if(mouseReleasedThisFrame) {
      canChange = true;
    }
    
    if(isFocused) {
      shade = 125;
    }
    else if(!isFocused) {
      shade = 165;
    }
    
  }
  
}
