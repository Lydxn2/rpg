class Enemy extends GameObject {
  int alpha;
  float atk, speed;
  HealthBar hpbar;
  
  Enemy(int roomR, int roomC, float x, float y) {
    this.roomR = roomR;
    this.roomC = roomC;

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
