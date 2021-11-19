class Bullet extends Projectile {
  Bullet(GameObject owner, float ang) {
    super(owner, "data/images/bullet.png", 24, 5, ang);
  }
}

class Cannonball extends Projectile {
  Cannonball(GameObject owner, float ang) {
    super(owner, "data/images/cannonball.png", 20, 20, ang);
  }
}
