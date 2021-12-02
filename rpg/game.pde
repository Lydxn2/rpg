void doGame() {
  background(BLACK);

  map[hero.roomR][hero.roomC].render();
  
  for (Item it : items)
    if (hero.inRoomWith(it))
      it.render();
      
  for (int i = 0; i < enemies.size(); i++) {
    Enemy e = enemies.get(i);
    if (hero.inRoomWith(e))
      { e.act(); e.render(); }
  }

  for (int i = 0; i < items.size(); i++) {
    Item it = items.get(i);
    if (hero.inRoomWith(it) && hero.loc.dist(it.loc) <= (hero.w + it.w) / 2 && keyQ && freeQ) {
      it.hp = 0;
      hero.useItem(it);
      freeQ = false;
    }
  }
  
  for (Darkness d : darkness)
    d.render();

  for (Projectile p : projectiles) {
    p.act(); p.render();
    if (p.owner instanceof Hero)
      for (Enemy e : enemies) {
        if (!p.hit.contains(e) && hero.inRoomWith(e) && p.loc.dist(e.loc) <= (p.w + p.h) / 2) {
          e.takeDamage(p.atk * hero.atkMult);
          p.takeDamage(1);
          p.hit.add(e);
          continue;
        }
      }
    if (p.owner instanceof Enemy && hero.inRoomWith(p))
      if (!p.hit.contains(hero) && isRectIntersect(hero.loc.x, hero.loc.y, hero.w, hero.h, p.loc.x, p.loc.y, p.w, p.h)) {
        hero.takeDamage(p.atk);
        p.hit.add(hero);
        continue;
      }
  }
  
  if (hero.immunityCooldown == 0)
    for (Enemy e : enemies)
      if (hero.inRoomWith(e) && e.atk != 0 && isRectIntersect(hero.loc.x, hero.loc.y, hero.w, hero.h, e.loc.x, e.loc.y, e.w, e.h)) {
        hero.takeDamage(e.atk);
        break;
      }

  hero.act(); hero.render();

  for (Door d : map[hero.roomR][hero.roomC].doors) {
    if (d.isTouching(hero)) {
      switch (d.type) {
      case 0: // up
        hero.roomR--;
        hero.loc.y += Room.DIM - 5 - hero.h;
        break;
      case 1: // down
        hero.roomR++;
        hero.loc.y -= Room.DIM - 5 - hero.h;
        break;
      case 2: // left
        hero.roomC--;
        hero.loc.x += Room.DIM - 5 - hero.w;
        break;
      case 3: // right
        hero.roomC++;
        hero.loc.x -= Room.DIM - 5 - hero.w;
        break;
      }
      projectiles.clear();
    }
  }
    
  // delete dead bullets
  for (int i = projectiles.size() - 1; i >= 0; i--)
    if (projectiles.get(i).hp == 0)
      projectiles.remove(i);
  
  // delete dead enemies
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    if (e.hp == 0) {
      enemies.remove(i);
      items.add(randomItem(e));
      cash += 1000000000;
    }
  }
  
  // delete used items
  for (int i = items.size() - 1; i >= 0; i--)
    if (items.get(i).hp == 0)
      items.remove(i);
  
  minimap.render();
  
  fill(WHITE);
  textFont(monospaceFont, 15);
  text("FPS counter: " + round(frameRate) + " / 60", width - 100, height - 20);
  
  fill(WHITE);
  textAlign(RIGHT);
  textFont(monospaceFont, 50);
  text("$" + cash, width - 20, 50);
  
  if (keyE && freeE) {
    mode = Mode.UPGRADE;
    freeE = false;
  }
}
