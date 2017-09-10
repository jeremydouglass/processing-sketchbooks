// https://forum.processing.org/two/discussion/22701/how-to-make-circles-with-stripes-pics-inside#latest
// in progress....

void setup() {
  size(400, 400);
  //rectMode(CENTER);
}
void draw() {
  ellipse(width/2,height/2,width-20,height-20);
  translate(10,10);
  drawStripes(width-20, height-20, 10, 5, 25);
}

void drawStripes(float w, float h, int sCount, int sMin, int sMax){
  float sx, sw = 0;
  for (int i=0; i<sCount; i++) {
    sx = map(i, 0, sCount-1, 0, w);
    sw = map(abs(i-(sCount)/2), 0, (sCount)/2, sMin, sMax);
    rect(sx, 0, sw, h);
  }
}