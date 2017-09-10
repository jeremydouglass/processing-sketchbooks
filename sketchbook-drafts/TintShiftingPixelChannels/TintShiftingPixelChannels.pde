/**
 * Tint Shifting Pixel Channels
 * 2016-11-18 Jeremy Douglass - Processing 3.2.3
 * https:// forum.processing.org/two/discussion/18999/0/#Form_Comment
 **/

PImage img;
int offset;

void setup() {
  size(500, 500);
  img = loadImage("https://processing.org/img/processing3-logo.png");
}

void draw() {
  offset = (width/2 - mouseX);
  background(0);
  if (!keyPressed) {
    tint(0, 0, 255, 128);
    image( img,  offset, 0);
    tint(0, 255, 0, 128);
    image( img, 0, 0);
    tint(255, 0, 0, 128);
    image( img, -offset, 0);
  } else {
    tint(255, 255, 255, 255);
    image( img, 0, 0);
  }
}