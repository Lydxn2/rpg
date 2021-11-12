enum Mode {
  INTRO, GAME
}

// color variables
final color BLACK = #000000;
final color RED = #FF0000;
final color WHITE = #FFFFFF;

// title variables
Timer titleTimer;
char[] titleText;
color[] titleColor;
float[] titleX, titleY;

// misc. variables
ArrayList<Particle> particles;
ArrayList<Bullet> bullets;

// font variables
PFont gameOverFont, monospaceFont;

// action variables
boolean keyW, keyA, keyS, keyD;

// room variables
int mapDims;
int roomR, roomC;
Room[][] map;
float roomOfsX, roomOfsY;

// minimap variables
Minimap minimap;

// darkness variables
final int DARK_Q = 10;
ArrayList<Darkness> darkness;

// enemy variables
ArrayList<Enemy> enemies;

// hero variables
Hero hero;

// pretty self-explanatory
Mode mode;

void setup() {
  size(1200, 800, FX2D);
  
  gameOverFont = createFont("data/fonts/rpg.ttf", 1);
  monospaceFont = createFont("Consolas Bold", 1);

  // bad variable name i know, sorry
  roomOfsX = (width - Room.DIM) / 2.0;
  roomOfsY = (height - Room.DIM) / 2.0;

  particles = new ArrayList<Particle>();
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  
  initTitle();
  
  readMap();

  darkness = new ArrayList<Darkness>();
  for (float x = roomOfsX; x < roomOfsX + Room.DIM; x += DARK_Q) {
    for (float y = roomOfsY; y < roomOfsY + Room.DIM; y += DARK_Q) {
      darkness.add(new Darkness(x, y, DARK_Q, DARK_Q));
    }
  }

  hero = new Hero(width / 2.0, height / 2.0);

  mode = Mode.GAME;
  
  // test enemy:
  enemies.add(new Lurker(0, 0, 400, 400));
}

void draw() {
  switch (mode) {
    case INTRO:
      doIntro();
      break;
    case GAME:
      doGame();
      break;
  }
  
  for (Particle p : particles)
    { p.act(); p.render(); }
}

void initTitle() {
  titleTimer = new Timer(2000);
  titleTimer.reset();
  titleText = new char[3];
  titleColor = new color[] {#FFFFFF, #FFFFFF, #FFFFFF};
  titleX = new float[3]; titleY = new float[3];
}

void readMap() {
  String[] lines = loadStrings("data/map.txt");
  String[] spawn = lines[0].split(",");
  
  roomR = int(spawn[0]); roomC = int(spawn[1]);
  mapDims = lines.length - 1;

  map = new Room[mapDims][mapDims];
  minimap = new Minimap(mapDims);
  
  int[] dr = {-1, 1, 0, 0};
  int[] dc = {0, 0, -1, 1};
  
  for (int i = 0; i < mapDims; i++) {
    for (int j = 0; j < mapDims; j++) {
      if (lines[i + 1].charAt(j) == '1')
        minimap.addRoom(i, j);

      int msk = 0;
      for (int d = 0; d < 4; d++) {
        int nr = i + dr[d], nc = j + dc[d];
        if (nr < 0 || nr >= mapDims || nc < 0 || nc >= mapDims) continue;
        if (lines[nr + 1].charAt(nc) != '1') continue;
        msk |= 1 << d;
      }
      map[i][j] = new Room(i, j, msk);
    }
  }
}
