// https://forum.processing.org/two/discussion/22210/how-to-make-a-terrain-react-to-music

import processing.sound.*;
Amplitude amp;
AudioIn in;
SoundFile file;


int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float flying = 0;
float s;

float[][] terrain;

void setup() {
  size(600, 600, P3D);

  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();

  file = new SoundFile(this, "vibraphon.aiff");
  file.loop();
  amp.input(file);



  cols = w / scl;
  rows = h / scl;
  terrain = new float [cols][rows];
  colorMode(HSB, 230, 100, 10, 50);
  flying -= 0.01;
}

void makeTerrain() {
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0; 
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(amp.analyze(), 0, 1, -190, 215);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
}

void draw() {

  background(31);
  stroke (233);
  fill(255, 255, 255, 5);
  translate(width/2, height/2+50);
  rotateX(PI/2);
  translate(-w/2, -h/2);

  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}