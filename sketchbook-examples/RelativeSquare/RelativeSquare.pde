/**
 * Relative Square
 *
 * This is an example of how *not* to implement relative drawing
 * -- if you want precision.
 * 
 * Using rotate() to turn before each draw introduces a tiny error
 * in the angle of each line, creating artifacts which add up to the
 * corners failing to meet.
 *
 * @author Jeremy Douglass
 * @since 2016-10-14
 * Processing 3.2.1
 * http://forum.processing.org/two/discussion/18545/translate-doesn-t-work-with-vertex
 */
 
PGraphics relSquare;

void setup() {
  size (200, 200);
  stroke(0);
  noFill();
  noLoop();
  relSquare = relativeSquare(width-40);
}
void draw() {
  background(255);
  image(relSquare, 20, 20);
}

PGraphics relativeSquare(float size){
  PGraphics pg = createGraphics(int(size+4),int(size+4));
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