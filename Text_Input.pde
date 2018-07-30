String TextInput(){
if(playerText.length() <= 5){
  
  if (one_key){
    playerText = playerText + "1";
  }
  if(two_key){
    playerText = playerText + "2";
  }
  if(three_key){
    playerText = playerText + "3";
  }
  if(four_key){
    playerText = playerText + "4";
  }
  if(five_key){
    playerText = playerText + "5";
  }
  if(six_key){
    playerText = playerText + "6";
  }
  if(seven_key){
    playerText = playerText + "7";
  }
  if(eight_key){
    playerText = playerText + "8";
  }
  if(nine_key){
    playerText = playerText + "9";
  }
  if(zero_key){
    playerText = playerText + "0";
  }
  if(l_key) playerText = "";
}
  return playerText;
}
