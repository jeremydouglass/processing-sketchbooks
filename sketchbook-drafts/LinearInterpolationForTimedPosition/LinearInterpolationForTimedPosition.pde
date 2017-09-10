/**
 * Linear interpolation for timed position
 * 2016-09-23 Jeremy Douglass
 * Processing 3.2.1
 * forum.processing.org/two/discussion/18268/move-object-over-specified-time-period
 */
 
float x,y;
float startX,startY, endX,endY;
float timeSpan;

void setup() {
  size(800,800);
  startX = width/2;
  startY = height/2;
  endX = 100;
  endY = 100;
  timeSpan = 2000.0;
}
 
void draw() {
  background(255);
  float timePosition = millis()/timeSpan % 1;
  x = lerp(startX, endX, timePosition);
  y = lerp(startY, endY, timePosition);
  println(x,y,timeSpan);
  fill(255,150,0);
  noStroke();
  ellipse(x,y, 50,50);  
}