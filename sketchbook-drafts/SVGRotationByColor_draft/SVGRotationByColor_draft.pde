PImage sourceImage;

boolean imageOn = true;
boolean linesOn = true;
boolean shapeOn = true;

void setup() {
  size(800, 600);
  sourceImage = loadImage("source_colormap.png");
  sourceImage.resize(width,height);
  PImage pxTiles = imageCopyScale(sourceImage, 40, 30);
  PImage pxTilesGray = imageToGray(pxTiles);
  
  noStroke();
  noLoop();
}

void draw() {
  background(255);
  if(imageOn){ image(sourceImage,0,0); }
  if(linesOn){ }
  if(shapeOn){ }
}

void keyPressed(){
  if(key == '1'){ imageOn = !imageOn; redraw();}
  if(key == '2'){ linesOn = !linesOn; redraw(); }
  if(key == '3'){ shapeOn = !shapeOn; redraw(); }
}

/** **/
PImage imageCopyScale(PImage img, int w, int h) {
  PImage out = createImage(w, h, RGB);
  out.copy(img, 0, 0, img.width, img.height,
                0, 0, out.width, out.height);
  return out;
}

PImage imageToGray(PImage img) {
  PImage out = createImage(img.width, img.height, RGB);
  out.copy(img, 0, 0, img.width, img.height,
                0, 0, out.width, out.height);
  int pixel;
  color c;
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      pixel = y * img.width + x;
      c = img.pixels[pixel];
      img.pixels[pixel] = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071);
    }
  }
  return 
}

float[][] imageToGrayData(PImage img) {
  
}

float greyRotation(color c) {
}


  float posX, posY;
  color c;
  int greyscale;
  float w1;

  tileWidth = width / (float)gridImage.width;
  tileHeight = height / (float)gridImage.height;
  
  for (int gridX = 0; gridX < gridImage.width; gridX++) {
    for (int gridY = 0; gridY < gridImage.height; gridY++) {

      posX = (gridX+.5) * tileWidth;
      posY = (gridY+.5) * tileHeight;
      
      greyscale = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071) ;
      gridImage.pixels[gridY * gridImage.width + gridX] = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071);
      w1  = map(greyscale, 0, 255, 3, 0.1);
    }
  }
}

  PShape nodeShape = loadShape("node_hand.svg");
      pushMatrix();
        translate(posX, posY);
        rotate(w1);
        scale(0.08);
        shape(nodeShape, 0, 0);
      popMatrix();


      pushMatrix();
        translate(posX, posY);
        rotate(w1);
        fill(c);
        stroke(c);
        line(0,  0, 10,  0);
        line(10, 0,  8,  2);
        line(10, 0,  8, -2);
      popMatrix();