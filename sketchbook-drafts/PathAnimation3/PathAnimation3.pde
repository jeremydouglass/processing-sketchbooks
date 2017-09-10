/**
 * Path Animation 3 - relative steps
 * 2017-02-08 Jeremy Douglass - Processing 3.2.3
 * https:// forum.processing.org/two/discussion/20609/indoor-navigation
 */
void setup(){
  size(200,200);
  frameRate(1);
}
void draw(){
  background(192);
  // animate based on frameCount
  drawPathToRoomOne(10,10,(frameCount-1)%4);
}
void drawPathToRoomOne(float x, float y, int stepCount){
  pushMatrix();
  translate(x,y);
  if(stepCount>0){ step(100,0); }
  if(stepCount>1){ step(0,100); }
  if(stepCount>2){ step(50,50); }
  ellipse(0,0,10,10);
  popMatrix();
}

void step(int x, int y){
  // draw a straight line and follow it :)
  line(0,0,x,y);
  translate(x,y);
}