class Timer {
  int curTick, numTicks;
  
  Timer(int numTicks) {
    this.curTick = this.numTicks = numTicks;
  }
  
  void reset() {
    this.curTick = 0;
  }
  
  void tick() {
    if (this.curTick != this.numTicks)
      this.curTick++;
  }
  
  boolean isDone() {
    return this.curTick == this.numTicks;
  }
  
  int getTick() {
    return this.curTick;
  }
  
  void setRandomTick() {
    this.curTick = (int) random(numTicks);
  }
}
