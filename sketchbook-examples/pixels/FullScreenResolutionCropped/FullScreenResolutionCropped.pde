/**
 * FullScreen Resolution -- cropped
 *
 * Change the apparent resolution while in fullScreen mode.
 * Uses a PGraphics object, call PGraphics.setSize()
 * to change the pixel dimensions, then use image() to
 * stretch the pixels to the screen space.
 * This effect also works in non-fullScreen mode.
 * Note that it is a visual effect -- not memory-efficient.
 *
 * Rather than force scaling the image, this 'cropped' version
 * uses letterboxing to fit the image into the screen space
 * while preserving the original aspect ratio.
 * 
 * Press any key to cycle resolutions in this sketch.
 *
 * @author Jeremy Douglass
 * @since 2016-09-14
 * Processing 3.2.1
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