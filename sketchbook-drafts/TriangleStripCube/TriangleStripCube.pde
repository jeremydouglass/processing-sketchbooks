/**
 * Triangle Strip Cube
 * 2016-11-11 Jeremy Douglass - Processing 3.2.3
 * https:// forum.processing.org/two/discussion/18996/how-to-draw-a-cube-with-triangle-strip
 **/
 
void setup() {
  size(500, 500, P3D);
  stroke(0,255,0);
  noFill();
  noLoop();
}
void draw() {
  background(0);
  translate(width/2,height/2);
  //// camera
  rotateZ(-PI/32);
  rotateY(PI/32);
  //// sheet
  // translate(0,0,140);
  // drawTriangleSheet(10,10,28,28);
  //// cube
  drawCube(10, 28);
}

void drawCube(int units, float size){
  pushMatrix();
    //// front and back
    drawFacePair(units, size);
    rotateX(HALF_PI);
    //// top and bottom
    drawFacePair(units, size);
    rotateY(HALF_PI);
    //// left and right
    drawFacePair(units, size);
  popMatrix();
}

void drawFacePair(int units, float size){
  pushMatrix();
    translate(0,0,units*size/2);
    drawTriangleSheet(units, units, size, size);
    translate(0,0,-units*size);
    drawTriangleSheet(units, units, size, size);
  popMatrix();
}

void drawTriangleSheet(int cols, int rows, float w, float h){
  pushMatrix();
  translate(-cols*w/2,-rows*h/2);
  for (int y = 0; y < rows; y++) {
    beginShape(TRIANGLE_STRIP); 
    for (int x = 0; x <= cols; x++) {
      vertex(x*w, y*h);
      vertex(x*w, y*h + h); 
    }
    endShape();
  }
  popMatrix();
}