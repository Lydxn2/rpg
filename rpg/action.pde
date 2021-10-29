void keyPressed() {
  if (keyCode == UP)
    keyUp = true;
  if (keyCode == LEFT)
    keyLeft = true;
  if (keyCode == DOWN)
    keyDown = true;
  if (keyCode == RIGHT)
    keyRight = true;
}

void keyReleased() {
  if (keyCode == UP)
    keyUp = false;
  if (keyCode == LEFT)
    keyLeft = false;
  if (keyCode == DOWN)
    keyDown = false;
  if (keyCode == RIGHT)
    keyRight = false;
}
