class Door extends GameObject {
  final static float DOOR_SIZE = Room.GRID_SIZE * 4;
  
  float w, h;
  int type;
  
  Door(float x, float y, float w, float h, int type) {
    this.loc = new PVector(x, y);
    this.w = w;
    this.h = h;
    this.type = type;
  }
  
  void render() { //<>//
    fill(#56A86C);
    noStroke();
    rect(this.loc.x, this.loc.y, this.w, this.h);
  }
  
  boolean isTouching(Hero hero) {
    return isRectIntersect(
      // give hero slightly larger hitbox to doors
      hero.loc.x - hero.sz / 2, hero.loc.y - hero.sz / 2, hero.sz, hero.sz,
      this.loc.x, this.loc.y, this.w, this.h);
  }
}
