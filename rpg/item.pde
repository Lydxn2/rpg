class Item extends GameObject {
  int sr, sc;
  PImage img;
  float imgW, imgH;
  
  Item(int sr, int sc, float x, float y) {
    this.sr = sr;
    this.sc = sc;
    this.loc = new PVector(x, y);
  }
  
  void render() {
    image(this.img, this.loc.x, this.loc.y, this.imgW, this.imgH);
    fill(#00FF00, 50);
    circle(this.loc.x, this.loc.y, 50);
  }
  
  void setImage(PImage img, float imgW, float imgH) {
    this.img = img;
    this.imgW = imgW;
    this.imgH = imgH;
  }
}
