// Countdown Timer
// an event changes the draw state for a certain amount of time
// https://forum.processing.org/two/discussion/19514/pause-draw

PImage img;
// timer variables
float stoptime, wait;

void setup() {
  size(512, 512);
  img = loadImage("https://processing.org/img/processing3-logo.png");
  wait = 4000; // delay in milliseconds
}

void draw() {
  background(0);
  if (keyPressed) { // fake event -- check for audio event on this line
    stoptime = millis() + wait; // set future time = now + wait
  }
  if(stoptime > millis()){ // the timer is running!
    image(img,0,0);
  } else { // the time is not running!
    ellipse(width/2,height/2,width/2,width/2);
  }
  timerTextDisplay();
}

void mouseClicked(){
  // another event example 
  stoptime = millis() + wait;
}
 
void timerTextDisplay(){
  // how long has the sketch been running? millis
  text((float)millis()/1000, 10, 24);
  // how long does the time have left?
  fill(255,0,0);
  text(max(0,(stoptime - millis()))/1000, 10, 36);
  // when will the timer stop? saved millis variable
  fill(255);
  text(stoptime/1000, 10, 48);
} 
 