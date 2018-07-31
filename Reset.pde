void reset(){

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
  score = 0;
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
  
  
}
