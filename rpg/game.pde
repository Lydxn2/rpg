void doGame() {
  background(BLACK);
  
  map[roomR][roomC].render();
  
  for (Darkness d : darkness)
    d.render();
    
  for (Bullet b : bullets)
    { b.act(); b.render(); }
    
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
    
  // delete offscreen bullets
  for (int i = bullets.size() - 1; i >= 0; i--)
    if (bullets.get(i).hp == 0)
      bullets.remove(i);
  
  minimap.render();
}
