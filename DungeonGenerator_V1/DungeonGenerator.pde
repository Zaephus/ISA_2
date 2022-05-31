
import java.util.Map;

enum TileType {WALL,CORRIDOR,ROOM}

class DungeonGenerator {
  
  int seed = 7415;
  
  int gridWidth = 30;
  int gridHeight = 30;
  
  int spaceBetweenRooms = 3;
  
  int numRooms = 6;
  int minRoomSize = 4;
  int maxRoomSize = 7;
  
  Grid grid;
  
  ArrayList<Room> roomList = new ArrayList<Room>();
  
  HashMap<PVector,TileType> dungeon = new HashMap<PVector,TileType>(gridWidth*gridHeight);
  
  DungeonGenerator() {}
  
  void Generate() {
    
    grid = new Grid(0,0,25,gridWidth + maxRoomSize + 1,gridHeight+maxRoomSize + 1); //<>//
    grid.GridCreate(); //<>//
    
    GetSeed(); //<>//
    AllocateRooms(); //<>//
    ConnectRooms(); //<>//
    AllocateWalls(); //<>//
    SpawnDungeon(); //<>//
    
  }
  
  void Display() {
    grid.Display();
  }
  
  void GetSeed() {
    
    if(seed == 0) {
      seed = int(random(1000,9999));
    }
    randomSeed(seed);
    println(seed);
    
  }
  
  void AllocateRooms() {
    
    int safety = 0;
    
    for(int i = 0; i < numRooms; i++) {
      
      safety++;
      
      int minX = int(random(0,gridWidth)) + 1;
      int maxX = minX + int(random(minRoomSize,maxRoomSize));
      
      int minY = int(random(0,gridHeight)) + 1;
      int maxY = minY + int(random(minRoomSize,maxRoomSize));
      
      Room room = new Room(minX,maxX,minY,maxY);
      
      if(CanRoomFit(room)) {
        AddRoom(room);
      }
      else if(safety <= (numRooms*100)) {
        i--;
      }
      
    }
  
  }
  
  void AddRoom(Room room) {
    
    for(int x = room.minX; x <= room.maxX; x++) {
      for(int y = room.minY; y <= room.maxY; y++) {
        dungeon.put(new PVector(x,y),TileType.ROOM);
      }
    }
    
    roomList.add(room);
    
  }
  
  boolean CanRoomFit(Room room) {
    
    for(int x = room.minX-spaceBetweenRooms; x <= room.maxX+spaceBetweenRooms; x++) {
      for(int y = room.minY-spaceBetweenRooms; y <= room.maxY+spaceBetweenRooms; y++) {
        if(dungeon.containsKey(new PVector(x,y))) {
          return false;
        }
      }
    }
    
    return true;
    
  }
  
  void ConnectRooms() {
    
    for(int i = 0; i < roomList.size(); i++) {
      
      Room roomOne = roomList.get(i);
      
      for(int j = 0; j < roomList.size(); j++) {
        
        if(j == i) {
          continue;
        }
        
        Room roomTwo = roomList.get(j);
        
        if(CanConnectRooms(roomOne,roomTwo)) {
          if(roomTwo.GetCenter().x < roomOne.minX || roomTwo.GetCenter().x > roomOne.maxX || roomTwo.GetCenter().y < roomOne.minY || roomTwo.GetCenter().y > roomOne.maxY) {
            if(!roomOne.connectedRooms.contains(roomTwo) && !roomTwo.connectedRooms.contains(roomOne)) {
              AllocateCorridors(roomOne,roomTwo);
            }
          }
          else {
            AllocateCorridors(roomOne,roomTwo);
          }
        }
        
      }
      
    }
    
    for(int i = 0; i < roomList.size(); i++) {
      
      Room room = roomList.get(i);
      
      if(room.connectedRooms.size() == 0) {
        
        roomList.remove(room);
        
        for(int x = room.minX; x <= room.maxX; x++) {
          for(int y = room.minY; y <= room.maxY; y++) {
            dungeon.remove(new PVector(x,y));
          }
        }
        
      }
      
    }
  
  }
  
  void AllocateCorridors(Room roomOne,Room roomTwo) {
    
    PVector posOne = roomOne.GetCenter();
    PVector posTwo = roomTwo.GetCenter();
    
    roomOne.connectedRooms.add(roomTwo);
    roomTwo.connectedRooms.add(roomOne);
    
    int dirX = posTwo.x > posOne.x ? 1 : -1;
    int x = 0;
    for(x = int(posOne.x); x != posTwo.x; x += dirX) {
      PVector pos = new PVector(x,posOne.y);
      if(dungeon.containsKey(pos)) {
        continue;
      }
      dungeon.put(pos,TileType.CORRIDOR);
    }
    
    int dirY = posTwo.y > posOne.y ? 1 : -1;
    for(int y = int(posOne.y); y != posTwo.y; y += dirY) {
      PVector pos = new PVector(x,y);
      if(dungeon.containsKey(pos)) {
        continue;
      }
      dungeon.put(pos,TileType.CORRIDOR);
    }
  
  }
  
  boolean CanConnectRooms(Room roomOne, Room roomTwo) {
    
    PVector posOne = roomOne.GetCenter();
    PVector posTwo = roomTwo.GetCenter();
    
    int corridorBuffer = 3;
    
    int dirX = posTwo.x > posOne.x ? 1 : -1;
    int x = 0;
    for(x = int(posOne.x); x != posTwo.x; x += dirX) {
      PVector pos = new PVector(x,posOne.y);
      if(dungeon.containsKey(pos)) {
        if(dungeon.get(pos) == TileType.ROOM) {
          if(!roomOne.IsPointInRoom(pos) && !roomTwo.IsPointInRoom(pos)) {
            return false;
          }
        }
      }
      for(int i = -corridorBuffer; i <= corridorBuffer; i++) {
        PVector newPos = new PVector(x,posOne.y+i);
        if(dungeon.containsKey(newPos)) {
          if(dungeon.get(newPos) == TileType.CORRIDOR) {
            return false;
          }
        }
      }
    }
    
    int dirY = posTwo.y > posOne.y ? 1 : -1;
    for(int y = int(posOne.y); y != posTwo.y; y += dirY) {
      PVector pos = new PVector(x,y);
      if(dungeon.containsKey(pos)) {
        if(dungeon.get(pos) == TileType.ROOM) {
          if(!roomOne.IsPointInRoom(pos) && !roomTwo.IsPointInRoom(pos)) {
            return false;
          }
        }
      }
      for(int i = -corridorBuffer; i <= corridorBuffer; i++) {
        PVector newPos = new PVector(x+i,y);
        if(dungeon.containsKey(pos)) {
          if(dungeon.get(newPos) == TileType.CORRIDOR) {
            return false;
          }
        }
      }
    }
    
    return true;
  
  }
  
  void AllocateWalls() {
    
    ArrayList<PVector> walls = new ArrayList<PVector>();
    
    for(Map.Entry<PVector,TileType> entry : dungeon.entrySet()) {
      for(int x = -1; x <= 1; x++) {
        for(int y = -1; y <= 1; y++) {
          PVector pos = PVector.add(entry.getKey(),new PVector(x,y));
          if(dungeon.containsKey(pos)) {
            continue;
          }
          walls.add(pos);
        }
      }
    }
    
    for(PVector w : walls) {
      dungeon.put(w,TileType.WALL);
    }
    
  }
  
  void SpawnDungeon() {
      
    for(Map.Entry<PVector,TileType> entry : dungeon.entrySet()) {
      
      switch(entry.getValue()) {
        
        case CORRIDOR:
          grid.tiles[int(entry.getKey().x)][int(entry.getKey().y)].SetState(0);
          break;
        
        case WALL:
          grid.tiles[int(entry.getKey().x)][int(entry.getKey().y)].SetState(3);
          break;
          
        case ROOM:
          grid.tiles[int(entry.getKey().x)][int(entry.getKey().y)].SetState(1);
          break;
          
      }
  
    }
    
  }
  
}
