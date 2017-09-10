/**
 * Turtle3D RectBox
 * 2017-02-07 Jeremy Douglass - Processing 3.2.3
 * https:// forum.processing.org/two/discussion/20706/how-3d-turtle-like-in-logo-but-3d-math-problem
 */
import peasy.*;
PeasyCam camera;

void setup(){
  size(300,300, P3D);
  // focus the cam on the center of the box
  camera = new PeasyCam(this, 25, 25, -25, 100);
}

void draw(){
  background(192);
  pushMatrix();
    tRectBox(50);
  popMatrix();
}

void tRectBox(int x){
  for(int i=0; i<4; i++){
   tRect(x);
   tStep(x);
   rotateY(HALF_PI);
  }
}

void tRect(int x){
  for(int i=0; i<4; i++){
   tLine(x);
   rotateZ(HALF_PI);
  }
}

void tStep(int x){
  translate(x,0,0);
}

void tLine(int x){
  line(0,0,0,x,0,0);
  translate(x,0,0);
}