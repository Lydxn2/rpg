class Room {
  final static int DIM = 700;
  final static int NUM_GRIDS = 20;
  final static int GRID_SIZE = DIM / NUM_GRIDS;
  final static int BORDER_SIZE = 15;
  
  ArrayList<Door> doors;
  int locR, locC;
  float ofsX, ofsY;
  
  Room(int locR, int locC, int doorMask) {
    this.locR = locR;
    this.locC = locC;
    this.doors = new ArrayList<Door>();
    
    this.ofsX = (width - DIM) / 2.0;
    this.ofsY = (height - DIM) / 2.0;
    
    // up door
    if ((doorMask & 1) != 0)
      this.doors.add(new Door((width - Door.DOOR_SIZE) / 2, ofsY - BORDER_SIZE, Door.DOOR_SIZE, BORDER_SIZE, 0));
    // down door
    if ((doorMask & 2) != 0)
      this.doors.add(new Door((width - Door.DOOR_SIZE) / 2, height - ofsY, Door.DOOR_SIZE, BORDER_SIZE, 1));
    // left door
    if ((doorMask & 4) != 0)
      this.doors.add(new Door(ofsX - BORDER_SIZE, (height - Door.DOOR_SIZE) / 2, BORDER_SIZE, Door.DOOR_SIZE, 2));
    // right door
    if ((doorMask & 8) != 0)
      this.doors.add(new Door(width - ofsX, (height - Door.DOOR_SIZE) / 2, BORDER_SIZE, Door.DOOR_SIZE, 3));
  }
  
  void render() {
    // form the border
    rectMode(CORNER);
    fill(#808080);
    noStroke();
    square(this.ofsX - BORDER_SIZE, this.ofsY - BORDER_SIZE, DIM + 2 * BORDER_SIZE);
    
    // fill room with checker pattern
    for (int i = 0; i < NUM_GRIDS; i++) {
      for (int j = 0; j < NUM_GRIDS; j++) {
        fill((i + j) % 2 == 0 ? #808080 : #9C9C9C);
        noStroke();
        square(this.ofsX + i * GRID_SIZE, this.ofsY + j * GRID_SIZE, GRID_SIZE);
      }
    }
    
    // draw doors
    for (Door d : this.doors)
      d.render();
  }
}
