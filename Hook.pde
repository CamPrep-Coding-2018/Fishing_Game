class Hook {


  PVector lastIn;
  boolean hooked;
  boolean caught;


  void hookSet() {
  }
  void hookDraw() {
    hookPos = new PVector(mouseX, mouseY);
    lastIn = new PVector ();

    strokeWeight(2);
    if ((mouseX > boatPos.x - 100 && mouseX < boatPos.x + 100)) {
      line(boatPos.x, boatPos.y, hookPos.x, hookPos.y);

      catchAble = true;
    } else {

      catchAble = false;
      line(boatPos.x, boatPos.y, lastIn.x, lastIn.y);
      fill (255, 0, 0);
      text("Out of Bounds", mouseX, mouseY);
    }
  }
  boolean hookHooked() {
    if (catchAble) {
      for (Fish f : fishes) {
        PVector fishEye = f.fishPosPost.copy();
        fishEye.y += 40 * sin(f.fishPosPre.x / f.pathD);
        if (hookToFish(hookPos, fishEye, int(f.fishSize.x / 10))) {
          f.fishPosPost.x = hookPos.x;
          f.fishPosPost.y = hookPos.y - f.fishPosPost.y;
          hooked = true;
        }
        hooked = false;
      }
    }
    return hooked;
  }

  boolean hookCaught() {
    if (mousePressed) {
      if (hooked) {
        if (hookPos.y <= boatPos.y + 45 && hookPos.x <= boatPos.x + 100 && hookPos.x >= boatPos.x - 100) {
          caught = true;
        }
      }
    } else caught = false;
    return caught;
  }
}
