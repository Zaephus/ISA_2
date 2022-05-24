

class GridUI {
  
  float PosX;
  float PosY;
  
  float Width;
  float Height;
  
  Grid G;
  
  Button Buttons[] = new Button[3];
  
  Toggle Toggles[] = new Toggle[4];
  
  GridUI(float x,float y,float w,float h) {
    
    PosX = x;
    PosY = y;
    
    Width = w;
    Height = h;
  
    G = new Grid(0,0,50);
    
    Buttons[0] = new Button(Width-(Height-40)-20,PosY+20,Height-40,Height-40,"Menu","Menu");
    Buttons[1] = new Button(Width-(2*(Height-40))-40,PosY+20,Height-40,Height-40,"Save As","Save As");
    Buttons[2] = new Button(Width-(3*(Height-40))-60,PosY+20,Height-40,Height-40,"Save","Save");
    
    Toggles[0] = new Toggle(PosX+10,PosY+10,(Height-30)/2,(Height-30)/2,"1");
    Toggles[1] = new Toggle(PosX+10,PosY+5+(Height/2),(Height-30)/2,(Height-30)/2,"3");
    Toggles[2] = new Toggle(PosX+((Height-30)/2)+20,PosY+10,(Height-30)/2,(Height-30)/2,"2");
    Toggles[3] = new Toggle(PosX+((Height-30)/2)+20,PosY+5+(Height/2),(Height-30)/2,(Height-30)/2,"4");
  
    hSlider = new HorSlider[1];
    
    hSlider[0] = new HorSlider(PosX+225,PosX+725,PosX+375,PosY+30,20,40,"Zoom",10,300);
    //hSlider[1] = new HorSlider(PosX+225,PosX+725,PosX+475,PosY+100,20,40,0,100);
    
  }
  
  void Display() {
    
    G.Display();
    
    fill(222);
    noStroke();
    rect(PosX,PosY,Width,Height);
    
    for(int i = 0; i < Buttons.length; i++) {
      Buttons[i].Display();
    }
    
    for(int i = 0; i < Toggles.length; i++) {
      Toggles[i].Display();
      for(int j = 0; j < Toggles.length; j++) {
        if(i == j) {
          continue;
        }
        if(!Toggles[i].CanChange) {
          Toggles[j].Activate = false;
        }
      }
    }
    
    for(int i = 0; i < hSlider.length; i++) {
      hSlider[i].Display();
    }
    
  }
  
}
