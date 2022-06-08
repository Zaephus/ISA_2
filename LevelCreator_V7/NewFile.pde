

class NewFile {
  
  float posX;
  float posY;
  
  float windowWidth;
  float windowHeight;
  
  int amountX;
  int amountY;
  
  Button buttons[] = new Button[2];
  TextBox textBoxes[] = new TextBox[2];
  
  NewFile(float x,float y,float w,float h) {
    
    posX = x;
    posY = y;
    
    windowWidth = w;
    windowHeight = h;
    
    textBoxes[0] = new TextBox(posX + 120,posY + 100,100,40);
    textBoxes[1] = new TextBox(posX + 120,posY + 150,100,40);
    
    buttons[0] = new Button(posX + 50,posY + windowHeight - 100,50,50,"Cancel nFile","Cancel");
    buttons[1] = new Button(posX + windowWidth - 100,posY + windowHeight - 100,50,50,"Create New File","Create");
    
  }
  
  void Display() {
    
    t = textBoxes;
    
    stroke(0);
    fill(222);
    rect(posX,posY,windowWidth,windowHeight);
    noStroke();
    
    fill(0);
    
    textSize(60);
    textAlign(CENTER,CENTER);
    text("New File",posX + (windowWidth/2),posY + 40);
    
    textSize(24);
    textAlign(LEFT,TOP);
    text("AmountX:",posX + 15,posY + 100);
    text("AmountY:",posX + 15,posY + 150);
    
    for(int i = 0; i < t.length; i++) {
      textBoxes[i].Display();
      for(int j = 0; j < t.length; j++) {
        if(i == j) {
          continue;
        }
        if(!textBoxes[i].canChange) {
          textBoxes[j].isFocused = false;
        }
      }
    }
    
    amountX = int(t[0].input);
    amountY = int(t[1].input);
    
    for(int i = 0; i < buttons.length; i++) {
      buttons[i].Display();
    }
    
  }
  
  void Create() {
    menu.CreateGrid(CreateData(amountX,amountY));
  }
  
}
