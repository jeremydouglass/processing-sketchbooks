/*
 * Pausable Timer
 * 
 * Click the mouse to start/stop. Records last pause time and accumulates
 * pause length; these things are used to display the active length.
 *
 * I originally tried to adapt a sketch by otterfamily from Reddit,
 * <a href="https://www.reddit.com/r/processing/comments/392l7n/how_to_make_a_pausable_timer/?st=isf9xc9s&sh=176ea25b">How to make a pausable timer</>
 * but adding display logic revealed that it had a subtle offset problem
 * of ~1 second and could never display the current time and total time
 * as the same, even if no pausing had occured since sketch start.
 * This seems to be true of a number of the designs that attempt accumulate active
 * time and have it match the millis() clock -- rather than recording a pause offset.
 *
 * @author Jeremy Douglass
 * @since 2016-08-28
 */

Boolean paused;
long currTime;     // total program run length in milliseconds -- a periodically updated snapshot of millis()
long pauseStart;    // time a pause begins
long pauseTotal;  // total pause length
long activeTotal; // total active length

void setup(){
  size(200,200);
  textAlign(CENTER, CENTER);

  paused = false;
  currTime = 0;
  pauseStart = 0;
  pauseTotal = 0;
}

void draw(){
  background(0);

  //// update timeframe
  currTime = millis();

  //// If paused, show the last pause time (frozen timer).
  //// If active, show current time minus total pause duration (offset timer).
  activeTotal = (paused) ? (pauseStart - pauseTotal) : (currTime - pauseTotal) ;
  
  //// display status
  text("Timer: click to pause/resume", width/2, height/4);
  text(activeTotal/1000.0, width/2, height/4*2);
  text(currTime/1000.0, width/2, height/4*3);
}

void mousePressed(){
  //// flip paused state on click
  paused = !paused;
  //// on pause, note beginning of pause segment
  if (paused == true)  { pauseStart =  currTime; }
  //// on resume, accumulate pause segment length into total pause time
  if (paused == false) { pauseTotal += currTime - pauseStart; }  
}