class HealthBar {
  GameObject obj;
  HealthBar(GameObject obj) {
    this.obj = obj;
  }
  
  void render() {
    // arbitrary (for now)
    float barLength = 70;
    float barWidth = 3;
    
    float actualLength = barLength * obj.hp / obj.maxhp;
    
    noStroke();
    fill(#FF0000);
    rect(obj.loc.x - barLength / 2, obj.loc.y - obj.h / 2 - barWidth * 3, barLength, barWidth);
    fill(#00FF00);
    rect(obj.loc.x - barLength / 2, obj.loc.y - obj.h / 2 - barWidth * 3, actualLength, barWidth);
  }
}
