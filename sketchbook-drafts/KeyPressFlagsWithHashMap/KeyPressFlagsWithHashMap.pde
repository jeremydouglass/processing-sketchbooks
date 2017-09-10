/**
 * Keypress Flags with HashMap
 * -- press 1, 2, 3 to flip each between true/false.
 * 2016-09-23 Jeremy Douglass
 * Processing 3.2.1
 * https:// forum.processing.org/two/discussion/18261/how-to-choose-a-movie-file-to-play
 */

import java.util.Map;
HashMap<Character,Boolean> flags = new HashMap<Character,Boolean>();

void setup(){
  flags.put('1', false);
  flags.put('2', false);
  flags.put('3', false);
  frameRate(3);
}

void keyReleased(){
  if(flags.get(key)!=null){
    flags.put(key, !(flags.get(key)));
  }
}

void draw(){
  for (Map.Entry me : flags.entrySet()) {
    if(me.getValue()==Boolean.TRUE){
      print(me.getKey(), "playing. ");
    }
  }
  println();
}

//// Note testing the value is against Boolean.TRUE
//// rather than simple "==true" or "!" tests, because
//// Map.Entry.entrySet().getValue() returns Object, not a boolean.