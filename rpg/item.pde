class Item extends GameObject {
  GameObject owner;
  PImage img;
  float imgW, imgH;
  
  Item(int roomR, int roomC, float x, float y) {
    this.roomR = roomR;
    this.roomC = roomC;
    this.loc = new PVector(x, y);
    
    this.w = this.h = 85;
    this.hp = 1;
  }
  
  Item(GameObject owner) {
    this(owner.roomR, owner.roomC, owner.loc.x, owner.loc.y);
  }
  
  void render() {
    image(this.img, this.loc.x, this.loc.y, this.imgW, this.imgH);
    fill(#00FF00, 50);
    strokeWeight(2); stroke(#7eed7e);
    circle(this.loc.x, this.loc.y, this.w);
  }
  
  void setImage(String imgPath, float imgW, float imgH) {
    this.img = loadImageFast(imgPath);
    this.imgW = imgW;
    this.imgH = imgH;
  }
}

Item randomItem(GameObject obj) {
  int pick = (int) random(0, 6);
  switch (pick) {
    case 0: return new MedKitItem(obj.roomR, obj.roomC, obj.loc.x, obj.loc.y);
    case 1: return new HandgunItem(obj.roomR, obj.roomC, obj.loc.x, obj.loc.y);
    case 2: return new RifleItem(obj.roomR, obj.roomC, obj.loc.x, obj.loc.y);
    case 3: return new ShotgunItem(obj.roomR, obj.roomC, obj.loc.x, obj.loc.y);
    case 4: return new SniperItem(obj.roomR, obj.roomC, obj.loc.x, obj.loc.y);
    case 5: return new SprayerItem(obj.roomR, obj.roomC, obj.loc.x, obj.loc.y);
  }
  return null;
}
