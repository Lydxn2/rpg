class ClassicBullet extends Bullet {
  ClassicBullet(Weapon weapon, float ang) {
    super(weapon, "data/images/bullet.png", ang);
    this.setSize(24, 5);
  }
}
