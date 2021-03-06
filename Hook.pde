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
    difficulty = .4; // Modify 
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
        if(int(playerText) != on_line.fishAns){
          on_line.hooked = false;
          on_line = null;
          Display_Text("Fish Lost!", "red");
          
          playerText = "";
        }
        else if (int(playerText) == on_line.fishAns) {
          
          fishescaught.add(on_line);
          fishestodelete.add(on_line);
          on_line = null;
          score = fishescaught.size() * 10;
          Display_Text("Fish Caught!", "green");
          playerText = "";
          
        }
      }
    }
  }

  void hookCast() {

    if (casting && on_line == null) {
      if (hookPos.y < height*.8) { // millis() < castTimer + 3500) {
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
        //reelingsound.play();
      }
      else if(hookPos.y <= boatPos.y){
        reeling = false;
        on_line.hooked = false;
        on_line = null;
      }
      
    }
  }
  
}
