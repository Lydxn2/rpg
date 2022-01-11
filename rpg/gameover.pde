void doGameOver() {
  background(BLACK);

  fill(win ? GREEN : RED, map(sin(frameCount / 20.0), -PI, PI, 0, 255));
  textAlign(CENTER);
  textFont(gameOverFont, 100);
  text(win ? "YOU WIN" : "YOU DIED", width / 2, height / 2);
  
  restartButton.render();
  if (restartButton.isClicked()) {
    resetAll();
    mode = Mode.INTRO;
  }
}
