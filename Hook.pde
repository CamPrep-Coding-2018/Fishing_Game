class Hook{
  
PVector hookPos;
PVector lastIn;


void hookSet(){
  
}
void hookDraw(){
  hookPos = new PVector(mouseX, mouseY);
  lastIn = new PVector ();
  
  strokeWeight(2);
  if ((mouseX > playerBoat.boatPos.x - 100 && mouseX < playerBoat.boatPos.x + 100)){
  line(playerBoat.boatPos.x, playerBoat.boatPos.y, hookPos.x, hookPos.y);
  catchAble = true;
  }
  else {
    fill (255,0,0);
    catchAble = false;
    line(playerBoat.boatPos.x, playerBoat.boatPos.y, lastIn.x, lastIn.y);
    text("Out of Bounds", mouseX, mouseY);
  }

}
}
