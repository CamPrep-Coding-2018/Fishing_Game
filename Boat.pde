class Boat{
   //Calculated from the bottom middle of the boat
  float boatPath;
  
  void boatSet(){
    boatPos = new PVector(0,-10);
    
  }
  void boatDraw(){
    
    boatPath = sin(boatPos.x / 20);

    
    if (d_key) {
      boatPos.x += 3 ;
      boatPos.y += boatPath;
    }
    if (a_key) {
      boatPos.x -= 3 ;
      boatPos.y -= boatPath;
    }
    fill(#3E2007);
    ellipse(boatPos.x, boatPos.y, 200, 90);
  }
  
}
