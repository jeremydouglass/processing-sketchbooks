// PGraphicsSelector
// use the beginDrawAt() command to select a new PGraphics buffer for normal drawing commands
// by Alex_Pr revised by Jeremy Douglass
// https://forum.processing.org/two/discussion/22808/draw-on-pgraphics-without-prefixing

PGraphics pgMine;
PGraphics PGDEFAULT;
void setup() {
  size(500, 500);
  pgMine = createGraphics(100, 200);
  PGDEFAULT = g;
}
void draw() {
  background(255);
  // draw 1 on canvas
  stuff();
  // draw 2 on PGraphics with background
  beginDrawAt(pgMine);
  background(100);
  stuff();
  endDrawAt(pgMine);
  image(pgMine, 300, 200);
  // draw 3 on canvas
  translate(100, 50);
  stuff();
}

void stuff() {
  line(0, 0, 100, 100);
  line(100, 100, 0, 200);
}

void beginDrawAt(PGraphics pg) {
  pg.beginDraw();
  g = pg;
}

void endDrawAt() { 
  endDrawAt(g);
}
void endDrawAt(PGraphics pg) {
  pg.endDraw(); 
  g = PGDEFAULT;
}