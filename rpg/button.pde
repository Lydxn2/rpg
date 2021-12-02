class Button {
  float x, y, w, h;
  String text;
  color bgCol, textCol;
  boolean clicked;
  
  Button(float x, float y, float w, float h, String text, color bgCol, color textCol) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.bgCol = bgCol;
    this.textCol = textCol;
    
    this.clicked = false;
  }
  
  void render(int fs) {
    fill(bgCol);
    stroke(textCol); strokeWeight(10);
    rect(this.x, this.y, this.w, this.h, 20);

    fill(textCol);
    textAlign(CENTER, CENTER);
    textFont(createFont("Source Code Pro Bold", 1), fs);
    text(this.text, this.x + this.w / 2, this.y + this.h / 2);
  }
  
  boolean isHovered() {
    boolean inX = this.x - this.w / 2 <= mouseX && mouseX <= this.x + this.w / 2;
    boolean inY = this.y - this.h / 2 <= mouseY && mouseY <= this.y + this.h / 2;
    return inX && inY;
  }
}
