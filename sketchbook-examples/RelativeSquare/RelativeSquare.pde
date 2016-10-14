/**
 * Relative square with errors
 * 2016-10-14 Processing 3.2.1
 * https:// forum.processing.org/two/discussion/18545/translate-doesn-t-work-with-vertex
 **/
 
PGraphics relSquare;

void setup() {
  size (300, 300);
  stroke(0);
  noFill();
  noLoop();
  relSquare = relativeSquare(100.0);
}
void draw() {
  background(255);
  image(relSquare, width/2.0, height/2.0);
}

PGraphics relativeSquare(float size){
  PGraphics pg = createGraphics(int(size+2),int(size+2));
  pg.beginDraw();
    pg.translate(1,1);
    pg.stroke(255,0,0);
    for(int i=0; i<4; i++){
      pg.line(0, 0, size, 0);
      pg.translate(size,0);
      pg.rotate(HALF_PI);
    }
  pg.endDraw();
  return pg;
}