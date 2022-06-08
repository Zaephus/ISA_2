

class NewDungeon {
  
  float posX;
  float posY;
  
  float windowWidth;
  float windowHeight;
  
  int seed;
  
  int gridWidth;
  int gridHeight;
  
  int numRooms;
  int minRoomSize;
  int maxRoomSize;
  
  Button buttons[] = new Button[2];
  TextBox textBoxes[] = new TextBox[6];
  
  NewDungeon(float x,float y,float w,float h) {
    
    posX = x;
    posY = y;
    
    windowWidth = w;
    windowHeight = h;
    
    textBoxes[0] = new TextBox(posX + 175,posY + 100,100,40);
    textBoxes[1] = new TextBox(posX + 175,posY + 150,100,40);
    textBoxes[2] = new TextBox(posX + 175,posY + 200,100,40);
    textBoxes[3] = new TextBox(posX + 475,posY + 100,100,40);
    textBoxes[4] = new TextBox(posX + 475,posY + 150,100,40);
    textBoxes[5] = new TextBox(posX + 475,posY + 200,100,40);
    
    buttons[0] = new Button(posX + 50,posY + windowHeight - 100,50,50,"Cancel nFile","Cancel");
    buttons[1] = new Button(posX + windowWidth - 100,posY + windowHeight - 100,50,50,"Create New Dungeon","Create");
    
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
    text("New Dungeon",posX + (windowWidth/2),posY + 40);
    
    textSize(24);
    textAlign(LEFT,TOP);
    text("Grid Width:",posX + 30,posY + 100);          text("Room Amount:",posX + 300,posY + 100);
    text("Grid Height:",posX + 30,posY + 150);         text("Min. Room Size:",posX + 300,posY + 150);
    text("Seed:",posX + 30,posY + 200);                text("Max. Room Size:",posX + 300,posY + 200);
    
    textSize(20);
    text("(Seed 0 for a random Seed)",posX + 30,posY + 240);
    
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
    
    gridWidth = int(t[0].input);
    gridHeight = int(t[1].input);
    
    numRooms = int(t[2].input);
    minRoomSize = int(t[3].input);
    maxRoomSize = int(t[4].input);
    
    seed = int(t[5].input);
    
    for(int i = 0; i < buttons.length; i++) {
      buttons[i].Display();
    }
    
  }
  
  void Create() {
    menu.CreateDungeon();
  }
  
}
