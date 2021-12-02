void keyPressed() {
  if (key == 'w' || key == 'W')
    keyW = true;
  if (key == 'a' || key == 'A')
    keyA = true;
  if (key == 's' || key == 'S')
    keyS = true;
  if (key == 'd' || key == 'D')
    keyD = true;
  if ((key == 'q' || key == 'Q') && !keyQ)
    keyQ = freeQ = true;
  if ((key == 'e' || key == 'E') && !keyE)
    keyE = freeE = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W')
    keyW = false;
  if (key == 'a' || key == 'A')
    keyA = false;
  if (key == 's' || key == 'S')
    keyS = false;
  if (key == 'd' || key == 'D')
    keyD = false;
  if (key == 'q' || key == 'Q')
    freeQ = keyQ = false;
  if (key == 'e' || key == 'E')
    freeE = keyE = false;
}

void mouseClicked() {
  if (mode == Mode.UPGRADE) {
    if (mouseY >= 150 && mouseY <= 200) {
      hero.maxhp *= 1.2;
      hpLevel++;
    }
    if (mouseY >= 350 && mouseY <= 400) {
      hero.atkMult += 0.3;
      atkLevel++;
    }
    if (mouseY >= 550 && mouseY <= 600) {
      hero.speed += 1;
      spdLevel++;
    }
  }
}
