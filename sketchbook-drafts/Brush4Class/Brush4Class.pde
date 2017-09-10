/**
 * Brush Strokes
 * 2016-11-01 Jeremy Douglass Processing 3.2.1
 **/
Brush brush;
void setup() {
  size(400, 200);
  stroke(64,64,64,192);
  strokeWeight(2);
  brush = new Brush(40, 3, 0.03);
}
void draw() {
  if (mousePressed == true) {
    brush.display();
  }
}
class Brush {
  PVector mouseV, pmouseV;
  int bwidth;
  int bspacing;
  float sensitivity;
  Brush( int width_, int spacing_, float sensitivity_){
    mouseV = new PVector(0.5,0.5);
    pmouseV = mouseV.copy();
    bwidth = width_;
    bspacing = spacing_;
    sensitivity = sensitivity_;
  }
  void display(){
    mouseV = mouseV.lerp(new PVector(mouseY-pmouseY, mouseX-pmouseX).setMag(1),sensitivity);
    for(int i=-bwidth/2; i<bwidth/2; i=i+bspacing){
      line(mouseX - (i*mouseV.x), mouseY + (i*mouseV.y), pmouseX - (i*pmouseV.x), pmouseY + (i*pmouseV.y));
    }
    pmouseV = mouseV.copy();
  }
}