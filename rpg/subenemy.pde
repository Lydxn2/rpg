class Lurker extends Enemy {
  Lurker(int sr, int sc, float x, float y) {
    super(sr, sc, x, y);

    this.setDimensions(40, 40);

    this.resetHP(100);
    this.setATK(25);
    
    this.setSpeed(random(0.6, 1.4));
  }

  void act() {
    this.vel = new PVector(1, 0);
    this.vel.rotate(atan2(hero.loc.y - this.loc.y, hero.loc.x - this.loc.x));
    this.vel.setMag(this.speed);
    
    super.act();
  }
  
  void render() {
    fill(#FF0000, this.alpha);
    stroke(#960000, this.alpha); strokeWeight(5);
    circle(this.loc.x, this.loc.y, this.w);
    
    super.render();
  }
}

class Turret extends Enemy {
  Timer timer;
  
  Turret(int sr, int sc, float x, float y) {
    super(sr, sc, x, y);
    
    this.setDimensions(60, 60);
    
    this.resetHP(300);
    
    this.timer = new Timer(90);
    this.timer.setRandomTick();
  }
  
  void act() {
    this.timer.tick();
    if (this.timer.isDone()) {
      float ang = atan2(hero.loc.y - this.loc.y, hero.loc.x - this.loc.x);
      Projectile cannonBall = new Cannonball(this, ang);
      cannonBall.setATK(50);
      cannonBall.setPierce(1);
      cannonBall.setRange(1000);
      cannonBall.setVelocity(2);

      projectiles.add(cannonBall);
      
      this.timer.reset();
    }
  }
  
  void render() {
    fill(#A3A3A3, this.alpha);
    stroke(#5C5C5C, this.alpha); strokeWeight(5);
    
    pushMatrix();
    translate(this.loc.x, this.loc.y);
    float ang = atan2(hero.loc.y - this.loc.y, hero.loc.x - this.loc.x);
    rotate(ang);
    rect(0, -10, 50, 20);
    popMatrix();
    
    circle(this.loc.x, this.loc.y, this.w);
    super.render();
  }
}

class SpawningPool extends Enemy {
  Timer timer;
  
  SpawningPool(int sr, int sc, float x, float y) {
    super(sr, sc, x, y);
    
    this.setDimensions(80, 80);
    this.resetHP(500);
    
    this.timer = new Timer(2);
    this.timer.setRandomTick();
  }
  
  void act() {
    this.timer.tick();
    if (this.timer.isDone()) {
      Enemy enemy = new Lurker(this.roomR, this.roomC, this.loc.x, this.loc.y);
      enemies.add(enemy);
      
      this.timer.reset();
    }
  }
  
  void render() {
    fill(#dd99ff, this.alpha);
    stroke(#945db0, this.alpha); strokeWeight(5);
    circle(this.loc.x, this.loc.y, this.w);
    super.render();
  }
}
