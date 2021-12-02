void doUpgrade() {
  background(BLACK);
  
  fill(WHITE);
  textAlign(CENTER);
  textFont(gameOverFont, 50);
  text("HP: LVL " + hpLevel, width / 2, 200);
  text("ATK: LVL " + atkLevel, width / 2, 400);
  text("SPD: LVL " + spdLevel, width / 2, 600);
  
  // I love my magic numbers :)
  fill(RED, 100);
  stroke(RED, 255); strokeWeight(2);
  if (mouseY >= 150 && mouseY <= 200) {
    rect(0, 150, width, 60);
  }
  if (mouseY >= 350 && mouseY <= 400) {
    rect(0, 350, width, 60);
  }
  if (mouseY >= 550 && mouseY <= 600) {
    rect(0, 550, width, 60);
  }
  
  if (keyE && freeE) {
    mode = Mode.GAME;
    freeE = false;
  }
}

// x: 160 - 200
// x2: 360 - 400
// x3: 560 - 600
