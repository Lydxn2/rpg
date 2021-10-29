class Particle extends GameObject {

  float fade, alpha;
  color col;

  Particle(float x, float y, color col, float fade) {
    this.loc = new PVector(x, y);
    this.vel = new PVector(1, 0);
    this.col = col;
    this.hp = this.fade = fade;
    
    this.vel.setMag(random(5, 10));
    this.vel.rotate(random(0, TAU));
  }
  
  void act() {
    if (this.hp != 0)
      this.hp -= 2;
    super.act();
  }
  
  void render() {
    noStroke();
    fill(this.col, this.hp * 255 / this.fade);
    square(this.loc.x, this.loc.y, 10);
  }
}
