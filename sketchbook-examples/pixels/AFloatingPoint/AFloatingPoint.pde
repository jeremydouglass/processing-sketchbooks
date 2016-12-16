/**
 * A Floating Point
 * 2016-12-14 Jeremy Douglass Processing 3.2.3
 * When we zoom in on a single point in a single pixel,
 * we see floating point locations between pixel steps being rendered.
 */

float offset;
void setup(){
  size(200,200);
}

void draw(){
  background(192);
  offset = millis()%1000/1000.0;
  pushMatrix();
    scale(200);
    point(0.5+offset, 0.5+offset);
  popMatrix();
  text(offset,10,10);
}