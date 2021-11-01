class Minimap {
  final static float BORDER_SIZE = 10;
  final static float SIZE = 150;
  final static float OFS = 30;
  
  int dims;
  boolean[][] isRoom;
  
  Minimap(int dims) {
    this.dims = dims;
    this.isRoom = new boolean[dims][dims];
  }
  
  void render() {
    noStroke();
    fill(#D6D6D6);

    square(OFS, OFS, SIZE);
    
    float sqSize = (SIZE - BORDER_SIZE * 2) / this.dims;
    for (int i = 0; i < this.dims; i++) {
      for (int j = 0; j < this.dims; j++) {
        fill(this.isRoom[j][i] ? #000000 : #FFFFFF);
        square(OFS + BORDER_SIZE + j * sqSize, OFS + BORDER_SIZE + i * sqSize, sqSize + 1 /* +1 because it fixes weird rendering? */ );
      }
    }

    float heroX = OFS + BORDER_SIZE + roomC * sqSize + map(hero.loc.x, roomOfsX, roomOfsX + Room.DIM, 0, sqSize);
    float heroY = OFS + BORDER_SIZE + roomR * sqSize + map(hero.loc.y, roomOfsY, roomOfsY + Room.DIM, 0, sqSize);
    
    // draw hero on minimap
    fill(RED);
    circle(heroX, heroY, 8);
    
    fill(WHITE);
    textAlign(CENTER, CENTER);
    textFont(monospaceFont, 15);
    text("r=" + (roomR + 1) + ", c=" + (roomC + 1), OFS + SIZE / 2, OFS + SIZE + 10);
    textFont(monospaceFont, 12);
    text("Stats for nerds:", OFS + SIZE / 2, OFS + SIZE + 30);
    text("x=" + heroX + ", y=" + heroY, OFS + SIZE / 2, OFS + SIZE + 45);
  }
  
  void addRoom(int r, int c) {
    this.isRoom[r][c] = true;
  }
}
