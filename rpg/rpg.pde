import java.util.HashMap;

enum Mode {
  INTRO, GAME, UPGRADE
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
Button upgradeButton;

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

// pretty self-explanatory
Mode mode;

HashMap<String, PImage> imgCache;

void setup() {
  size(1200, 800, FX2D);

  gameOverFont = createFont("data/fonts/rpg.ttf", 1);
  monospaceFont = createFont("Consolas Bold", 1);

  imgCache = new HashMap<String, PImage>();

  // bad variable name i know, sorry
  roomOfsX = (width - Room.DIM) / 2.0;
  roomOfsY = (height - Room.DIM) / 2.0;

  particles = new ArrayList<Particle>();
  projectiles = new ArrayList<Projectile>();
  enemies = new ArrayList<Enemy>();
  items = new ArrayList<Item>();
  
  hero = new Hero(width / 2.0, height / 2.0);
  initTitle();
  
  readMap();
  
  upgradeButton = new Button(400, 30, 80, 80, "Upgrades", WHITE, BLACK);

  darkness = new ArrayList<Darkness>();
  for (float x = roomOfsX; x < roomOfsX + Room.DIM; x += DARK_Q) {
    for (float y = roomOfsY; y < roomOfsY + Room.DIM; y += DARK_Q) {
      darkness.add(new Darkness(x, y, DARK_Q, DARK_Q));
    }
  }

  mode = Mode.GAME;

  for (int i = 0; i < 20; i++)
    enemies.add(new SpawningPool(0, 0, random(300, 400), random(300, 400)));
  items.add(new SprayerItem(0, 0, 300, 300));
  
  hpLevel = atkLevel = spdLevel = 1;
  cash = 0;
}

void draw() {
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
