class Projectile extends GameObject {
  GameObject owner;
  
  PImage img;
  PVector initLoc;

  int sr, sc;
  float pw, ph, ang;
  float atk, range;
  
  ArrayList<GameObject> hit;
  
  Projectile(GameObject owner, String imgPath, float w, float h, float ang) {
    this.w = w;
    this.h = h;

    this.roomR = owner.roomR;
    this.roomC = owner.roomC;

    this.owner = owner;
    this.img = loadImage(imgPath);

    this.initLoc = new PVector(owner.loc.x, owner.loc.y);
    this.loc = new PVector(owner.loc.x, owner.loc.y);
    
    this.vel = new PVector(1, 0);
    this.vel.rotate(ang);
    
    this.ang = ang;
    
    this.hit = new ArrayList<GameObject>();
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
  
  void takeDamage(float atk) {
    this.hp = max(0, this.hp - atk);
  }
  
  void setATK(float atk) {
    this.atk = atk;
  }
  
  void setPierce(int pierce) {
    this.hp = pierce;
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
  
  void offsetTo(Weapon weapon) {
    PVector d = new PVector((weapon.w + this.w / 2) * cos(ang), (weapon.w + this.w / 2) * sin(ang));
    this.initLoc.add(d);
    this.loc.add(d);
  }
}
