
import processing.sound.*;

boolean menu = false;
int gameTimer;
int gameTimer2;
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
SoundFile file;
SoundFile reelingsound;
PFont gameFont;

//replace the sample.mp3 with your audio file name here
String audioName = "Data/DockPlayground.mp3";
String path;
//String audioName2 = "Reeling.mp3";
//String reelingpath;


void setup() {
  size(1280, 720, P2D);
  gameFont = loadFont("PTMono-Bold-40.vlw");
  textFont(gameFont, 32);
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

  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.play();

  //path = sketchPath(audioName2);
  //reelingsound = new SoundFile(this, reelingpath);

  playerBoat.boatSet();
  hook.hookSet();
  spawnInter = millis();
  gameTimer = 0;
}

void draw() {

  background(background);


  if (millis()/1000 <= gameTimer + 60 && !menu) {
    text(str(abs(gameTimer - (millis()/1000))), width/2, 680);
    playerBoat.boatDraw();
    hook.hookDraw();

    if (playerText != "") {
      textSize(30);
      fill(255, 0, 0);
      text(playerText, width - 200, 100);
    } else {
      textSize(20);
      fill(255, 0, 0, 200);
      text("Input Answer to Catch", width - 300, 100);
    }



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
    if (score < 0) fill(255, 0, 0);
    else          fill(0, 255, 0);
    text("Score: " + score, 50, 100);
  } else menu = true;
  if (menu) {
    textSize(50);
    text("Your score: " + str(score), 400, height- 400);
    text("Press space to play again!", 300, height - 100);
    if (space_key) {
      gameTimer = (millis()) / 1000; 
      menu = false;
      reset();
    }
  }
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
