

class Room {
  
  int minX;
  int maxX;
  
  int minY;
  int maxY;
  
  ArrayList<Room> connectedRooms = new ArrayList<Room>();
  
  Room(int xMin,int xMax,int yMin,int yMax) {
    minX = xMin;
    maxX = xMax;
    minY = yMin;
    maxY = yMax;
  }
  
  PVector GetCenter() {
    return new PVector(int(lerp(minX,maxX,0.5)),int(lerp(minY,maxY,0.5)));
  }
  
  PVector GetRandomTile() {
    return new PVector(int(random(minX,maxX+1)),int(random(minY,maxY+1)));
  }
  
  boolean IsPointInRoom(PVector point) {
    return point.x >= minX-1 && point.x <= maxX+1 && point.y >= minY-1 && point.y <= maxY+1;
  }
  
}
