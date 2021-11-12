// Handgun:
// - Low DPS
// - Normal cooldown, speed and range
class Handgun extends Weapon {
  Handgun(GameObject owner) {
    super(owner, "data/images/handgun.png");
    this.setCooldown(30);
    this.setDimensions(39, 15);
    this.setATK(15);
  }
  
  void shoot() {
    super.shoot();
    
    float ang = atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x);
    
    Bullet bullet = new ClassicBullet(this, ang);
    bullet.setVelocity(10);
    bullet.setRange(350);
    bullets.add(bullet);
  }
}

// Rifle:
// - Fast refresh
// - High DPS
// - Above average speed
class Rifle extends Weapon {
  Rifle(GameObject owner) {
    super(owner, "data/images/rifle.png");
    this.setCooldown(4);
    this.setDimensions(66, 14);
    this.setATK(4);
  }
  
  void shoot() {
    super.shoot();
    
    float ang = atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x);
    ang += random(-radians(5), radians(5));
    
    Bullet bullet = new ClassicBullet(this, ang);
    bullet.setVelocity(15);
    bullet.setRange(350);
    bullets.add(bullet);
  }
}

// - Slow refresh
// - High speed and damage
class Shotgun extends Weapon {
  Shotgun(GameObject owner) {
    super(owner, "data/images/shotgun.png");
    this.setCooldown(60);
    this.setDimensions(60, 15);
    this.setATK(12);
  }
  
  void shoot() {
    super.shoot();
    
    for (int _ = 0; _ < 10; _++) {
      float ang = atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x);
      ang += random(-radians(20), radians(20));
      
      Bullet bullet = new ClassicBullet(this, ang);
      bullet.setVelocity(20);
      bullet.setRange(300);
      bullets.add(bullet);
    }
  }
}

class CRACKED extends Weapon {
  CRACKED(GameObject owner) {
    super(owner, "data/images/rifle.png");
    this.setCooldown(1);
    this.setDimensions(66, 14);
    this.setATK(1);
  }
  
  void shoot() {
    super.shoot();
    
    for (int _ = 0; _ < 4; _++) {
      float ang = atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x);
      ang += random(-radians(20), radians(20));
      
      Bullet bullet = new ClassicBullet(this, ang);
      bullet.setVelocity(15);
      bullet.setRange(350);
      bullets.add(bullet);
    }
  }
}
