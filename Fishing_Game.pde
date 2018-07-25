
ArrayList<Fish> fishes;
Hook hook;
Boat playerBoat;
boolean catchAble;
int spawnInter;


void setup(){
  size(1280,720);
  fishes = new ArrayList<Fish>();
  hook = new Hook();
  playerBoat = new Boat();
  
  for(int i = 0; i < 10; i++) fishes.add(new Fish());
  for (Fish f : fishes) f.fishSet();
  
  
  
  playerBoat.boatSet();
  spawnInter = millis();
}

void draw(){
  
  ArrayList<Fish> fishestodelete = new ArrayList<Fish>();
  background(0,100,255);
  
    if(millis() > spawnInter + 1000){
      Fish f = new Fish();
      f.fishSet();
      fishes.add(f);
      spawnInter = millis(); 
    }
    for (Fish f : fishes) {
    f.fishDraw();
    if(f.fishPos.x > width || f.fishPos.x < 0){
      fishestodelete.add(f);
    }
  }
  for (Fish f : fishestodelete) fishes.remove(f);
   
  
  playerBoat.boatDraw();
  hook.hookDraw();
}
void keyPressed(){
  setKey(key, true);
}
void keyReleased(){
  setKey(key,false);
}
