/**
 * Draw a Mask example
 * 2016-11-01 Processing 3.2.1
 **/
PImage photo;
PGraphics maskImage;
void setup() {
  size(512, 512);
  photo = loadImage("https://forum.processing.org/processing-org.jpg");
  // create mask
  maskImage = createGraphics(512,512);
  maskImage.beginDraw();
  maskImage.triangle(30, 480, 256, 30, 480, 480);
  maskImage.endDraw();
  // apply mask
  photo.mask(maskImage);
}
void draw() {
  // show masked image
  image(photo, 0, 0);
}