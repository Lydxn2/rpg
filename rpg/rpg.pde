import java.util.HashMap;

enum Mode {
  INTRO, GAME, UPGRADE, GAMEOVER
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
ArrayList<Projectile> projectiles;
ArrayList<Message> messages;
Button startButton, restartButton;

boolean wasPressed, isClicked;

// font variables
PFont gameOverFont, monospaceFont;

// action variables
boolean keyW, keyA, keyS, keyD, keyQ, keyE;
boolean freeQ, freeE;

// room variables
int mapDims;
Room[][] map;
float roomOfsX, roomOfsY;

// minimap variables
Minimap minimap;

// darkness variables
final int DARK_Q = 10;
ArrayList<Darkness> darkness;

// enemy variables
ArrayList<Enemy> enemies;

// item variables
ArrayList<Item> items;

// hero variables
Hero hero;
int hpLevel, atkLevel, spdLevel, cash;
int hpCost, atkCost, spdCost;

// pretty self-explanatory
Mode mode;

HashMap<String, PImage> imgCache;

void setup() {
  size(1200, 800, FX2D);

  resetAll();
  mode = Mode.INTRO;
}

void draw() {
  isClicked = false;
  if (mousePressed) wasPressed = true;
  if (!mousePressed && wasPressed)
    { isClicked = true; wasPressed = false; }
  
  switch (mode) {
  case INTRO:
    doIntro();
    break;
  case GAME:
    doGame();
    break;
  case UPGRADE:
    doUpgrade();
    break;
  case GAMEOVER:
    doGameOver();
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

void resetAll() {
  gameOverFont = createFont("data/fonts/rpg.ttf", 1);
  monospaceFont = createFont("Consolas Bold", 1);
  
  startButton = new Button(width / 2.0, 600, 300, 70, "START", #86FF61);
  restartButton = new Button(width / 2.0, 600, 300, 70, "RESTART", #FFE14A);

  imgCache = new HashMap<String, PImage>();

  roomOfsX = (width - Room.DIM) / 2.0;
  roomOfsY = (height - Room.DIM) / 2.0;

  particles = new ArrayList<Particle>();
  projectiles = new ArrayList<Projectile>();
  messages = new ArrayList<Message>();
  enemies = new ArrayList<Enemy>();
  items = new ArrayList<Item>();
  
  hpLevel = atkLevel = spdLevel = 1;
  hpCost = atkCost = spdCost = 10;
  cash = 0;
  
  hero = new Hero(width / 2.0, height / 2.0);
  
  initTitle();
  readMap();
  readLayout();
  
  darkness = new ArrayList<Darkness>();
  for (float x = roomOfsX; x < roomOfsX + Room.DIM; x += DARK_Q) {
    for (float y = roomOfsY; y < roomOfsY + Room.DIM; y += DARK_Q) {
      darkness.add(new Darkness(x, y, DARK_Q, DARK_Q));
    }
  }
}

void readMap() {
  String[] lines = loadStrings("data/map.txt");
  String[] spawn = lines[0].split(" ");

  hero.roomR = int(spawn[0]); hero.roomC = int(spawn[1]);
  mapDims = lines.length - 1;

  map = new Room[mapDims][mapDims];
  minimap = new Minimap(mapDims);
  
  int[] dr = {-1, 1, 0, 0};
  int[] dc = {0, 0, -1, 1};
  
  for (int i = 0; i < mapDims; i++) {
    for (int j = 0; j < mapDims; j++) {
      if (lines[i + 1].charAt(j) != '?')
        minimap.addRoom(i, j);

      int msk = 0;
      for (int d = 0; d < 4; d++) {
        int nr = i + dr[d], nc = j + dc[d];
        if (nr < 0 || nr >= mapDims || nc < 0 || nc >= mapDims) continue;
        if (lines[nr + 1].charAt(nc) == '?') continue;
        msk |= 1 << d;
      }

      map[i][j] = new Room(i, j, msk, lines[i + 1].charAt(j));
    }
  }
}

void readLayout() {
  String[] lines = loadStrings("data/layout.txt");
  for (int i = 0; i < lines.length; i += 9) {
    String[] rc = lines[i].split(" ");
    int roomR = int(rc[0]), roomC = int(rc[1]);
    for (int r = 0; r < 8; r++) {
      for (int c = 0; c < 8; c++) {
        char ch = lines[i + 1 + r].charAt(c);
        float posX = roomOfsX + 40 + map(c, 0, 7, 0, Room.DIM - 80);
        float posY = roomOfsY + 40 + map(r, 0, 7, 0, Room.DIM - 80);
        
        if (ch == 'L')
          enemies.add(new Lurker(roomR, roomC, posX, posY));
        else if (ch == 'T')
          enemies.add(new Turret(roomR, roomC, posX, posY));
        else if (ch == 'S')
          enemies.add(new SpawningPool(roomR, roomC, posX, posY));
        else if (ch == 'B')
          enemies.add(new Boss(roomR, roomC, posX, posY));
      }
    }
  }
}
