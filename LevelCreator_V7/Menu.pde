

class Menu {
  
  boolean onNewFile = false;
  boolean onNewDungeon = false;
  
  Button buttons[] = new Button[4];
  
  NewFile newFile;
  NewDungeon newDungeon;
  
  Menu() {
    
    buttons[0] = new Button(width - 150,height - 150,100,100,"Exit","Exit");
    buttons[1] = new Button(50,height - 150,100,100,"New File","New File");
    buttons[2] = new Button(200,height - 150,100,100,"New Dungeon","New Dungeon");
    buttons[3] = new Button(350,height - 150,100,100,"Load","Load");
    
    newFile = new NewFile((width/2) - 200,(height/2) - 200,400,400);
    newDungeon = new NewDungeon((width/2) - 300,(height/2) - 200,600,400);
    
  }
  
  void Display() {
    
    backgroundR = backgroundG = backgroundB = 222;
    
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(100);
    text("Level Creator",width/2,height/3);
    
    for(int i = 0; i < buttons.length; i++) {
      buttons[i].Display();
    }
    
    if(onNewFile) {
      newFile.Display();
    }
    if(onNewDungeon) {
      newDungeon.Display();
    }
    
  }
  
  void CreateGrid(Table temp) {
    
    gridUI.grid.CreateGrid(temp,"null");
    onEditor = true;
    onNewFile = false;
    onNewDungeon = false;
    onMenu = false;
    
  }
  
  void CreateDungeon() {
    
    DungeonGenerator dungeon = new DungeonGenerator(newDungeon.seed,newDungeon.gridWidth,newDungeon.gridHeight,newDungeon.numRooms,newDungeon.minRoomSize,newDungeon.maxRoomSize);
    gridUI.grid.CreateGrid(CreateData(newDungeon.gridWidth + newDungeon.maxRoomSize + 1,newDungeon.gridHeight + newDungeon.maxRoomSize + 1),"null");
    dungeon.Generate();
    onEditor = true;
    onNewFile = false;
    onNewDungeon = false;
    onMenu = false;
    
  }
  
}
