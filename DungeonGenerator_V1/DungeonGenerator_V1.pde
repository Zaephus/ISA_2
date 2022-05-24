
int backgroundR,backgroundG,backgroundB = 0; //<>//

//Grid grid;
DungeonGenerator d; //<>//

void setup() {
  
  size(1500,900);
  surface.setTitle("DungeonGenerator V1");
  
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
