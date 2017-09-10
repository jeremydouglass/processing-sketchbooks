// https://forum.processing.org/two/discussion/21978/how-to-get-4-mirrored-quadrants
// 2017-04-14

PImage pi;
void setup() {
  size(400, 400);
  pi = loadImage("https://" + "processing.org/img/processing3-logo.png");
  pi.resize(200, 200);
  noLoop();
}

void draw() {
  background(0, 0, 255);

  pushMatrix();
  translate(width/2, height/2);
  image(pi, 0, 0); // lower right
  scale(-1, 1); // mirror left-right
  image(pi, 0, 0); // lower left
  scale(1, -1); // flip up-down
  image(pi, 0, 0); // upper left
  scale(-1, 1); // mirror left-right
  image(pi, 0, 0); // upper right
  popMatrix();
}