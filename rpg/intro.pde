void doIntro() {
  background(0);
  
  startButton.render();
  if (startButton.isClicked())
    mode = Mode.GAME;

  titleTimer.tick();
  
  drawTitle();
}

void drawTitle() {
  int magic = titleTimer.getTick();
  if (magic % 2 == 0) {
    switch (magic / 20) { // i am yanderedev
    case 0: case 1:
      titleText[0] = (char) random(40, 50);
      titleText[1] = (char) random(40, 50);
      titleText[2] = (char) random(40, 50);
      break;
    case 2:
      titleText[0] = (char) random(65, 91);
      titleText[1] = (char) random(40, 50);
      titleText[2] = (char) random(40, 50);
      break;
    case 3:
      titleText[0] = 'R';
      titleText[1] = (char) random(40, 50);
      titleText[2] = (char) random(40, 50);
      titleColor[0] = #706D46;
      break;
    case 4:
      titleText[1] = (char) random(65, 91);
      titleText[2] = (char) random(40, 50);
      break;
    case 5:
      titleText[1] = 'P';
      titleText[2] = (char) random(40, 50);
      titleColor[1] = #467046;
      break;
    case 6:
      titleText[2] = (char) random(65, 91);
      break;
    case 7:
      titleText[2] = 'G';
      titleColor[2] = #46706C;
      break;
    }
  }
  
  textAlign(LEFT, CENTER);
  textFont(gameOverFont, 150);
  float totWidth = 0, curWidth = 0;
  for (char c : titleText)
    totWidth += textWidth(c);
  for (int i = 0; i < 3; i++) {
    fill(titleColor[i]);
    float x = width / 2 - totWidth / 2 + curWidth, y = height / 2;
    text(titleText[i], x, y);
    curWidth += textWidth(titleText[i]);
    
    for (int _ = 0; _ < 200; _++)
      if ((i == 0 && titleTimer.getTick() == 60)
       || (i == 1 && titleTimer.getTick() == 100)
       || (i == 2 && titleTimer.getTick() == 140))
        particles.add(new Particle(x + textWidth(titleText[i]) / 2, y, titleColor[i], 200));
  }
}
