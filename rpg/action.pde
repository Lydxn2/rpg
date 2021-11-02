void keyPressed() {
  if (key == 'w' || key == 'W')
    keyW = true;
  if (key == 'a' || key == 'A')
    keyA = true;
  if (key == 's' || key == 'S')
    keyS = true;
  if (key == 'd' || key == 'D')
    keyD = true;
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
}
