
PImage background;
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
String playerText;



void setup() {

  size(1280, 720);
  fishes = new ArrayList<Fish>();
  trashes = new ArrayList<Fish>();
  fishestodelete = new ArrayList<Fish>();
  fishescaught = new ArrayList<Fish>();
  trashescaught = new ArrayList<Fish>();
  background = loadImage("underwaterbackground.jpeg");
  hook = new Hook();
  playerBoat = new Boat();
  playerText = "";
  for (int i = 0; i < 9; i++) fishes.add(new Fish());
  for (Fish f : fishes) f.fishSet();



  playerBoat.boatSet();
  hook.hookSet();
  spawnInter = millis();
}

void draw() {
  
  background(background);
  playerBoat.boatDraw();
  hook.hookDraw();
  textSize(30);
  text(playerText, width - 200, height - 600);

  

  

  if (millis() > spawnInter + 2000) {
    Fish f = new Fish();
    f.fishSet();
    fishes.add(f);
    spawnInter = millis();
  }
  
  for (Fish f : fishes) {
    
    
    hook.hookHooked();
    hook.hookReel(); //It's not a bug its a feature'
    hook.hookCaught();
    
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

  if (key == CODED) setCodedKey(keyCode, true);
  else setKey(key, true);
}
void keyReleased() {
  
    TextInput();

  
  
  if (key == CODED) setCodedKey(keyCode, false);
  else setKey(key, false);
}
