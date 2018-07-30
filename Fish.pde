class Fish {

  PVector fishPos;
  PVector fishEye;
  int fishProb1;
  int fishProb2;
  int fishAns;
  boolean solved;
  int y;
  PVector fishSize;
  boolean moveDir; //False is left, True is right.
  float fishSpeed;
  int[] fishColor;

  float fishPath;
  int pathD;


  boolean caught = false;
  boolean hooked;
  boolean reeling;

  void fishSet() {



    y = height/2;
    fishPos = new PVector(0, 0); 
    fishColor = new int[3];
    fishEye = new PVector();
    fishProb1 = int(random(23));
    fishProb2 = int(random(23));
    fishAns = fishProb1 * fishProb2;

    fishSize = new PVector((int(random(60, 100))), int(random(25, 45)));

    float initPosx = random(1);
    if (initPosx < .5) { 
      fishPos.x = width;
      moveDir = false;
    } else {
      fishPos.x = 0;
      moveDir = true;
    }       

    y = int(random(3, 28));
    y = y * 24;

    fishColor[0] = int(random(20));
    fishColor[1] = int(random(255));
    fishColor[2] = int(random(255));

    fishSpeed = 4000 / (fishSize.x * fishSize.y);
    pathD = int(random(90, 120));
  }

  void fishDraw() {
    
  fishEye = fishPos.copy();
    if (!hooked) {
      fishPos.y = y + 60 * sin(fishPos.x / pathD); // Sinusoid for path



      if (moveDir) fishPos.x += fishSpeed;
      if (!moveDir) fishPos.x -= fishSpeed;
    }
    else fishPos = hookPos;




    fill(fishColor[0], fishColor[1], fishColor[2]);
    strokeWeight(3);
    ellipse(fishPos.x, fishPos.y, fishSize.x, fishSize.y); //Fish body


    fill(255);
    ellipse(fishEye.x, fishEye.y, fishSize.x/5, fishSize.y/5); //eye/mouth targets
    textSize(20);
    textMode(CENTER);

    text(str(fishProb1) + " * " + str(fishProb2), fishPos.x - (fishSize.x/2), fishPos.y + 40);
  }
}
