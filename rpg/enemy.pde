class Enemy extends GameObject {
  int sr, sc, alpha;
  HealthBar hpbar;
  
  Enemy(int sr, int sc, float x, float y) {
    this.sr = sr;
    this.sc = sc;

    this.loc = new PVector(x, y);
    this.vel = new PVector(0, 0);
    
    this.alpha = 255;
    this.hpbar = new HealthBar(this);
  }

  void act() { super.act(); }
  
  void render() {
    this.alpha = min(255, this.alpha + 30);
    this.hpbar.render();
  }
}
