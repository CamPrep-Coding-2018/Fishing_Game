class Hook {


  PVector lastIn;
  boolean hooked;
  boolean caught;

  Fish on_line;

  void hookDraw() {
    if(on_line != null) {
     on_line.fishPos = hookPos.copy();
    }
    
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
void hookHooked() {
    if (catchAble) {
      if(on_line == null){
      for (Fish f : fishes) {
        if (hookToFish(hookPos, f.fishEye, int(f.fishSize.x / 5))) {
          f.caught = true;
          on_line = f;
        }
        else f.caught = false;
      }
    }
    }
    
  }

  void hookCaught() {
    if (mousePressed) {
      if (on_line != null) {
        if (hookPos.y <= boatPos.y + 45 && hookPos.x <= boatPos.x + 100 && hookPos.x >= boatPos.x - 100) {         
          fishestodelete.add(on_line);
          on_line = null;
          caught = true;
        }
      }
    }else caught = false;

  }
}
