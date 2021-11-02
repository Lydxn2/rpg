class Weapon extends GameObject {
  GameObject owner;
  PImage img;
  
  Weapon(GameObject owner, PImage img) {
    this.owner = owner;
    this.img = img;
  }
  
  void render() {
    pushMatrix();
    translate(this.owner.loc.x, this.owner.loc.y);
    rotate(-atan2(this.owner.loc.y - mouseY, mouseX - this.owner.loc.x));
    
    imageMode(CENTER);
    image(img, this.owner.sz * .8, 0, 39, 15);
    
    popMatrix();
  }
}
