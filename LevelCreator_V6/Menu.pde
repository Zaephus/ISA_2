

class Menu {
  
  boolean NewFile = false;
    
  Button Buttons[] = new Button[3];
  
  NewFile nFile;
  
  Menu() {
    
    Buttons[0] = new Button(width-150,height-150,100,100,"Exit","Exit");
    Buttons[1] = new Button(50,height-150,100,100,"New File","New File");
    Buttons[2] = new Button(200,height-150,100,100,"Load","Load");
    
    nFile = new NewFile((width/2)-200,(height/2)-200,400,400);
    
  }
  
  void Display() {
    
    BackgroundR = BackgroundG = BackgroundB = 222;
    
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(100);
    text("Level Creator",width/2,height/3);
    
    for(int i = 0; i < Buttons.length; i++) {
      Buttons[i].Display();
    }
    
    if(NewFile) {
      nFile.Display();
    }
    
  }
  
  void GridCreate(Table temp) {
    
    GUI.G.GridCreate(temp,"null");
    Grid = true;
    NewFile = false;
    Menu = false;
    
  }
  
}
