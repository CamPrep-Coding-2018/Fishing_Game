class Fish{

PVector fishPosPre;
PVector fishPosPost;
boolean moveDir; //False is left, True is right.
float fishSpeed;
int[] fishColor;

float fishPath;
int pathD;
PVector fishSize;
PVector fishEye;
boolean caught;
boolean reeled;
boolean reeling;

  void fishSet(){
    fishPosPre = new PVector(0,0);
    fishPosPost = new PVector(0,0);
    fishColor = new int[3];
    fishEye = new PVector();
    fishSize = new PVector((int(random(40, 75))), int(random(25,50)));
    
    float initPosx = random(1);
      if (initPosx < .5){ 
        fishPosPre.x = width;
        moveDir = false;
      }
      else {
        fishPosPre.x = 0;
        moveDir = true;
      }       
      
     float initPosy = int(random(1, 31));
       fishPosPre.y = initPosy * 24;
       
      fishColor[0] = int(random(255));
      fishColor[1] = int(random(255));
      fishColor[2] = int(random(255));
      
      fishSpeed = 4000/ (fishSize.x * fishSize.y);
      pathD = int(random(90,120));
      
  }
  
  void fishDraw(){
    
    
    
    if (moveDir){ fishPosPre.x += fishSpeed; fishEye.x = fishPosPre.x + fishSize.x * (3/4);}
    if (!moveDir){ fishPosPre.x -= fishSpeed; fishEye.x = fishPosPre.x - fishSize.x * (3/4);}
    
    fishPath = 40 * sin(fishPosPre.x / pathD);
    fishPosPost.y = fishPosPre.y + fishPath;
    fishPosPost.x = fishPosPre.x;
    
    fill(fishColor[0], fishColor[1], fishColor[2]);
    strokeWeight(3);
    ellipse(fishPosPost.x, fishPosPost.y, fishSize.x, fishSize.y); //Fish body
    fill(255);
    
    
    ellipse(fishPosPost.x, fishPosPost.y, fishSize.x/10, fishSize.y/10); //eye/mouth targets

      
    }
    //*********************************** Out of Order
  //  boolean fishCaught(){
  //    if(hookToFish(hookPos, fishEye, int(fishSize.x/10), int(fishSize.y/10))){
  //      return caught = true;     
  //    }
  //    else return caught = false;
  //  }
  //  void fishReeling(){
  //    if (caught){ 
  //      fishPosPre = hookPos;
  //      reeling = true;
  //  }
  //  else reeling = false;
  //}
}
