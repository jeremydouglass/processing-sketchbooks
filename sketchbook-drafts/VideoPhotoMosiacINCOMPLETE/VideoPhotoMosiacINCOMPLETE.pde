// https://forum.processing.org/two/discussion/22692/how-to-replace-each-pixels-from-a-video-feed-by-an-image#latest
// video photomosiac incomplete
// easy enough to finish but don't have time -- I started with a random image set generator,
// didn't yet write the analyzer or the lookup table.
// see also (haven't looked at yet, but HashMap seems the next obvious step):
// http://www.cs.trinity.edu/~mhibbs/code/cs3353/ImageMosaic.pde
// kfrajer suggests hue space -- probably a good idea...?

import processing.video.*;
ArrayList<PImage> imgs;

int numPixels;
int blockSize = 30 ;
Capture video;
color collageColors[];

void setup() {
  size(displayWidth, displayHeight);
  noStroke();
  background(0);
  video = new Capture(this, displayWidth, displayHeight);
  numPixels = width / blockSize;
  collageColors = new color[numPixels * numPixels];
  video.start();
  imgs = new ArrayList<PImage>();
  randomImages(20);
}

void randomImages(int count){
  for(int i=0; i<count; i++){
    imgs.add(randomImage(blockSize));
  }
}

PGraphics randomImage(int size){
  PGraphics pg = createGraphics(size, size);
  pg.beginDraw();
  pg.noStroke();
  pg.fill(random(255), random(255), random(255));
  pg.rect(0,0,pg.width,pg.height);
  pg.fill(random(255), random(255), random(255));
  if(random(1.0)<0.5){
    pg.triangle(pg.width/2,0,pg.width,pg.height,0,pg.height);
  } else {
    pg.ellipse(0,0,pg.width,pg.height);
  }
  pg.endDraw();
  return pg;
}





void captureEvent(Capture v) {
  v.read();
  v.loadPixels();

  for (int j = 0; j < numPixels; j++) {
    for (int i = 0; i < numPixels; i++) {
      collageColors[j*numPixels + i] = v.get(i*blockSize, j*blockSize);
    }
  }
}

void draw() {

  if (video.available() == true) {
    video.read();
//    image(video, 0, 0);
  }

  for (int j = 0; j < numPixels; j++) {
    for (int i = 0; i < numPixels; i++) {
      // fill(collageColors[j*numPixels + i]);
      image(imgs.get((int)random(imgs.size())), i*blockSize, j*blockSize);
    }
  }
}