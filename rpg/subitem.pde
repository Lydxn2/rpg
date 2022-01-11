class MedKitItem extends Item {
  MedKitItem(int roomR, int roomC, float x, float y) {
    super(roomR, roomC, x, y);
    this.setImage("data/images/medkit.png", 72, 48);
  }
}

class HandgunItem extends Item {
  HandgunItem(int roomR, int roomC, float x, float y) {
    super(roomR, roomC, x, y);
    this.setImage("data/images/handgun.png", 39, 15);
  }
}

class RifleItem extends Item {
  RifleItem(int roomR, int roomC, float x, float y) {
    super(roomR, roomC, x, y);
    this.setImage("data/images/rifle.png", 66, 14);
  }
}

class ShotgunItem extends Item {
  ShotgunItem(int roomR, int roomC, float x, float y) {
    super(roomR, roomC, x, y);
    this.setImage("data/images/shotgun.png", 60, 15);
  }
}

class SniperItem extends Item {
  SniperItem(int roomR, int roomC, float x, float y) {
    super(roomR, roomC, x, y);
    this.setImage("data/images/sniper.png", 72, 12);
  }
}

class FreezeItem extends Item {
  FreezeItem(int roomR, int roomC, float x, float y) {
    super(roomR, roomC, x, y);
    this.setImage("data/images/ice.png", 72, 12);
  }
}
