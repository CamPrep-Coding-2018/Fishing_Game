class Hook {


  boolean hooked;
  boolean casting;
  boolean reeling;
  boolean correct;
  int castTimer;
  int reelTimer;
  float difficulty;

  Fish on_line;

  void hookSet() {
    hookPos = new PVector(boatPos.x, 0);
    difficulty = .3;
    casting = false;
    reeling = false;
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

    if (w_key) { 
      hookPos.y -= 3; 
      casting = false;
    }
    




    strokeWeight(2);
    if ((hookPos.x > boatPos.x - 100 && hookPos.x < boatPos.x + 100)) {
      fill(0);
      line(boatPos.x, boatPos.y, hookPos.x, hookPos.y);

      catchAble = true;
    } else {

      catchAble = false;    

      fill (255, 0, 0);
      text("Out of Bounds", hookPos.x, hookPos.y);
    }
  }


// *********************** HOOKING THE FISH ***********************
  void hookHooked() {
      for (Fish f : fishes) {
        if ((hookToFish(hookPos, f.fishEye, int(f.fishSize.x / 5))) && on_line == null && !casting) {
          on_line = f;
          on_line.hooked = true;
          
        }           
      }
  }



// *********************** CATCHING THE FISH *********************** 

  void hookCaught() {
    if (on_line != null) {
      if (hookPos.y <= boatPos.y + 45) {  
        if (int(playerText) == on_line.fishAns) {
          
          fishescaught.add(on_line);
          fishestodelete.add(on_line);
          on_line = null;
          score = fishescaught.size() * 10 - trashescaught.size() * 50;
          playerText = "";
        }
        
        else{
          on_line.hooked = false;
          on_line = null;
          textSize(200);
          fill(255,0,0);
          text("Fish Lost!", 200, height/2);
          
          playerText = "";
          
          
        }
      }
    }
  }

  void hookCast() {

    if (casting && on_line == null) {
      if (millis() < castTimer + 3500) {
        hookPos.y += 3;
      } else {
        casting = false;
      }
    }
  }
  
  void hookReel(){
    if(on_line != null){
      if(hookPos.y >= boatPos.y + 45){
        hookPos.y -= difficulty;
        reeling = true;
      }
      else if(hookPos.y <= boatPos.y){
        reeling = false;
        on_line.hooked = false;
        on_line = null;
      }
      
    }
  }
  
}
