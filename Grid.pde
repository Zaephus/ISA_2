

class Grid extends Tile {
  
  float PosX;
  float PosY;
  
  int AmountX;
  int AmountY;
  
  float TileSize;
  
  float Scale = 1;
  
  String CurrentPath = "null";
  
  Tile T[][];
  
  Table Data = new Table();
  
  Grid(float x,float y,float s) {
    
    PosX = x;
    PosY = y;
    
    TileSize = s;
    
  }
  
  void GridCreate(Table map,String path) {
    
    SetCurrentPath(path);
    
    AmountX = map.getInt(0,"x");
    AmountY = map.getInt(0,"y");
    
    Data = map;
    
    T = new Tile[AmountX][AmountY];
    
    for(int i = 0; i < AmountX; i++) {
      for(int j = 0; j < AmountY; j++) {
        T[i][j] = new Tile(i*TileSize,j*TileSize,TileSize,TileSize);
        T[i][j].SetState(map.getInt(j,str(i+1)));
      }
    }
    
  }
  
  void Display() {
    
    for(int i = 0; i < AmountX; i++) {
      for(int j = 0; j < AmountY; j++) {
        Data.setInt(j,str(i+1),T[i][j].GetState());
        T[i][j].Display(Scale);
      }
    }
    
  }
  
  void SetCurrentPath(String path) {
    
    CurrentPath = path;
    
  }
  
  void Save(String temp) {
    
    if(temp == "null") {
      SaveAs();
    }
    else {
      saveTable(Data,temp);
    }
    
  }
  
  void setMove(char k,boolean b) {
    
    for(int i = 0; i < AmountX; i++) {
      for(int j = 0; j < AmountY; j++) {
        T[i][j].SetMove(k,b);
      }
    }
    
  }
  
  void SaveAs() {
    
    selectOutput("Save as: ","FileSave");
    
  }
  
  void Load() {
    
    selectInput("Select a map: ","FileLoad");
    
  }
  
}
