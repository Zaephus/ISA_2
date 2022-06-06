
int backgroundR,backgroundG,backgroundB = 0; //<>//

//Grid grid;
DungeonGenerator d; //<>//

void setup() {
  
  size(1500,1000);
  surface.setTitle("DungeonGenerator V1");
  
  PVector a = new PVector(1,8);
  PVector b = new PVector(1,8);
  
  noStroke();
  
  //grid = new Grid(10,10,25,30,30);
  //grid.GridCreate();
  
  d = new DungeonGenerator(); //<>//
  d.Generate(); //<>//
  
}

void draw() {
  
  //background(backgroundR,backgroundG,backgroundR);
  background(60);
  
  //grid.Display();
  
  d.Display();
  
}
