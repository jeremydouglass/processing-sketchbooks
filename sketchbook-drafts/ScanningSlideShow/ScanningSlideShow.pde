// https://forum.processing.org/two/discussion/21157/my-demo-pde-runs-way-way-slower-when-visitng-the-uploaded-version-why

PImage[] img;
int imgNum = 0; 
int lineCount = 0; 

void setup() {
  size(512, 512);
  img = new PImage[1];
  img[0] = loadImage("https://processing.org/img/processing3-logo.png"); 
  background(0);
}

void draw() {  
  loadPixels();
  for (int y1 = lineCount; y1 < height; y1++) { 
    for (int x1 = 0; x1 < width; x1++) { 
      int loc1 = x1 + y1 * width; 
      pixels[loc1] = img[imgNum].pixels[x1+width*lineCount];
    }
  }
  updatePixels(); 
  lineCount = lineCount + 1; 
  if (lineCount >= height) {  // when done scanning, next image
    lineCount = 0; 
    imgNum++;  // next image
    if(imgNum >= img.length) imgNum = 0;  // if last image, loop to first
    background(0);
  }
}