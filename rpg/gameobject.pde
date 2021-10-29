abstract class GameObject {
  PVector loc, vel;
  float hp, sz;
  
  abstract void render();
  
  void act() {
    this.loc.add(this.vel);
  }
}
