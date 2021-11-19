class Darkness extends GameObject {
  float range, w, h;
  
  Darkness(float x, float y, float w, float h) {
    this.loc = new PVector(x, y);
    this.w = w;
    this.h = h;
    this.range = 1;
  }
  
  void render() {
    this.range = min(this.range + 5 + 50 / this.range, 500);
    
    float heroDist = dist(hero.loc.x, hero.loc.y, this.loc.x, this.loc.y);
    noStroke();
    fill(BLACK, map(heroDist, 0, this.range, 0, 255));
    rect(this.loc.x, this.loc.y, this.w, this.h);
  }
}
