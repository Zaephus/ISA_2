

class Button {
  
  float posX;
  float posY;
  
  float buttonWidth;
  float buttonHeight;
  
  int shade = 165;
  
  String act;
  String label;
  
  boolean pressed = false;
  boolean canPress = true;
  
  Button(float x,float y,float w,float h,String a,String l) {
    
    posX = x;
    posY = y;
    
    buttonWidth = w;
    buttonHeight = h;
    
    act = a;
    label = l;
    
  }
  
  void Display() {
    
    fill(shade);
    rect(posX,posY,buttonWidth,buttonHeight);
    
    pushStyle();
    textAlign(CENTER,CENTER);
    textSize(16);
    fill(0);
    text(label,posX + (buttonWidth/2),posY + (buttonHeight/2));
    popStyle();
    
    Press();
    
  }
  
  void Press() {
    
    if(mousePressedThisFrame && !pressed) {
      if(mouseX > posX && mouseX < posX + buttonWidth) {
        if(mouseY > posY && mouseY < posY + buttonHeight) {
          shade = 125;
          pressed = true;
        }
      }
    }
    
    if(mouseReleasedThisFrame && pressed) {
      shade = 165;
      Action();
      pressed = false;
    }
    
  }
  
  void Action() {
    
    switch(act) {
      
      case "Save":
        gridUI.grid.Save(gridUI.grid.currentPath);
        break;
      
      case "Save As":
        gridUI.grid.SaveAs();
        break;
      
      case "Load":
        gridUI.grid.Load();
        onEditor = true;
        onMenu = false;
        break;
      
      case "New File":
        menu.onNewFile = true;
        menu.onNewDungeon = false;
        break;
      
      case "New Dungeon":
        menu.onNewDungeon = true;
        menu.onNewFile = false;
        break;
      
      case "Cancel nFile":
        menu.onNewFile = false;
        menu.onNewDungeon = false;
        break;
      
      case "Create New File":
        menu.newFile.Create();
        break;
      
      case "Create New Dungeon":
        menu.newDungeon.Create();
        break;
      
      case "Menu":
        onEditor = false;
        onMenu = true;
        break;
      
      case "Exit":
        exit();
        break;
      
    }
    
  }
  
}
