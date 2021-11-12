class Bullet extends GameObject {
  Weapon weapon;
  PImage img;
  PVector initLoc;

  float range;
  float ang;
  
  Bullet(Weapon weapon, String imgPath, float ang) {
    float nx = weapon.owner.loc.x + cos(ang) * weapon.owner.w;
    float ny = weapon.owner.loc.y + sin(ang) * weapon.owner.h;
    
    this.weapon = weapon;
    this.img = loadImage(imgPath);
    
    this.initLoc = new PVector(nx, ny);
    this.loc = new PVector(nx, ny);
    
    this.vel = new PVector(1, 0);
    this.vel.rotate(ang);
    
    this.ang = ang;
    
    this.hp = 1;
  }
  
  void act() {
    this.loc.add(this.vel);
    
    if (this.loc.dist(this.initLoc) > range)
      this.hp = 0;
    if (!isRectIntersect(this.loc.x, this.loc.y, this.w, this.h, roomOfsX, roomOfsY, Room.DIM, Room.DIM))
      this.hp = 0;
  }
  
  void render() {
    pushMatrix();
    translate(this.loc.x, this.loc.y);
    rotate(this.ang);
    image(this.img, 0, 0, this.w, this.h);
    popMatrix();
  }
  
  void setSize(float w, float h) {
    this.w = w;
    this.h = h;
  }
  
  void setRange(float range) {
    this.range = range;
  }
  
  void setVelocity(float vel) {
    this.vel.setMag(vel);
  }
}
