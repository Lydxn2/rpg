class GIF {
  PImage[] images;
  int frames, refresh;
  int gameFrame, imgFrame;
  GIF(String path, String ext, int frames, int refresh) {
    this.images = new PImage[frames];
    this.frames = frames;
    this.refresh = refresh;
    this.gameFrame = this.imgFrame = 0;
    
    for (int i = 0; i < frames; i++)
      this.images[i] = loadImage(path + i + ext);
  }
  
  void render(float x, float y, float w, float h) {
    this.gameFrame = (this.gameFrame + 1) % this.refresh;
    if (this.gameFrame == 0)
      this.imgFrame = (this.imgFrame + 1) % this.frames;
    image(this.images[this.imgFrame], x, y, w, h);
  }
}
