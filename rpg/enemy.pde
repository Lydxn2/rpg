class Enemy extends GameObject {
  int sr, sc, alpha;
  float atk, speed;
  HealthBar hpbar;
  
  Enemy(int sr, int sc, float x, float y) {
    this.sr = sr;
    this.sc = sc;

    this.loc = new PVector(x, y);
    this.vel = new PVector(0, 0);
    
    this.alpha = 255;
    this.hpbar = new HealthBar(this);
  }

  void render() {
    this.alpha = min(255, this.alpha + 30);
    this.hpbar.render();
  }
  
  void takeDamage(float atk) {
    this.hp = max(0, this.hp - atk);
    this.alpha = 10;
  }
  
  void setATK(float atk) {
    this.atk = atk;
  }
  
  void setSpeed(float speed) {
    this.speed = speed;
  }
}
