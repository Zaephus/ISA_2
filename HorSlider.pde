

class HorSlider {
  
  final float xMin;
  final float xMax;
  
  float PosX;
  float PosY;
  
  float Width;
  float Height;
  
  String Act = "";
  
  float Value;
  
  float MinValue;
  float MaxValue;
  
  boolean Lock = false;
  
  HorSlider(float xmin,float xmax,float sx,float y,float w,float h,String act,float vmin,float vmax) {
    
    xMin = xmin;
    xMax = xmax;
    
    PosX = sx;
    PosY = y;
    
    Width = w;
    Height = h;
    
    Act = act;
    
    MinValue = vmin;
    MaxValue = vmax;
    
  }

  void Display() {
    
    Value = map(PosX,xMin,xMax-Width,MinValue,MaxValue);
    
    noStroke();
    
    fill(165);
    rect(xMin,PosY,xMax-xMin,Height/2);
    rect(xMin,PosY-(Height/2),Height*3,Height/2);
    
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(Height*0.4);
    text(Act+": "+int(Value)+"%",xMin+(3*(Height/2)),PosY-(Height/4));
    
    rect(xMin+(Height/4),PosY+(5*(Height/24)),(xMax-xMin)-(Height/2),Height/12);
    
    stroke(0);
    fill(165);
    rect(PosX,PosY,Width,Height);
    noStroke();
    
    if(Lock) {
      PosX = constrain(mouseX,xMin,xMax-Width);
      Action();
    }
    
  }
  
  boolean IsOver() {
    
    return (PosX+Width >= mouseX) && (mouseX >= PosX) && (PosY+Height >= mouseY) && (mouseY >= PosY);
    
  }
  
  void Action() {
    
    if(Act == "Zoom") {
      GUI.G.Scale = map(Value,MinValue,MaxValue,MinValue/100,MaxValue/100);
    }
    
  }
  
}
