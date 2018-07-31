void Display_Text(String message, String colors){
 int timer = millis();
 textSize(100);
 if (colors == "red" || colors == "Red") fill(255, 0,0);
 if (colors == "green" || colors == "Green") fill(0, 255,0);
 if (colors == "blue" || colors == "Blue") fill(0, 0, 255);
 if(millis() <= timer + 3000){
   text(message, 200, height/2);
 }
} 
