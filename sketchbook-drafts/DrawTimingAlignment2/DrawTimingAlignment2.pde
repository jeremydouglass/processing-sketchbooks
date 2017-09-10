/**
 * Draw Timing Alignment Slacker
 * 2016-11-15
 * Processing 3.2.3
 **/
 
int nextTime;
int step;
float frameError;
float alignWindow;

void setup() {
  // ...
  // ... insert time-consuming setup code
  // ...
  frameRate(60);
  step = 250; 
  frameError = 1.75;
  alignWindow = 1000/frameRate * frameError;
  // wait for first frame -- aligned it to step, it will occur between step and 2step-1
  nextTime = millis()-millis()%step + 2*step;
}

void draw() {
  if(millis() < nextTime){
    // skip drawing
    if(millis()+alignWindow < nextTime){
      print("*"); // a skipped frame
      return;
    // do nothing while running out the last partial frame with of clock time
    } else {
      while (millis()<nextTime) {}
      print("_"); // a partial frame aligned with a tight while loop
    }
  }
  println(millis()); // we are starting at the correct wall clock position
  // ...
  // ... insert draw code that takes well under 'step' to execute
  // ...
  nextTime = nextTime + step;
}