/*
 * Display a screen exit timing message
 * 2016-08-06
 */
boolean exiting = false;
float exitTime = 0;
void setup(){
  fullScreen();
}
void draw() {
  background(192);
  translate(width/2,height/2);
  textAlign(CENTER,CENTER);
  if(exiting==false){
    text("Timing...\n" + millis()/1000, 0, 0);
  } else {
    text("Exiting at\n" + exitTime + " seconds",0,0);
    if(exitTime + 5 < millis()/1000.0){
      exit();
    }
  }
}  
void keyPressed() {
  exitTime = millis()/1000.0;
  println("Exiting at " + exitTime + " seconds");
  exiting = true;   //// reveal screen exit message in draw loop
}

//// or, from keyPressed, call a thread:
////    
////   thread("doExit");
////
//// ...and define it in a top-level function:
////
//// void doExit(){
////   delay(5000);
////   exit();
//// }
////