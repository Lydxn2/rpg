class Hero extends GameObject {
  final static float MAX_SPEED = 7;
  final static float ACCEL = 1;
  final static float FRICTION = 0.9;
  
  public Hero(int w, int h) {
    this.loc = new PVector(w, h);
    this.vel = new PVector(0, 0);
    this.sz = 50;
  }
  
  void act() {
    super.act();
    
    if (keyUp) this.vel.y -= ACCEL;
    if (keyLeft) this.vel.x -= ACCEL;
    if (keyDown) this.vel.y += ACCEL;
    if (keyRight) this.vel.x += ACCEL;

    // set boundaries
    float leftX = (width - Room.DIM) / 2.0;
    float rightX = (width + Room.DIM) / 2.0;
    float upY = (height - Room.DIM) / 2.0;
    float downY = (height + Room.DIM) / 2.0;
    if (this.loc.x <= leftX + this.sz / 2)  this.loc.x = leftX + this.sz / 2;
    if (this.loc.x >= rightX - this.sz / 2) this.loc.x = rightX - this.sz / 2;
    if (this.loc.y <= upY + this.sz / 2)   this.loc.y = upY + this.sz / 2;
    if (this.loc.y >= downY - this.sz / 2)   this.loc.y = downY - this.sz / 2;
    
    // constrain speed when moving diagonally
    if (this.vel.mag() > MAX_SPEED)
      this.vel.setMag(MAX_SPEED);
    
    // emulate deceleration
    this.vel.setMag(this.vel.mag() * FRICTION);
  }
  
  void render() {
    fill(#86FF73);
    stroke(#71C464); strokeWeight(6);
    circle(this.loc.x, this.loc.y, this.sz);
  }
}
