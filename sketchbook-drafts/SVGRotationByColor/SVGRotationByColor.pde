/** 
 * SVG shapeRotation By Color
 * 2016-10-15 Processing 3.2.1
 * Press 1, 2 to toggle image layers.
 * Press 3, 4 to toggle rotation/scaling.
 *
 * https:// forum.processing.org/two/discussion/18443/0/#Form_Comment
 * Background image from https:// dheerajir.wordpress.com/2010/07/13/css-image-maps-with-change-map-color-on-rollover/
 * Pointer shape SVG from https:// www.svgimages.com/pointer-hand-gesture.html
 **/

PImage sourceImage;
PImage sourceMap;
PImage outputImage;
PShape nodeShape;

boolean imageOn = true;
boolean shapeOn = true;
boolean rotateOn = true;
boolean scaleOn = false;

void setup() {
  size(800, 600);
  // load background
  sourceImage = loadImage("source_colormap.png");
  sourceImage.resize(width, height);
  // create small copy for computing grid values
  sourceMap = createImage(40, 30, RGB);
  sourceMap.copy(sourceImage, 0, 0, sourceImage.width, sourceImage.height, 0, 0, sourceMap.width, sourceMap.height);
  // load shape for shapeRotation / annotation
  nodeShape = loadShape("node_hand.svg");
  noStroke();
  noLoop();
}

void draw() {
  background(255);
  if (imageOn) {
    image(sourceImage, 0, 0);
  }
  markImage(sourceMap);
}

void keyPressed() {
  if (key=='1') { 
    imageOn=!imageOn;
  }
  if (key=='2') { 
    shapeOn=!shapeOn;
  }
  if (key=='3') { 
    rotateOn=!rotateOn;
  }
  if (key=='4') { 
    scaleOn=!scaleOn;
  }
  redraw();
}

void markImage(PImage gridImage) {
  float tileWidth, tileHeight;
  float posX, posY;
  color c;
  int greyscale;
  float shapeRotation;
  float shapeScale;

  tileWidth = width / (float)gridImage.width;
  tileHeight = height / (float)gridImage.height;

  // loop through grid positions
  for (int gridX = 0; gridX < gridImage.width; gridX++) {
    for (int gridY = 0; gridY < gridImage.height; gridY++) {
      // compute screen location
      posX = (gridX+.5) * tileWidth;
      posY = (gridY+.5) * tileHeight;
      // compute shape property based on map greyscale
      c = gridImage.pixels[gridY * gridImage.width + gridX];
      greyscale = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071) ;
      shapeRotation  = map(greyscale, 0, 255, 3, 0.1); 
      shapeScale = map(greyscale, 0, 255, 2, 1);
      if (shapeOn) {
        // draw shapes
        pushMatrix();
        translate(posX, posY);
        if (rotateOn) { 
          rotate(shapeRotation);
        }
        scale(0.06); // starting size
        if (scaleOn) { 
          scale(shapeScale);
        }
        shape(nodeShape, 0, 0);
        popMatrix();
      }
      if (!imageOn && !shapeOn) {
        // draw arrows
        pushMatrix();
        translate(posX, posY);
        if (rotateOn) { 
          rotate(shapeRotation);
        }
        fill(c);
        stroke(c);
        if (scaleOn) { 
          strokeWeight(shapeScale);
        }
        if (scaleOn) { 
          scale(shapeScale);
        }
        translate(0, 10);
        line(10, 0, 7, -3);
        line(0, 0, 10, 0);
        line(10, 0, 7, 3);
        popMatrix();
      }
    }
  }
}