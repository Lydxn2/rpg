class Handgun extends Weapon {
  Handgun(GameObject owner) {
    super(owner, "data/images/handgun.png");
    this.setCooldown(30);
    this.setSize(39, 15);
  }
  
  void shoot() {
    super.shoot();
    
    float ang = atan2(mouseY - this.owner.loc.y, mouseX - this.owner.loc.x);
    bullets.add(new ClassicBullet(this.owner.loc.x, this.owner.loc.y, ang));
  }
}
