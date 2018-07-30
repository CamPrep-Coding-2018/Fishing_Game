boolean w_key;
boolean a_key;
boolean s_key;
boolean d_key;
boolean l_key;
boolean one_key;
boolean two_key;
boolean three_key;
boolean four_key;
boolean five_key;
boolean six_key;
boolean seven_key;
boolean eight_key;
boolean nine_key;
boolean zero_key;
boolean space_key;
boolean BACKSPACE_key;
boolean DELETE_key;



boolean setKey(char key_code, boolean state){
  switch(key_code){
    case 'w': return w_key = state;
    case 'a': return a_key = state;
    case 's': return s_key = state;
    case 'd': return d_key = state;
    case 'l': return l_key = state;
    case ' ': return space_key = state;
    case '1': return one_key = state;
    case '2': return two_key = state;
    case '3': return three_key = state;
    case '4': return four_key = state;
    case '5': return five_key = state;
    case '6': return six_key  = state;
    case '7': return seven_key = state;
    case '8': return eight_key = state;
    case '9': return nine_key = state;
    case '0': return zero_key = state;
    
    
  default:
    return state;
  }
}
boolean setCodedKey(int key_code, boolean state) {
  switch(key_code) {
    case DELETE: return DELETE_key = state;
    case BACKSPACE: return BACKSPACE_key = state;
    
    default: return state;
    }
}
