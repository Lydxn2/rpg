class Button {
  float x, y, w, h;
  String text;
  color col;

  Button(float x, float y, float w, float h, String text, color col) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.col = col;
  }
  
  void render() {
    color newCol = this.isHovered() ? WHITE : this.col;
    
    fill(WHITE, 0);
    stroke(newCol); strokeWeight(5);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h);

    fill(newCol);
    textAlign(CENTER, CENTER);
    textFont(gameOverFont, 40);
    text(this.text, this.x, this.y);
  }
  
  boolean isHovered() {
    boolean inX = this.x - this.w / 2 <= mouseX && mouseX <= this.x + this.w / 2;
    boolean inY = this.y - this.h / 2 <= mouseY && mouseY <= this.y + this.h / 2;
    return inX && inY;
  }
  
  boolean isClicked() {
    return this.isHovered() && isClicked;
  }
}
