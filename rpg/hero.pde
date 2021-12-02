class Hero extends GameObject {
  final static float ACCEL = 1;
  final static float FRICTION = 0.95;

  Weapon weapon;
  HealthBar hpbar;

  int immunityCooldown;
  int alpha;
  float atkMult, speed;
  
  public Hero(float x, float y) {
    this.loc = new PVector(x, y);
    this.vel = new PVector(0, 0);
    this.w = this.h = 50;
    this.resetHP(500);

    this.weapon = new Sprayer(this);
    this.hpbar = new HealthBar(this);
    
    this.immunityCooldown = 0;
    this.alpha = 255;
    
    this.atkMult = 1;
    this.speed = 4;
  }
  
  void act() {
    super.act();
    
    if (keyW) this.vel.y -= ACCEL;
    if (keyA) this.vel.x -= ACCEL;
    if (keyS) this.vel.y += ACCEL;
    if (keyD) this.vel.x += ACCEL;

    // set boundaries
    float leftX = (width - Room.DIM) / 2.0;
    float rightX = (width + Room.DIM) / 2.0;
    float upY = (height - Room.DIM) / 2.0;
    float downY = (height + Room.DIM) / 2.0;
    
    if (this.loc.x <= leftX + this.w / 2)  this.loc.x = leftX + this.w / 2;
    if (this.loc.x >= rightX - this.w / 2) this.loc.x = rightX - this.w / 2;
    if (this.loc.y <= upY + this.h / 2)   this.loc.y = upY + this.h / 2;
    if (this.loc.y >= downY - this.h / 2)   this.loc.y = downY - this.h / 2;
    
    // constrain speed when moving diagonally
    if (this.vel.mag() > this.speed)
      this.vel.setMag(this.speed);
    
    // emulate deceleration
    this.vel.setMag(this.vel.mag() * FRICTION);
    
    if (mousePressed && this.weapon.cooldown.isDone())
      this.weapon.shoot();
      
    this.immunityCooldown = max(0, this.immunityCooldown - 1);
    this.alpha = min(255, this.alpha + 30);
  }
  
  void render() {
    this.weapon.render();
    
    fill(#FFDDB3, this.alpha);
    stroke(#DBB98F, this.alpha); strokeWeight(4);
    ellipse(this.loc.x, this.loc.y, this.w, this.h);
    
    this.hpbar.render();
  }
  
  void takeDamage(float atk) {
    this.hp = max(0, this.hp - atk);
    this.immunityCooldown = 20;
  }
  
  void useItem(Item item) {
    if (item instanceof MedKitItem) {
      this.hp = min(this.hp + this.maxhp / 3, this.maxhp);
    } else if (item instanceof HandgunItem) {
      this.weapon = new Handgun(this);
    } else if (item instanceof RifleItem) {
      this.weapon = new Rifle(this);
    } else if (item instanceof ShotgunItem) {
      this.weapon = new Shotgun(this);
    } else if (item instanceof SniperItem) {
      this.weapon = new Sniper(this);
    } else if (item instanceof SprayerItem) {
      this.weapon = new Sprayer(this);
    }
  }
}
