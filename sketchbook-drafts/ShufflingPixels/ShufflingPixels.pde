/**
 * Shuffling Pixels
 * 2016-11-17 Jeremy Douglass - Processing 3.2.3
 * hold down space for repeated pixel shuffling
 * https:// forum.processing.org/two/discussion/19093/shifting-re-shuffling-pixels-of-an-image
 **/

PImage original;
PImage shuffle;

void setup(){
  size(500,500);
  original = loadImage("https://processing.org/img/processing3-logo.png");
  shuffle = original.copy();
  imgShuffle(shuffle);
}

void draw(){
  background(128);
  if(!keyPressed){
    image(original, 0, 0);
  } else {
    image(shuffle, 0, 0);
  }
}

void keyPressed(){
  shuffle = original.copy();
  imgShuffle(shuffle);
}

void imgShuffle (PImage img){
  // copy the image pixel array into an IntList, and shuffle it
  img.loadPixels();
  IntList pxList = new IntList(img.pixels);
  pxList.shuffle();
  // copy the shuffled list back into the image pixels
  img.pixels = pxList.array();
  img.updatePixels();
}