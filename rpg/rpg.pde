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

// font variables
PFont gameOverFont, monospaceFont;

// action variables
boolean keyUp, keyLeft, keyDown, keyRight;

// room variables
int mapDims;
int roomR, roomC;
Room[][] map;
float roomOfsX, roomOfsY;

// minimap variables
Minimap minimap;

// darkness variables
final int DARK_NUM = 50;
Darkness[][] darkness;

// hero variables
Hero hero;

// pretty self-explanatory
Mode mode;

void setup() {
  size(1200, 800);
  
  gameOverFont = createFont("data/fonts/rpg.ttf", 1);
  monospaceFont = createFont("Source Code Pro Bold", 1);

  // bad variable name i know, sorry
  roomOfsX = (width - Room.DIM) / 2.0;
  roomOfsY = (height - Room.DIM) / 2.0;
 
  particles = new ArrayList<Particle>();
  initTitle();
  
  readMap();
  
  darkness = new Darkness[DARK_NUM][DARK_NUM];
  for (int i = 0; i < DARK_NUM; i++) {
    for (int j = 0; j < DARK_NUM; j++) {
      float dx = roomOfsX + i * Room.DIM / DARK_NUM;
      float dy = roomOfsY + j * Room.DIM / DARK_NUM;
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
