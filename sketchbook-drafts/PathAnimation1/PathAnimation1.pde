/**
 * Path Animation 1 - switch with no breaks
 * 2017-02-08 Jeremy Douglass - Processing 3.2.3
 * https:// forum.processing.org/two/discussion/20609/indoor-navigation
 */
void setup() {
  size(200, 200);
  frameRate(1);
}
void draw() {
  background(192);
  drawPathToRoomOne(10, 10, (frameCount-1)%4);
}
void drawPathToRoomOne(float x, float y, int step) {
  pushMatrix();
  translate(x, y);
  switch(step) {
  case 2: 
    line(100, 100, 150, 150);
    ellipse(150, 150, 10, 10);
  case 1: 
    line(100, 0, 100, 100);
  case 0: 
    line(0, 0, 100, 0);
  }
  popMatrix();
}