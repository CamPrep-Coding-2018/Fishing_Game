class fish{

PVector fishPos;
boolean moveDir; //False is left, True is right.
float fishSpeed;
int[] fishColor;
int fishy;
float fishPath;

  void fishSet(){
    fishPos = new PVector(0,0);
    fishColor = new int[3];
    
    float initPosx = random(1);
      if (initPosx < .5){ 
        fishPos.x = width;
        moveDir = false;
      }
      else {
        fishPos.x = 0;
        moveDir = true;
      }       
      
     float initPosy = int(random(1, 31));
       fishPos.y = initPosy * 24;
       
      fishColor[0] = int(random(255));
      fishColor[1] = int(random(255));
      fishColor[2] = int(random(255));
      
      fishSpeed = random(1, 4);
      
      
  }
  
  void fishDraw(){
    
    if (moveDir){ fishPos.x += fishSpeed;}
    if (!moveDir){ fishPos.x -= fishSpeed;}
    
    fishPath = 40 * sin(fishPos.x / 120);
    
    fill(fishColor[0], fishColor[1], fishColor[2]);
   
    ellipse(fishPos.x, fishPos.y + fishPath, 40, 20);

  }
}
