class ClassicBullet extends Bullet {
  ClassicBullet(float x, float y, float ang) {
    super("data/images/bullet.png", x, y, ang);
    
    this.setSize(24, 5);
    this.setRange(350);
    this.setVelocity(10);
  }
}
