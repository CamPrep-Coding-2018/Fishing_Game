class Fish{

PVector fishPos;
PVector fishEye;
int y;
PVector fishSize;
boolean moveDir; //False is left, True is right.
float fishSpeed;
int[] fishColor;

float fishPath;
int pathD;


boolean caught = false;
boolean reeled;
boolean reeling;
  
  void fishSet(){
    y = height/2;
    fishPos = new PVector(0, 0); 
    fishColor = new int[3];
    fishEye = new PVector();
    fishSize = new PVector((int(random(40, 75))), int(random(25,50)));
    
    float initPosx = random(1);
      if (initPosx < .5){ 
        fishPos.x = width;
        moveDir = false;
      }
      else {
        fishPos.x = 0;
        moveDir = true;
      }       
      
       y = int(random(1, 31));
       y = y * 24;
       
      fishColor[0] = int(random(255));
      fishColor[1] = int(random(255));
      fishColor[2] = int(random(255));
      
      fishSpeed = 4000 / (fishSize.x * fishSize.y);
      pathD = int(random(90,120));
      
  }
  
  void fishDraw(){
    
  if(!caught){
    fishPos.y = y + 60 * sin(fishPos.x / pathD); // Sinusoid for path
    fishEye = fishPos.copy();
    
    if (moveDir){ 
    fishPos.x += fishSpeed;
  }
    if (!moveDir){ 
     fishPos.x -= fishSpeed;
  } 
}    
  else{
    fishPos = hookPos;
    fishEye = hookPos;
  }
    
    
    fill(fishColor[0], fishColor[1], fishColor[2]);
    strokeWeight(3);
    ellipse(fishPos.x, fishPos.y, fishSize.x, fishSize.y); //Fish body
    fill(255);

    ellipse(fishEye.x, fishEye.y, fishSize.x/5, fishSize.y/5); //eye/mouth targets

      
    }

}
