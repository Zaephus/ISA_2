

class GridUI {
  
  float posX;
  float posY;
  
  float uiWidth;
  float uiHeight;
  
  Grid grid;
  
  Button buttons[] = new Button[3];
  Toggle toggles[] = new Toggle[4];
  
  GridUI(float x,float y,float w,float h) {
    
    posX = x;
    posY = y;
    
    uiWidth = w;
    uiHeight = h;
    
    grid = new Grid(0,0,50);
    
    buttons[0] = new Button(uiWidth - (uiHeight - 40) - 20,posY + 20, uiHeight - 40, uiHeight - 40,"Menu","Menu");
    buttons[1] = new Button(uiWidth - (2*(uiHeight - 40)) - 40,posY + 20,uiHeight - 40,uiHeight - 40,"Save As","Save As");
    buttons[2] = new Button(uiWidth - (3*(uiHeight - 40)) - 60,posY + 20,uiHeight - 40, uiHeight -40,"Save","Save");
    
    toggles[0] = new Toggle(posX + 10,posY + 10,(uiHeight - 30)/2,(uiHeight - 30)/2,"1");
    toggles[1] = new Toggle(posX + 10,posY + 5 + (uiHeight/2),(uiHeight - 30)/2,(uiHeight - 30)/2,"3");
    toggles[2] = new Toggle(posX + ((uiHeight - 30)/2) + 20,posY + 10,(uiHeight - 30)/2,(uiHeight - 30)/2,"2");
    toggles[3] = new Toggle(posX + ((uiHeight - 30)/2) + 20,posY + 5 + (uiHeight/2),(uiHeight - 30)/2,(uiHeight - 30)/2,"4");
    
    hSlider = new HorSlider[1];
    
    hSlider[0] = new HorSlider(posX + 225,posX + 725,posX + 375,posY + 30,20,40,"Zoom",10,300);
    
  }
  
  void Display() {
    
    grid.Display();
    
    fill(222);
    noStroke();
    rect(posX,posY,uiWidth,uiHeight);
    
    for(int i = 0; i < buttons.length; i++) {
      buttons[i].Display();
    }
    
    for(int i = 0; i < toggles.length; i++) {
      toggles[i].Display();
      for(int j = 0; j < toggles.length; j++) {
        if(i == j) {
          continue;
        }
        if(!toggles[i].canChange) {
          toggles[j].isActivated = false;
        }
      }
    }
    
    for(int i = 0; i < hSlider.length; i++) {
      hSlider[i].Display();
    }
    
  }
  
}
