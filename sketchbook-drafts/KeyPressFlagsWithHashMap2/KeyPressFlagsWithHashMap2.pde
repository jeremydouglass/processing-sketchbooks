/**
 * Keypress Flags with HashMap
 * -- press 1, 2, 3 to flip each between true/false.
 * 2016-09-29 Jeremy Douglass
 * Processing 3.2.1
 * https:// forum.processing.org/two/discussion/18261/how-to-choose-a-movie-file-to-play
 */

import java.util.Map;
HashMap<Character,Boolean> flags = new HashMap<Character,Boolean>();
String flagList = "";
String flagState = "";


void setup(){
  //// pre-populate hashmap with lower-case alphabet
  for(int i=97; i<123; i++){ // 90/91
    flags.put((char)i, Boolean.FALSE);
    flagList = flagList + (char)i;
  }
  noLoop();
}

void keyReleased(){
  if(flags.get(key)!=null){
    flags.put(key, !(flags.get(key)));
  } else {
    flags.put(key, Boolean.TRUE);
    flagList = flagList + key;
  }
  redraw();
}

void draw(){
  flagState = "";
  for (Map.Entry me : flags.entrySet()) {
    if(me.getValue()==Boolean.TRUE){
      flagState = flagState + (char)(me.getKey());
    } else {
      flagState = flagState + '.';
    }
  }
  println(flagList);
  println(flagState);
}

//// Note testing the value is against Boolean.TRUE
//// rather than simple "==true" or "!" tests, because
//// Map.Entry.entrySet().getValue() returns Object, not a boolean.