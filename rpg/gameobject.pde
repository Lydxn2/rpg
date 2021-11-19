abstract class GameObject {
  PVector loc, vel;
  int roomR, roomC;
  float maxhp, hp, w, h;
  
  abstract void render();
  
  void act() {
    this.loc.add(this.vel);
  }
  
  boolean inRoomWith(GameObject obj) {
    return this.roomR == obj.roomR && this.roomC == obj.roomC;
  }
  
  void setDimensions(float w, float h) {
    this.w = w;
    this.h = h;
  }
  
  void changeHP(int hp) {
    this.hp += hp;
  }
  
  void resetHP(int hp) {
    this.maxhp = this.hp = hp;
  }
}
