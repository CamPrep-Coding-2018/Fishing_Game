
import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

ArrayList<fish> fishes;


void setup(){
  size(1280,720);
  fishes = new ArrayList<fish>();
  for(int i = 0; i < 10; i++) fishes.add(new fish());
  
  for (fish f : fishes) f.fishSet();
}
void draw(){
  ArrayList<fish> fishestodelete = new ArrayList<fish>();
  background(0,100,255);
  
  for (fish f : fishes) {
    f.fishDraw();
    if(f.fishPos.x > width || f.fishPos.x < 0){
      fishestodelete.add(f);
    }
  }
  for (fish f : fishestodelete) fishes.remove(f);
   
   
}
