boolean hookToFish(PVector mouse, PVector target_pos, int majaxis){
  boolean collide;
  
  stroke(255);
  line(mouse.x, mouse.y, target_pos.x, target_pos.y);
  
  float distance = sqrt(pow((mouse.x - target_pos.x), 2) + pow((mouse.y - target_pos.y),2));
  if(distance <= majaxis) {
    collide = true;
  }
  else collide = false;
  
  return collide;
  

}
