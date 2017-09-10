PGraphics pg;
float STEPTIME = 10;
int STEPALPHA = 1;
int stepAmt, stepTimeLast;

void setup() {
  size(100, 100);
  pg = createGraphics(100, 100);
  pg.beginDraw();
  pg.stroke(0);
  pg.strokeWeight(5);
  pg.fill(0);
  pg.endDraw();
}

void draw() {
  background(255);
  // draw simple brush strokes
  pg.beginDraw();
  pg.line(mouseX, mouseY, pmouseX, pmouseY);
  pg.endDraw();
  image(pg, 0, 0);
  // fade the brush surface
  fadeTimer();
}

void fadeTimer() {
  // has enough time passed to increment the fade?
  stepAmt = (int)((millis()-stepTimeLast)/STEPTIME);
  // fade that many steps
  if (stepAmt > 0) {
    fade(pg, stepAmt);
    stepTimeLast = millis();
  }
}

void fade(PGraphics pg, int amt) {
  pg.beginDraw();
  pg.loadPixels();
  // shift pixel alpha up
  for (int i = 0; i < width*height; i++) {
    if (((pg.pixels[i] >> 24) & 0xFF) >= 0+amt ) {
      pg.pixels[i] = (pg.pixels[i] - (amt<<24));
    }
  }
  pg.updatePixels();
  pg.endDraw();
}