// https://forum.processing.org/two/discussion/21945/3d-tsp-traveling-salesperson-problem
// Jeremy Douglass 2017-04-18 Processing 3.2.3

void setup(){
  size(300,300,P3D);
  fill(0);
  frameRate(10);
}
void draw(){
  background(255);
  randomSeed(0);   // random points generated the same way each time
  translate(width/2,width/2,0);      // center on the point of rotation
  rotateY(radians(frameCount*.25));  // rotate -- further each frame
  for(int i=0; i<frameCount; i++){   // redraw points -- more points each frame
    pushMatrix();
    translate(random(-width/4,width/4),random(-width/4,width/4),random(-width/4,width/4));
    sphere(5);
    popMatrix();
  }
}