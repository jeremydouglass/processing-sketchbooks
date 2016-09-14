/**
 * Change resolution while in fullScreen mode -- cropped
 * 2016-09-14 Processing 3.2.1
 *
 * Use image to display a PGraphics object,
 * call PGraphics.setSize to change resolution.
 * Press any key to cycle resolutions in this sketch.
 * Also works in non-fullScreen mode.
 */
PGraphics pg;
int scaleWidth;
int scaleHeight;
PVector cropOffset;

void setup() {
  fullScreen();
  // size(640,320);
  pg = createGraphics(320, 160, JAVA2D);
  cropScale();
  pgDraw(pg);
  loop();
}

void draw() {
  background(128);
  // image(pg,0,0, width, height);
  image(pg, cropOffset.x, cropOffset.y, scaleWidth, scaleHeight);
}

void keyTyped() {
  if (pg.width==width) {
    pg.setSize(320, 160);
  } else if (pg.width==320) {
    pg.setSize(640, 320);
  } else {
    pg.setSize(width, height);
  }
  cropScale();
  pgDraw(pg);
}

void pgDraw(PGraphics pg) {
  pg.beginDraw();
  pg.background(0);
  pg.stroke(255);
  pg.rect(0, 0, pg.width/4, pg.height/4);
  pg.ellipse(pg.width/2, pg.height/2, pg.width/2, pg.height/2);
  pg.endDraw();
}

void cropScale() {
  float screenRatio = width/height;
  float pgRatio = pg.width/pg.height;
  if (pgRatio == screenRatio) {
    scaleWidth = width;
    scaleHeight = height;
  }
  cropOffset = new PVector(0,0);
  if (pgRatio > screenRatio) {  //// page is wider
    scaleHeight = height;
    scaleWidth = int(ceil(pg.width*height/pg.height));
    cropOffset = new PVector( -(scaleWidth-width)/2, 0 );
    println("page wider: ", scaleWidth, scaleHeight, cropOffset.x, cropOffset.y);
  } else {
    scaleWidth = width;
    scaleHeight = int(ceil(height/pgRatio));
    cropOffset = new PVector( 0, -(scaleHeight-height)/2 );
    println("page taller: ", scaleWidth, scaleHeight, cropOffset.x, cropOffset.y);
  }
}