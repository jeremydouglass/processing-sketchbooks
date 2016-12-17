/**
 * Draw Timing Alignment
 * 2016-10-12
 * Processing 3.2.1
 **/
 
int nextTime;
int step;
 
void setup() {
  // ...
  // time-consuming setup code
  // ...
  step = 500;
  // wait for first frame -- aligned to step, it will occur between step and 2step-1
  nextTime = millis()-millis()%step + 2*step;
}
 
void draw() {
  while (millis()<nextTime) {
    // do nothing while running out the 'slack' in the clock
  }
  println(millis()); // we are starting at the correct wall clock position
  // ...
  // draw code that takes well under 'step' to execute
  // ...
  nextTime = nextTime + step;
}