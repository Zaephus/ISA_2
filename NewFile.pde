

class NewFile {
  
  float PosX;
  float PosY;
  
  float Width;
  float Height;
  
  int AmountX;
  int AmountY;
  
  Button Buttons[] = new Button[2];
  
  NewFile(float x,float y,float w,float h) {
    
    PosX = x;
    PosY = y;
    
    Width = w;
    Height = h;
    
    t = new TextBox[2];
    
    t[0] = new TextBox(PosX+120,PosY+100,50,40);
    t[1] = new TextBox(PosX+120,PosY+150,50,40);
    
    Buttons[0] = new Button(PosX+50,PosY+Height-100,50,50,"Cancel nFile","Cancel");
    Buttons[1] = new Button(PosX+Width-100,PosY+Height-100,50,50,"Create","Create");
       
  }
  
  void Display() {
    
    stroke(0);
    fill(222);
    rect(PosX,PosY,Width,Height);
    noStroke();
    
    fill(0);
    
    textSize(60);
    textAlign(CENTER,CENTER);
    text("New File",PosX+(Width/2),PosY+40);
    
    textSize(24);
    textAlign(LEFT,TOP);
    text("AmountX:",PosX+15,PosY+100);
    text("AmountY:",PosX+15,PosY+150);
    
    for(int i = 0; i < t.length; i++) {
      t[i].Display();
      for(int j = 0; j < t.length; j++) {
        if(i == j) {
          continue;
        }
        if(!t[i].CanChange) {
          t[j].Focused = false;
        }
      }
    }
    
    AmountX = int(t[0].Input);
    AmountY = int(t[1].Input);
    
    for(int i = 0; i < Buttons.length; i++) {
      Buttons[i].Display();
    }
    
  }
  
  void Create() {
    
    println(AmountX,AmountY);
    M.GridCreate(DataCreate(AmountX,AmountY));
    
  }
  
}
