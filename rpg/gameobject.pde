abstract class GameObject {
  PVector loc, vel;
  float hp, w, h;
  
  abstract void render();
  
  void act() {
    this.loc.add(this.vel);
  }
}
