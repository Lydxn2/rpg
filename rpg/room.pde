class Room {
  final static float DIM = 700;
  final static int NUM_GRIDS = 20;
  final static float GRID_SIZE = DIM / NUM_GRIDS;
  final static float BORDER_SIZE = 20;
  
  ArrayList<Door> doors;
  int r, c;
  
  Room(int r, int c, int doorMask) {
    this.r = r;
    this.c = c;
    this.doors = new ArrayList<Door>();

    // up door
    if ((doorMask & 1) != 0)
      this.doors.add(new Door((width - Door.DOOR_SIZE) / 2, roomOfsY - BORDER_SIZE, Door.DOOR_SIZE, BORDER_SIZE, 0));
    // down door
    if ((doorMask & 2) != 0)
      this.doors.add(new Door((width - Door.DOOR_SIZE) / 2, height - roomOfsY, Door.DOOR_SIZE, BORDER_SIZE, 1));
    // left door
    if ((doorMask & 4) != 0)
      this.doors.add(new Door(roomOfsX - BORDER_SIZE, (height - Door.DOOR_SIZE) / 2, BORDER_SIZE, Door.DOOR_SIZE, 2));
    // right door
    if ((doorMask & 8) != 0)
      this.doors.add(new Door(width - roomOfsX, (height - Door.DOOR_SIZE) / 2, BORDER_SIZE, Door.DOOR_SIZE, 3));
  }
  
  void render() {
    // fill room with checker pattern
    for (int i = 0; i < NUM_GRIDS; i++) {
      for (int j = 0; j < NUM_GRIDS; j++) {
        fill((i + j) % 2 == 0 ? #808080 : #9C9C9C);
        noStroke();
        square(roomOfsX + i * GRID_SIZE, roomOfsY + j * GRID_SIZE, GRID_SIZE);
      }
    }
    
    // form the border
    rectMode(CORNER);
    stroke(#666666); strokeWeight(BORDER_SIZE);
    noFill();
    square(roomOfsX - BORDER_SIZE / 2, roomOfsY - BORDER_SIZE / 2, DIM + BORDER_SIZE);
    
    // draw doors
    for (Door d : this.doors)
      d.render();
  }
}
