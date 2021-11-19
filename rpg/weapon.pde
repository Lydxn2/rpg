abstract class Weapon extends GameObject {
  GameObject owner;
  PImage img;

  WeaponCooldown cooldown;
  
  Weapon(GameObject owner, String imgPath) {
    this.owner = owner;
    this.img = loadImage(imgPath);
  }
  
  void shoot() {
    this.cooldown.reset();
  }
  
  void render() {
    pushMatrix();
    translate(this.owner.loc.x, this.owner.loc.y);
    rotate(atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x));
    
    imageMode(CENTER);
    image(this.img, this.owner.w * .8, 0, this.w, this.h);
    
    popMatrix();
    
    this.cooldown.act();
    this.cooldown.render();
  }

  void setCooldown(int cooldown) {
    this.cooldown = new WeaponCooldown(this, cooldown);
  }
}

class WeaponCooldown {
  Weapon weapon;
  float cooldown;
  Timer timer;
  
  WeaponCooldown(Weapon weapon, int cooldown) {
    this.weapon = weapon;
    this.cooldown = cooldown;
    this.timer = new Timer(cooldown);
  }
  
  void act() {
    this.timer.tick();
  }
  
  void render() {
    // FIXME: don't hardcode coords plz
    float x = 100, y = 500, w = 80, h = 80;
    float ang = map(this.timer.curTick, 0, this.timer.numTicks, 0, TAU);
   
    noStroke();
    fill(#96F07D);
    ellipse(x, y, w, h);
    fill(BLACK, 50);
    arc(x, y, w - 5, h - 5, 0, ang);
    
    imageMode(CENTER);
    image(this.weapon.img, x, y, this.weapon.w, this.weapon.h);
  }
  
  void reset() {
    this.timer.reset();
  }
  
  boolean isDone() {
    return this.timer.isDone();
  }
}
