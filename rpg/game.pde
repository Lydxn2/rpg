void doGame() {
  background(BLACK);
  
  map[roomR][roomC].render();
  
  hero.act(); hero.render();
  
  for (Door d : map[roomR][roomC].doors) {
    if (d.isTouching(hero)) {
      switch (d.type) {
      case 0: // up
        roomR--;
        hero.loc.y += Room.DIM - 5 - hero.sz;
        break;
      case 1: // down
        roomR++;
        hero.loc.y -= Room.DIM - 5 - hero.sz;
        break;
      case 2: // left
        roomC--;
        hero.loc.x += Room.DIM - 5 - hero.sz;
        break;
      case 3: // right
        roomC++;
        hero.loc.x -= Room.DIM - 5 - hero.sz;
        break;
      }
    }
  }
  
  for (Darkness d : darkness)
    d.render();
  
  minimap.render();
}
