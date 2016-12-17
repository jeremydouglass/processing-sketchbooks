// https:// forum.processing.org/two/discussion/18731/duplicate-edges-in-sphere#latest
// 2016-10-26 Processing 3.2.1
int sDetail;
float SPEED = 2000;

void setup() {
  size(200, 200, P3D);
  colorMode(HSB, 6.0, 1.0, 1.0, 1.0);
  noFill();
} 
void draw()
{ // For tweaking
  translate(width/2, height/2);  
  background(0);
  stroke(0.0, 0.4, 1.0, 0.5);
  rotateX(-0.1);
  rotateY(0.01*millis()/100);
  rotateZ(0.003*millis()/100);
  strokeWeight(5);
  sDetail = 1 + (int)(4+4*sin(PI+millis()/(SPEED/4)));
  sphereDetail(sDetail);
  println(sDetail);
  sphere(75);
}