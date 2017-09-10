PShape s;
void setup() {
  frameRate(50);
  size(400, 200);
  fill(255, 0, 0);
  noLoop();
}
void draw() {
  translate(50, 50);
  text("PShape w contour", 0, -10);
  s = createShape();
  s.beginShape();
  s.fill(255, 0, 0);
  s.vertex(  0, 0);
  s.vertex(100, 0);
  s.vertex(100, 100);
  s.vertex(  0, 100);
  s.beginContour();
  s.vertex( 25, 25);
  s.vertex( 25, 75);
  s.vertex( 75, 75);
  s.vertex( 75, 25);
  s.endContour();
  s.endShape(CLOSE);
  shape(s, 0, 0);

  translate(200, 0);
  text("PShape w/out contour", 0, -10);
  s = createShape();
  s.beginShape();
  s.fill(255, 0, 0);
  s.vertex(  0, 0);
  s.vertex(100, 0);
  s.vertex(100, 100);
  s.vertex(  0, 100);
  s.vertex( 25, 25);
  s.vertex( 25, 75);
  s.vertex( 75, 75);
  s.vertex( 75, 25);
  s.endShape(CLOSE);
  shape(s, 0, 0);
}