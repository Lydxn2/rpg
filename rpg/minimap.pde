class Minimap {
  final static float BORDER_SIZE = 10;
  
  boolean[][] isRoom;
  
  Minimap() {
    
  }
  
  void render() {
    fill(#808080);
    square(80, 80, 80);
    for (int i = 0; i < mapRows; i++) {
      for (int j = 0; j < mapCols; j++) {
        float x = i * 80 / mapRows;
      }
    }
  }
  
  void addRoom(int r, int c) {
    isRoom[r][c] = true;
  }
}
