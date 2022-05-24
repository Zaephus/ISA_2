

class TextBox {
  
  float PosX;
  float PosY;
  
  float Width;
  float Height;
  
  int Color = 165;
  
  String Input = "";
  
  boolean CanChange = true;
  boolean Focused = false;
  
  TextBox(float x,float y,float w,float h) {
    
    PosX = x;
    PosY = y;
    
    Width = w;
    Height = h;
    
  }
  
  void Display() {
    
    fill(Color);
    noStroke();
    rect(PosX,PosY,Width,Height);
    
    fill(0);
    textSize(Height*0.75);
    textAlign(CENTER,CENTER);
    text(Input,PosX,PosY,Width,Height);
    
    Focus();
    
  }
  
  void Focus() {
    
    if(mousePressed && CanChange) {
      if(mouseX > PosX && mouseX < PosX+Width) {
        if(mouseY > PosY && mouseY < PosY+Height) {
          Focused = !Focused;
          CanChange = false;
        }
      }
    }
    
    if(!mousePressed) {
      CanChange = true;
    }
    
    if(Focused) {
      Color = 125;
    }
    else if(!Focused) {
      Color = 165;
    }
    
  }
  
}
