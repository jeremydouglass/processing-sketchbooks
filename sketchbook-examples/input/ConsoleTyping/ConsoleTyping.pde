/** 
 * Console Typing
 *
 * Typed keys are printed directly to the console.
 * Does not support backspace / delete due to the
 * nature of the console.
 *
 * @author Jeremy Douglass
 * @since 2016-09-13
 * Processing 3.2.1
 */
void setup(){
  textAlign(CENTER,CENTER);
  textSize(32);
}
void draw(){
  background(0);
  text(key,width/2,height/2);
}
void keyTyped(){
  print(key);
}