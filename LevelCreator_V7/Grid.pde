

class Grid extends Tile {
  
  float posX;
  float posY;
  
  int amountX;
  int amountY;
  
  float tileSize;
  
  float scale = 1;
  
  String currentPath = "null";
  
  Tile tiles[][];
  
  Table data = new Table();
  
  Grid(float x,float y,float s) {
    posX = x;
    posY = y;
    
    tileSize = s;
  }
  
  void CreateGrid(Table map,String path) {
    
    SetCurrentPath(path);
    
    amountX = map.getInt(0,"x");
    amountY = map.getInt(0,"y");
    
    data = map;
    
    tiles = new Tile[amountX][amountY];
    
    for(int i = 0; i < amountX; i++) {
      for(int j = 0; j < amountY; j++) {
        tiles[i][j] = new Tile((i*tileSize) + posX,(j*tileSize) + posY,tileSize,tileSize);
        tiles[i][j].SetState(map.getInt(j,str(i+1)));
      }
    }
    
  }
  
  void Display() {
    
    for(int i = 0; i < amountX; i++) {
      for(int j = 0; j < amountY; j++) {
        data.setInt(j,str(i+1),tiles[i][j].GetState());
        tiles[i][j].Display(scale);
      }
    }
    
  }
  
  void SetCurrentPath(String path) {
    currentPath = path;
  }
  
  void SetTileMove(char k,boolean b) {
    for(int i = 0; i < amountX; i++) {
      for(int j = 0; j < amountY; j++) {
        tiles[i][j].SetMove(k,b);
      }
    }
  }
  
  void Save(String temp) {
    
    if(temp == "null") {
      SaveAs();
    }
    else {
      saveTable(data,temp);
    }
    
  }
  
  void SaveAs() {
    selectOutput("Save as: ","SaveFile");
  }
  
  void Load() {
    selectInput("Select a map: ","LoadFile");
  }
  
}
