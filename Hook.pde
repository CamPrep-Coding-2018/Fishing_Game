class Hook{
  

PVector lastIn;
boolean hooked;


void hookSet(){
  
}
void hookDraw(){
  hookPos = new PVector(mouseX, mouseY);
  lastIn = new PVector ();
  
  strokeWeight(2);
  if ((mouseX > boatPos.x - 100 && mouseX < boatPos.x + 100)){
  line(boatPos.x, boatPos.y, hookPos.x, hookPos.y);
  
  catchAble = true;
  }
  else {
    
    catchAble = false;
    line(boatPos.x, boatPos.y, lastIn.x, lastIn.y);
    fill (255,0,0);
    text("Out of Bounds", mouseX, mouseY);
  }
  
}
  boolean hookHooked(){
    if(catchAble){
    for (Fish f: fishes){
      if(hookToFish(hookPos, f.fishEye, int(f.fishSize.x / 10), int(f.fishSize.y / 10))){
        f.fishPos = hookPos;
        hooked = true;
        
      }hooked = false;
    }
  }
  return hooked;
  }
  
  void hookCaught(){
    for (Fish f: fishes){
    if(hooked){
      if(hookPos.y <= boatPos.y + 45 && hookPos.x <= boatPos.x + 100 && hookPos.x >= boatPos.x - 100){
        fishestodelete.add(f);
      }
    } 
  }
  }
}