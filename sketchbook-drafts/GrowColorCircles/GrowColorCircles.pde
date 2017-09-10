//forum.processing.org/two/discussion/comment/95863/#Comment_95863

import processing.sound.*;


int maxCount = 1000; //max count of the circles
int currentCount = 1;
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount]; // radius
color[] c = new color[maxCount];

Amplitude amp;
AudioIn in;
float ampt;

void setup() {

  // fullScreen();
  size(600, 600);

  amp = new Amplitude(this);  // Create an Input stream which is routed into the Amplitude analyzer
  in = new AudioIn(this, 0);

  in.start();// start the Audio Input
  amp.input(in); // patch the AudioIn

  colorMode(HSB, 255, 100, 100);

  init ();
}

void init () {

  frameRate(240);
  smooth();
  strokeWeight(0.5);
  currentCount = 1;

  // first circle
  x[0] = width/2;
  y[0] = height/2;
  r[0] = ampt * 10;
  c[0] = color(0);

  background(255);
}

void draw() {

  ampt = amp.analyze();
  if (ampt>0.03) { // everytime a sound amplitude bigger than 0.03 is detected, a new ellipse is drawn

    // create a radom set of parameters
    float newR = ampt*10; // amplitude controls the radius of the circles being drawn 
    float newX = random(0+newR, width-newR);
    float newY = random(0+newR, height-newR);

    // which circle is the closest?
    float closestDist = 100000000;
    int closestIndex = 0;
    for (int i=0; i < currentCount; i++) {
      float newDist = dist(newX, newY, x[i], y[i]);
      if (newDist < closestDist) {
        closestDist = newDist;
        closestIndex = i;
      }
    }

    // aline it to the closest circle outline
    float angle = atan2(newY-y[closestIndex], newX-x[closestIndex]);
    x[currentCount] = x[closestIndex] + cos(angle) * (r[closestIndex]+newR);
    y[currentCount] = y[closestIndex] + sin(angle) * (r[closestIndex]+newR);
    r[currentCount] = newR;
    c[currentCount] = color(map(ampt*10, 0, 10, 0, 255), 100, 100);
    currentCount++;

    // draw them
    for (int i=0; i < currentCount; i++) {
      fill(c[i]); 
      ellipse(x[i], y[i], r[i]*2, r[i]*2);
    }

    if (currentCount >= maxCount) {
      init(); // once the maxcount of circles is reached, restart the sketch
    }
  }
}