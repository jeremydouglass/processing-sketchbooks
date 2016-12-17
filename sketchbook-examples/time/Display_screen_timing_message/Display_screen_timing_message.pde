/*
 * Display a screen timing message
 * 2016-08-06  Processing 3.2.1
 */
float doneTime = 0;
void draw() {
  background(192);
  translate(width/2,height/2);
  textAlign(CENTER,CENTER);
  if(doneTime = 0){
    text("Timing...\n" + millis()/1000, 0, 0);
  } else {
    text("Done at\n" + doneTime + " seconds", 0, 0);
  }  
}
void keyPressed() {  
  doneTime = millis()/1000.0;
  println("Done at " + doneTime + " seconds");
} 