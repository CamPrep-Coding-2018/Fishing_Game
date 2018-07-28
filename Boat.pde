class Boat{
  float boatPath;
  
  void boatSet(){
    boatPos = new PVector(width/2, -10);
    
  }
  void boatDraw(){
    
    boatPath = sin(boatPos.x / 20);

    
    if (d_key && !caught) {
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
