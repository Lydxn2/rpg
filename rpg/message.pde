class Message extends GameObject {
  final int DURATION = 60;
  
  String text;
  int roomR, roomC, size;
  Timer timer;
  
  Message(String text, Enemy enemy, int size) {
    this.text = text;
    this.loc = enemy.loc.copy();
    this.roomR = enemy.roomR;
    this.roomC = enemy.roomC;

    this.size = size;
    
    this.timer = new Timer(DURATION);
    this.timer.reset();
    this.hp = 1;
  }
  
  void act() {
    this.loc.y -= 2;
    
    this.timer.tick();
    if (this.timer.isDone())
      this.hp = 0;
  }
  
  void render() {
    textAlign(CENTER);
    textFont(gameOverFont, size);
    fill(WHITE, 255 - map(timer.getTick(), 0, DURATION, 0, 255));
    text(this.text, this.loc.x, this.loc.y);
  }
}
