class Lurker extends Enemy {
  Lurker(int sr, int sc, float x, float y) {
    super(sr, sc, x, y);
    this.resetHP(300);
    this.setDimensions(40, 40);
  }

  void act() {
    this.vel = new PVector(1, 0);
    this.vel.rotate(atan2(hero.loc.y - this.loc.y, hero.loc.x - this.loc.x));
    super.act();
  }
  
  void render() {
    fill(#FF0000, alpha);
    stroke(#960000, alpha); strokeWeight(5);
    circle(this.loc.x, this.loc.y, this.w);
    
    super.render();
  }
}
