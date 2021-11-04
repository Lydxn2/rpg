class Door extends GameObject {
  final static float DOOR_SIZE = Room.GRID_SIZE * 4;

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
      hero.loc.x - hero.w / 2, hero.loc.y - hero.h / 2, hero.w, hero.h,
      this.loc.x, this.loc.y, this.w, this.h);
  }
}
