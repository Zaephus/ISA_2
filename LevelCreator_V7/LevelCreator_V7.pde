
Menu menu;

GridUI gridUI;

TextBox t[];
HorSlider hSlider[];

boolean onEditor = false;
boolean onMenu = true;

boolean mousePressedThisFrame;
boolean mouseReleasedThisFrame;
boolean mousePreviousState;

int backgroundR,backgroundG,backgroundB = 0;

void setup() {
  
  size(1500,1000);
  surface.setTitle("LevelCreator V7");
  
  noStroke();
  
  menu = new Menu();
  
  gridUI = new GridUI(0,height-200,width,200);
  
}

void draw() {
  
  background(backgroundR,backgroundG,backgroundR);
  
  if(onMenu) {
    menu.Display();
  }
  
  if(onEditor) {
    backgroundR = backgroundG = backgroundB = 0;
    gridUI.Display();
  }
  
  if(mousePreviousState != mousePressed) {
    if(mousePressed) {
      mousePressedThisFrame = true;
    }
    else {
      mouseReleasedThisFrame = true;
    }
  }
  else {
    mousePressedThisFrame = false;
    mouseReleasedThisFrame = false;
  }
  mousePreviousState = mousePressed;
  
}

void keyPressed() {
  
  gridUI.grid.SetTileMove(key,true);
  
  for(int i = 0; i < t.length; i++) {
    if(key != CODED) {
      if(t[i].isFocused) {
        if(key == BACKSPACE) {
          if(t[i].input.length() > 0) {
            t[i].input = t[i].input.substring(0,t[i].input.length()-1);
          }
        }
        else if(key == ENTER) {
          t[i].isFocused = false;
        }
        else {
          t[i].input += key;
        }
      }
    }
  }
  
}

void keyReleased() {
  gridUI.grid.SetTileMove(key,false);
}

void mousePressed() {
  for(int i = 0; i < hSlider.length; i++) {
    if(hSlider[i].IsOver()) {
      hSlider[i].isLocked = true;
    }
  }
}

void mouseReleased() {
  for(int i = 0; i < hSlider.length; i++) {
    hSlider[i].isLocked = false;
  }
}

Table CreateData(int amountX,int amountY) {
  
  Table data = new Table();
  
  data.addColumn("x");
  data.addColumn("y");
  
  data.setInt(0,"x",amountX);
  data.setInt(0,"y",amountY);
  
  for(int i = 2; i < amountX + 2; i++) {
    data.addColumn(str(i-1));
  }
  for(int j = 0; j < amountY; j++) {
    data.addRow();
    for(int i = 2; i < amountX + 2; i++) {
      data.setInt(j,str(i-1),0);
    }
  }
  
  return data;
  
}

void SaveFile(File selection) {
  
  if(selection == null) {
    println("pech");
  }
  else {
    String temp = selection.getAbsolutePath();
    println(temp.length(),temp);
    if(temp.indexOf(".tsv") >= 0) {
      gridUI.grid.Save(temp);
      gridUI.grid.SetCurrentPath(temp);
    }
    else {
      gridUI.grid.Save(temp + ".tsv");
      gridUI.grid.SetCurrentPath(temp + ".tsv");
    }
  }
  
}

void LoadFile(File selection) {
  
  try {
    if(selection == null) {
      println("pech");
    }
    else {
      Table temp = loadTable(selection.getAbsolutePath(),"header");
      gridUI.grid.CreateGrid(temp,selection.getPath());
    }
  }
  catch(Exception e) {
    println("Error: " + e.getMessage());
  }
  
}
