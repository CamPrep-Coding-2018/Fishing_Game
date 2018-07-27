boolean w_key;
boolean a_key;
boolean s_key;
boolean d_key;
boolean space_key;

boolean setKey(char key_code, boolean state){
  switch(key_code){
    case 'w': return w_key = state;
    case 'a': return a_key = state;
    case 's': return s_key = state;
    case 'd': return d_key = state;
    case ' ': return space_key = state;
  
  default:
    return state;
  }
}
