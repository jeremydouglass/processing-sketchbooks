// How to stop RGB from being multiplied by Alpha
// https://forum.processing.org/two/discussion/18653/
// > [background()](https://www.processing.org/reference/background_.html): It is not possible to use the transparency alpha parameter with background colors on the main drawing surface. It can only be used along with a PGraphics object and createGraphics().

void setup() {
  size(640, 360, P3D);
  colorMode(RGB, 255);
  noStroke();
  noLoop();
}

void draw(){
  // without a background, canvas defaults to grey (204,204,204)
  // background(0);

  // replace background with new color
  fill(100,128,255,255);
  rect(0,0,width/2,height);
  printPixel(width/4,height/2);

  // background remains unchanged by adding pixels at 0 alpha
  fill(100,128,255,0);
  rect(width/2,0,width,height);
  printPixel(3*width/4,height/2);
}

void printPixel(float x, float y){
  int c = get(int(x),int(y));
  println("R:", red(c), "G:", green(c), "B:", blue(c), "A:", alpha(c), "raw:", c);
}