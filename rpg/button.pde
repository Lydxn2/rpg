class Button {
  float x, y, w, h;
  String text;
  color col;
  boolean clicked;
  
  Button(float x, float y, float w, float h, String text, color col) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.col = col;
    
    this.clicked = false;
  }
  
  void render() {
    fill(col);
    stroke(#FFFFFF); strokeWeight(10);
    rect(this.x, this.y, this.w, this.h, 20);

    fill(#FFFFFF);
    textAlign(CENTER, CENTER);
    textFont(createFont("Source Code Pro Bold", 1), 32);
    text(this.text, this.x + this.w / 2, this.y + this.h / 2);
  }
  
  boolean isHovered() {
    boolean inX = this.x - this.w / 2 <= mouseX && mouseX <= this.x + this.w / 2;
    boolean inY = this.y - this.h / 2 <= mouseY && mouseY <= this.y + this.h / 2;
    return inX && inY;
  }
}
