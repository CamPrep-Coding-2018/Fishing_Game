class Hook {


  boolean hooked;
  boolean caught;
  boolean casting;
  int castTimer;

  Fish on_line;

  void hookSet() {
    hookPos = new PVector(boatPos.x, 0);

    casting = false;
  }

  void hookDraw() {

    hookPos.x = boatPos.x;

    if (on_line != null) {
      on_line.fishPos = hookPos.copy();
    }

    if (keyPressed && key == ' ' && !casting && hookPos.y <= 50) { 
      casting = true;
      castTimer = millis();
    }
    hookCast();

    if (w_key){ hookPos.y -= 3; 
    casting = false;
    }




    strokeWeight(2);
    if ((hookPos.x > boatPos.x - 100 && hookPos.x < boatPos.x + 100)) {
      line(boatPos.x, boatPos.y, hookPos.x, hookPos.y);

      catchAble = true;
    } else {

      catchAble = false;    

      fill (255, 0, 0);
      text("Out of Bounds", hookPos.x, hookPos.y);
    }
  }

  void hookHooked() {
    if (catchAble) {
        for (Fish f : fishes) {
          if ((hookToFish(hookPos, f.fishEye, int(f.fishSize.x / 5))) && on_line == null && !casting) {
            f.caught = true;
            on_line = f;
          }
            else f.caught = false;
          }
      }
    }
  

  void hookCaught() {
    if (mousePressed) {
      if (on_line != null) {
        if (hookPos.y <= boatPos.y + 45 && hookPos.x <= boatPos.x + 100 && hookPos.x >= boatPos.x - 100) {     
          if(!on_line.trash) fishescaught.add(on_line);
          else trashescaught.add(on_line);
          
          fishestodelete.add(on_line);
          on_line = null;
          caught = true;
          score = fishescaught.size() * 10 - trashescaught.size() * 100;
        }
      }
    } else caught = false;
  }

  void hookCast() {


    if (casting && on_line == null) {
      if (millis() < castTimer + 3000) {
        hookPos.y += 3;
      } else {
        casting = false;
      }
    }
  }
}
