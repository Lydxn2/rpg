enum Mode {
  INTRO, GAME
}

// color variables
final color BLACK = #000000;
final color WHITE = #FFFFFF;

// title variables
Timer titleTimer;
char[] titleText;
color[] titleColor;
float[] titleX, titleY;

// misc. variables
ArrayList<Particle> particles;

// font variables
PFont gameOverFont;

// action variables
boolean keyUp, keyLeft, keyDown, keyRight;

// room variables
int mapRows = 50, mapCols = 50;
int roomR, roomC;
Room[][] map;

// minimap variables
Minimap minimap;

// darkness variables
final int DARK_NUM = 100;
Darkness[][] darkness;

// hero variables
Hero hero;

// pretty self-explanatory
Mode mode;

void setup() {
  size(1200, 800);
  
  gameOverFont = createFont("data/fonts/rpg.ttf", 100);

  particles = new ArrayList<Particle>();
  initTitle();

  map = new Room[mapRows][mapCols];
  readMap();
  minimap = new Minimap();
  
  darkness = new Darkness[DARK_NUM][DARK_NUM];
  for (int i = 0; i < DARK_NUM; i++) {
    for (int j = 0; j < DARK_NUM; j++) {
      float dx = map[0][0].ofsX + i * Room.DIM / DARK_NUM;
      float dy = map[0][0].ofsY + j * Room.DIM / DARK_NUM;
      darkness[i][j] = new Darkness(dx, dy, Room.DIM / DARK_NUM);
    }
  }

  hero = new Hero(width / 2, height / 2);

  mode = Mode.GAME;
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
  mapRows = lines.length - 1;
  mapCols = lines[1].length();
  
  for (int i = 0; i < mapRows; i++) {
    for (int j = 0; j < mapCols; j++) {
      if (lines[i + 1].charAt(j) == '1')
        minimap.addRoom(i, j);
      
      int[] dr = {-1, 1, 0, 0};
      int[] dc = {0, 0, -1, 1};
      int msk = 0;
      for (int d = 0; d < 4; d++) {
        int nr = i + dr[d], nc = j + dc[d];
        if (nr < 0 || nr >= mapRows || nc < 0 || nc >= mapCols) continue;
        if (lines[nr + 1].charAt(nc) != '1') continue;
        msk |= 1 << d;
      }
      println(i, j, msk);
      map[i][j] = new Room(i, j, msk);
    }
  }
}
