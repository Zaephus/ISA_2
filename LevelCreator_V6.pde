
Menu M;

GridUI GUI;

TextBox t[];
HorSlider hSlider[];

boolean Grid = false;
boolean Menu = true;

boolean MousePressedThisFrame;
boolean MouseReleasedThisFrame;
boolean MousePrevState;

int BackgroundR,BackgroundG,BackgroundB = 0;

void setup() {
  
  size(1500,900);
  surface.setTitle("LevelCreator V6");
  
  noStroke();
  
  M = new Menu();
  
  GUI = new GridUI(0,height-200,width,200);
  
}

void draw() {
  
  background(BackgroundR,BackgroundG,BackgroundB);
  
  if(Menu) {
    M.Display();
  }
  
  if(Grid) {
    BackgroundR = BackgroundG = BackgroundB = 0;
    GUI.Display();
  }
  
  if(MousePrevState != mousePressed) {
    if(mousePressed) {
      MousePressedThisFrame = true;
    }
    else {
      MouseReleasedThisFrame = true;
    }
  }
  else {
    MousePressedThisFrame = false;
    MouseReleasedThisFrame = false;
  }
  MousePrevState = mousePressed;
  
}

void keyPressed() {
  
  GUI.G.setMove(key,true);
  
  for(int i = 0; i < t.length; i++) {
    if(key != CODED) {
      if(t[i].Focused) {
        if(key == BACKSPACE) {
          if(t[i].Input.length() > 0) {
            t[i].Input = t[i].Input.substring(0,t[i].Input.length()-1);
          }
        }
        else if(key == ENTER) {
          t[i].Focused = false;
        }
        else {
          t[i].Input += key;
        }
      }
    }
  }

}

void keyReleased() {
  
  GUI.G.setMove(key,false);
  
}

void mousePressed() {
  
  for(int i = 0; i < hSlider.length; i++) {
    if(hSlider[i].IsOver()) {
      hSlider[i].Lock = true;
    }
  }
  
}

void mouseReleased() {
  
  for(int i = 0; i < hSlider.length; i++) {
    hSlider[i].Lock = false;
  }
  
}

Table DataCreate(int AmountX,int AmountY) {
  
  Table Data = new Table();
  
  Data.addColumn("x");
  Data.addColumn("y");
  
  Data.setInt(0,"x",AmountX);
  Data.setInt(0,"y",AmountY);
  
  for(int i = 2; i < AmountX+2; i++) {
    Data.addColumn(str(i-1));
  }
  for(int j = 0; j < AmountY; j++) {
    Data.addRow();
    for(int i = 2; i < AmountX+2; i++) {
      Data.setInt(j,str(i-1),0);
    }
  }
  
  return Data;
  
}

void FileSave(File selection) {
  
  if(selection == null) {
    println("pech");
  }
  else {
    String temp = selection.getAbsolutePath();
    println(temp.length(),temp);
    if(temp.indexOf(".tsv") >= 0) {  
      GUI.G.Save(temp);
      GUI.G.SetCurrentPath(temp);
    }
    else {
      GUI.G.Save(temp+".tsv");
      GUI.G.SetCurrentPath(temp+".tsv");
    }
  }
  
}

void FileLoad(File selection) {
  
  try {
    if(selection == null) {
      println("pech");
    }
    else {
      Table Temp = loadTable(selection.getAbsolutePath(),"header");
      GUI.G.GridCreate(Temp,selection.getPath());
    }
  }
  catch(Exception e) {
    println("Error: "+e.getMessage());
  }
  
}
