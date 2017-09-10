PShape s;
void setup() {
  size(400, 200);
  fill(255, 0, 0);
  noLoop();
}
void draw() {
  translate(50, 50);
  text("shape w contour", 0, -10);
  beginShape();
  fill(255, 0, 0);
  vertex(  0, 0);
  vertex(100, 0);
  vertex(100, 100);
  vertex(  0, 100);
  beginContour(); // begin contour
  vertex( 25, 25);
  vertex( 25, 75);
  vertex( 75, 75);
  vertex( 75, 25);
  endContour(); // end begin contour
  endShape(CLOSE);

  translate(200, 0);
  text("shape w/out contour", 0, -10);
  beginShape();
  fill(255, 0, 0);
  vertex(  0, 0);
  vertex(100, 0);
  vertex(100, 100);
  vertex(  0, 100);
  vertex( 25, 25); // no begin
  vertex( 25, 75);
  vertex( 75, 75);
  vertex( 75, 25);
  endShape(CLOSE); // no end
}