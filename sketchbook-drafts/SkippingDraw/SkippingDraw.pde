// forum.processing.org/two/discussion/22478/trying-to-simulate-paint-app-in-processing-question-about-drawing-effect
// SkippingDraw

float tooFar;
float inX, inY, pinX, pinY;
boolean skip, farstep;
RandomJerkWalker rjw;

void setup() {
  size(400, 400);
  frameRate(10);
  reset();
}
void reset() {
  background(192);
  // center input
  inX=pinX=width/2;
  inY=pinY=height/2;
  // set jerkiness limit
  tooFar=15;
  // create random walk input
  rjw = new RandomJerkWalker(inX,inY,5,40);
}

void draw() {
  // clear screen every 100 frames
  // if (frameCount%100==0) {
  //   reset();
  // }
  // update random walk input
  rjw.update();
  inX = rjw.vec.x;
  inY = rjw.vec.y;
  // detect whether to draw or ignore input
  skip = dist(pinX, pinY, inX, inY) > tooFar;
  if (!skip) {
    // draw
    stroke(0);
    fill(255);
    ellipse(inX, inY, 10, 10);
  } else {
    // show where drawing would be hidden
    stroke(0, 48);
    fill(255, 48);
    ellipse(inX, inY, 10, 10);
  }
  pinX = inX;
  pinY = inY;
}

class RandomJerkWalker {
  float step;
  float stepNear;
  float stepFar;
  PVector vec;
  RandomJerkWalker(float x, float y, float n, float f) {
    step = n;
    stepNear = n;
    stepFar = f;
    vec = new PVector(x, y);
  }
  PVector update() {
    if (random(1)<.05) step = stepFar;
    if (random(1)>.75) step = stepNear;
    // if neither, continue with previous step;
    vec.x = constrain(pinX+random(-step, step), 0, width);
    vec.y = constrain(pinY+random(-step, step), 0, height);
    return vec;
  }
}