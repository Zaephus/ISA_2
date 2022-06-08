

class HorSlider {
  
  final float minX;
  final float maxX;
  
  float posX;
  float posY;
  
  float sliderWidth;
  float sliderHeight;
  
  String act = "";
  
  float value;
  
  float minValue;
  float maxValue;
  
  boolean isLocked = false;
  
  HorSlider(float xmin,float xmax,float startx,float y,float w,float h,String a,float vmin,float vmax) {
    
    minX = xmin;
    maxX = xmax;
    
    posX = startx;
    posY = y;
    
    sliderWidth = w;
    sliderHeight = h;
    
    act = a;
    
    minValue = vmin;
    maxValue = vmax;
    
  }
  
  void Display() {
    
    value = map(posX,minX,maxX - sliderWidth,minValue,maxValue);
    
    noStroke();
    
    fill(165);
    rect(minX,posY,maxX-minX,sliderHeight/2);
    rect(minX,posY - (sliderHeight/2),sliderHeight*3,sliderHeight/2);
    
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(sliderHeight*0.4);
    text(act + ": " + int(value) + "%",minX + (3*(sliderHeight/2)),posY - (sliderHeight/4));
    
    rect(minX + (sliderHeight/4),posY + (5*(sliderHeight/24)),(maxX-minX) - (sliderHeight/2),sliderHeight/12);
    
    stroke(0);
    fill(165);
    rect(posX,posY,sliderWidth,sliderHeight);
    noStroke();
    
    if(isLocked) {
      posX = constrain(mouseX,minX,maxX - sliderWidth);
      Action();
    }
    
  }
  
  boolean IsOver() {
    return (posX + sliderWidth >= mouseX) && (mouseX >= posX) && (posY + sliderHeight >= mouseY) && (mouseY >= posY);
  }
  
  void Action() {
    if(act == "Zoom") {
      gridUI.grid.scale = map(value,minValue,maxValue,minValue/100,maxValue/100);
    }
  }
  
}
