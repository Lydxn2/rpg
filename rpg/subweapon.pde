// Handgun:
// - Low DPS
// - Normal cooldown, speed and range
class Handgun extends Weapon {
  Handgun(GameObject owner) {
    super(owner, "data/images/handgun.png");
    this.setCooldown(30);
    this.setDimensions(39, 15);
  }
  
  void shoot() {
    super.shoot();
    
    float ang = atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x);
    
    Projectile projectile = new Bullet(this.owner, ang);
    projectile.setATK(15);
    projectile.setPierce(3);
    projectile.setRange(350);
    projectile.setVelocity(10);
    projectile.offsetTo(this.w);
    
    projectiles.add(projectile);
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
  }
  
  void shoot() {
    super.shoot();
    
    float ang = atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x);
    ang += random(-radians(5), radians(5));
    
    Projectile projectile = new Bullet(this.owner, ang);
    projectile.setATK(5);
    projectile.setPierce(2);
    projectile.setRange(350);
    projectile.setVelocity(15);
    projectile.offsetTo(this.w);
    
    projectiles.add(projectile);
  }
}

// - Slow refresh
// - High speed and damage
class Shotgun extends Weapon {
  Shotgun(GameObject owner) {
    super(owner, "data/images/shotgun.png");
    this.setCooldown(60);
    this.setDimensions(60, 15);
  }
  
  void shoot() {
    super.shoot();
    
    for (int _ = 0; _ < 5; _++) {
      float ang = atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x);
      ang += random(-radians(10), radians(10));
      
      Projectile projectile = new Bullet(this.owner, ang);
      projectile.setATK(30);
      projectile.setPierce(3);
      projectile.setRange(300);
      projectile.setVelocity(20);
      projectile.offsetTo(this.w);
      
      projectiles.add(projectile);
    }
  }
}

// - Very slow refresh
// - Very high speed and damage
class Sniper extends Weapon {
  Sniper(GameObject owner) {
    super(owner, "data/images/sniper.png");
    this.setCooldown(120);
    this.setDimensions(72, 12);
  }
  
  void shoot() {
    super.shoot();

    float ang = atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x);
    
    Projectile projectile = new Bullet(this.owner, ang);
    projectile.setATK(100);
    projectile.setPierce(6);
    projectile.setRange(1000);
    projectile.setVelocity(30);
    projectile.offsetTo(this.w);
    
    projectiles.add(projectile);
  }
}

// yeah.
class Sprayer extends Weapon {
  final int CRAZY = 50;
  
  Sprayer(GameObject owner) {
    super(owner, "data/images/rifle.png");
    this.setCooldown(4);
    this.setDimensions(66, 14);
  }
  
  void shoot() {
    super.shoot();

    float startAng = atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x);
    for (int i = 0; i < CRAZY; i++) {
      float ang = startAng + i * TAU / CRAZY;
      Projectile projectile = new Bullet(this.owner, ang);
      projectile.setATK(0.5);
      projectile.setPierce(2);
      projectile.setRange(9999);
      projectile.setVelocity(15);
      projectile.offsetTo(this.w);
      
      projectiles.add(projectile);
    }
  }
}

// Ultimate (easter egg)
// - The ultimate gun
class Ultimate extends Weapon {
  Ultimate(GameObject owner) {
    super(owner, "data/images/handgun.png");
    this.setCooldown(10);
    this.setDimensions(117, 45);
  }
  
  void shoot() {
    super.shoot();
    
    float ang = atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x);
    
    Projectile projectile = new Bullet(this.owner, ang);
    projectile.setATK(50);
    projectile.setPierce(50);
    projectile.setRange(9999);
    projectile.setVelocity(15);
    projectile.offsetTo(this.w);
    projectile.setSize(120, 25);
    projectiles.add(projectile);
  }
}
