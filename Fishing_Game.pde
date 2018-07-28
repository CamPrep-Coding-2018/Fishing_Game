

ArrayList<Fish> fishes;
ArrayList<Fish> trashes;
Hook hook;
Boat playerBoat;
boolean catchAble;
int spawnInter;
int score = 0;
PVector hookPos;
PVector boatPos;
ArrayList<Fish> fishestodelete;
ArrayList<Fish> trashescaught;
ArrayList<Fish> fishescaught;
boolean reeling;



void setup() {

  size(1280, 720);
  fishes = new ArrayList<Fish>();
  trashes = new ArrayList<Fish>();
  fishestodelete = new ArrayList<Fish>();
  fishescaught = new ArrayList<Fish>();
  trashescaught = new ArrayList<Fish>();
  hook = new Hook();
  playerBoat = new Boat();

  for (int i = 0; i < 9; i++) fishes.add(new Fish());
  for (Fish f : fishes) f.fishSet();



  playerBoat.boatSet();
  hook.hookSet();
  spawnInter = millis();
}

void draw() {


  background(0, 100, 255);
  playerBoat.boatDraw();
  hook.hookDraw();

  hook.hookCaught();

  if (millis() > spawnInter + 1000) {
    Fish f = new Fish();
    f.fishSet();
    fishes.add(f);
    spawnInter = millis();
  }
  
  for (Fish f : fishes) {
    
    hook.hookHooked();
    f.fishDraw();
   
   
    if (f.fishPos.x > width || f.fishPos.x < 0) {
      fishestodelete.add(f);
    }
  }
  
  for (Fish f : fishestodelete) fishes.remove(f);


  textSize(30);
  if(score < 0) fill(255, 0, 0);
  else          fill(0,255,0);
  text("Score: " + score, 50, 100);
}
void keyPressed() {
  setKey(key, true);
}
void keyReleased() {
  setKey(key, false);
}
