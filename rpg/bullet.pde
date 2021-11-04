class Bullet extends GameObject {
  PImage img;
  PVector initLoc;

  float range;
  float ang;
  
  Bullet(String imgPath, float x, float y, float ang) {
    this.img = loadImage(imgPath);
    
    this.initLoc = new PVector(x, y);
    this.loc = new PVector(x, y);
    
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
