boolean hookToFish(PVector mouse, PVector target_pos, int majaxis, int minaxis){
  boolean collide;
  float distance = sqrt(sqrt(mouse.x - target_pos.x) + sqrt(mouse.y - target_pos.y));
  if(distance <= target_pos.x + majaxis || distance >= target_pos.x - majaxis || distance >= target_pos.y - minaxis || distance <= target_pos.y + minaxis){
    collide = true;
  }
  else collide = false;
  
  return collide;
  

}
