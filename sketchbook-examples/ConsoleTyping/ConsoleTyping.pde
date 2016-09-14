/** console typing
 *  2016-09-13 Jeremy Douglass
 *  Processing 3.2.1
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