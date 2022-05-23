

class Button {
  
  float PosX;
  float PosY;
  
  float Width;
  float Height;
  
  int Color = 165;
  
  String Act;
  String Label;
  
  boolean Pushed = false;
  boolean CanChange = true;
  
  Button(float x,float y,float w,float h,String act,String l) {
    
    PosX = x;
    PosY = y;
    
    Width = w;
    Height = h;
    
    Act = act;
    Label = l;
    
  }
  
  void Display() {
    
    fill(Color);
    rect(PosX,PosY,Width,Height);
    
    pushStyle();
    textAlign(CENTER,CENTER);
    textSize(16);
    fill(0);
    text(Label,PosX+(Width/2),PosY+(Height/2));
    popStyle();
    
    Push();
    
  }
  
  void Push() {
    
    if(MousePressedThisFrame && !Pushed) {
      if(mouseX > PosX && mouseX < PosX+Width) {
        if(mouseY > PosY && mouseY < PosY+Height) {
          Color = 125;
          Pushed = true;
        }
      }
    }
    
    if(MouseReleasedThisFrame && Pushed) {
      Color = 165;
      Action();
      Pushed = false;
    }
    
  }
  
  void Action() {
    
    switch(Act) {
      
      case "Save":
        GUI.G.Save(GUI.G.CurrentPath);
        break;
        
      case "Save As":
        GUI.G.SaveAs();
        break;
        
      case "Load":
        GUI.G.Load();
        Grid = true;
        Menu = false;
        break;
      
      case "New File":
        M.NewFile = true;
        break;
        
      case "Cancel nFile":
        M.NewFile = false;
        break;
        
      case "Create":
        M.nFile.Create();
        break;
        
      case "Menu":
        Grid = false;
        Menu = true;
        break;
        
      case "Exit":
        exit();
        break;
        
    }
    
  }
  
}
