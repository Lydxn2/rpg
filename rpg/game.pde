void doGame() {
  background(BLACK);
    
  map[roomR][roomC].render();
    
  for (Enemy e : enemies)
    { e.act(); e.render(); }
    
  for (Darkness d : darkness)
    d.render();
    
  for (Bullet b : bullets) {
    b.act(); b.render();
    for (Enemy e : enemies) {
      if (roomR == e.sr && roomC == e.sc && b.loc.dist(e.loc) <= (b.w + e.w) / 2) {
        e.hp = max(0, e.hp - b.weapon.atk);
        e.alpha = 10;
        b.hp--;
        break;
      }
    }
  }
    
  hero.act(); hero.render();
  
  for (Door d : map[roomR][roomC].doors) {
    if (d.isTouching(hero)) {
      switch (d.type) {
      case 0: // up
        roomR--;
        hero.loc.y += Room.DIM - 5 - hero.h;
        break;
      case 1: // down
        roomR++;
        hero.loc.y -= Room.DIM - 5 - hero.h;
        break;
      case 2: // left
        roomC--;
        hero.loc.x += Room.DIM - 5 - hero.w;
        break;
      case 3: // right
        roomC++;
        hero.loc.x -= Room.DIM - 5 - hero.w;
        break;
      }
      bullets.clear();
    }
  }
    
  // delete dead bullets
  for (int i = bullets.size() - 1; i >= 0; i--)
    if (bullets.get(i).hp == 0)
      bullets.remove(i);
  
  // delete dead enemies
  for (int i = enemies.size() - 1; i >= 0; i--)
    if (enemies.get(i).hp == 0)
      enemies.remove(i);
  
  minimap.render();
}
