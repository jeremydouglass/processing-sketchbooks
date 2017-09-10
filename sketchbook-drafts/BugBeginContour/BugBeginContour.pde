// beginContour() and endContour doesnt work on shape
// https://github.com/processing/processing/issues/4978
// https://forum.processing.org/two/discussion/comment/97902

PShape s;

void setup()
{
  frameRate(50);
  size(600, 200);
  fill(255, 0, 0);
  noLoop();
}

void draw()
{
  translate(50, 50);
  text("contour shape", 0, -10);
  beginShape();
  fill(255, 0, 0);
  vertex(  0, 0);
  vertex(100, 0);
  vertex(100, 100);
  vertex(  0, 100);
  beginContour();
  vertex( 25, 25);
  vertex( 25, 75);
  vertex( 75, 75);
  vertex( 75, 25);
  endContour();
  endShape(CLOSE);

  translate(200, 0);

  text("PShape, identical", 0, -10);
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

  text("PShape, two added", 0, -10);
  s = createShape();
  s.beginShape();
  s.fill(255, 0, 0);
  s.vertex(  0, 0);
  s.vertex(100, 0);
  s.vertex(100, 100);
  s.vertex(  0, 100);
  s.vertex(  0, 0); // added
  s.beginContour();
  s.vertex( 25, 25);
  s.vertex( 25, 75);
  s.vertex( 75, 75);
  s.vertex( 75, 25);
  s.vertex( 25, 25); // added
  s.endContour();
  s.endShape(CLOSE);
  shape(s, 0, 0);
}