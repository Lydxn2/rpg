class Darkness extends GameObject {
  float range;
  Darkness(float x, float y, float sz) {
    this.loc = new PVector(x, y);
    this.sz = sz;
    this.range = 1;
  }
  
  void render() {
    this.range = min(this.range + 5 + 50 / this.range, 500);
    
    float heroDist = dist(hero.loc.x, hero.loc.y, this.loc.x, this.loc.y);
    noStroke();
    fill(BLACK, map(heroDist, 0, this.range, 0, 255));
    square(this.loc.x, this.loc.y, this.sz);
  }
}
