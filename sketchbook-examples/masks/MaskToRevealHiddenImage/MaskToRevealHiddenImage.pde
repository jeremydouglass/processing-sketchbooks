/**
 *  Mask to Reveal Hidden Image
 *  2016-10-19 Jeremy Douglass Processing 3.2.1
 *  based on a sketch by PhiLo -- https:// processing.org/discourse/beta/num_1231933751.html
 *  and a sketch by VD_D -- https:// forum.processing.org/two/discussion/18575/creating-a-looking-glass-an-ellipse-which-sees-the-image-underneath-it#latest
 **/

PImage imgForeground;
PImage imgHidden;
PGraphics pgMask;
PImage imgMask;
int iw, ih;
int dw, dh;
float maskSize;

void setup()
{
  size(300, 300);
  maskSize = 100;
  imgHidden = loadImage("http://www.gardensnob.com/pictures/strawberries1-300x300.jpg");
  imgForeground = loadImage("http://s3files.core77.com/blog/images/At-symbol-4.sm_1-300x300.jpg");
  iw = imgHidden.width;
  ih = imgHidden.height;
  dw = width - iw;
  dh = height - ih;
  pgMask = createGraphics(iw, ih);
}

void draw()
{
  background(200);
  image(imgForeground,0,0);
  pgMask.beginDraw();
    // Erase graphics
    pgMask.background(0);
    // Draw the mask
    int x = mouseX - dw/2;
    int y = mouseY - dh/2;
    pgMask.noStroke();
    //// mostly transparent circle (250) with fuzzy edge (0-250)
    for(int i=0;i<25;i++){
      pgMask.fill(0+i*10);
      pgMask.ellipse(x, y, maskSize-i*2, maskSize-i*2);
    }
    //// or just a simple circle
    // pgMask.fill(255);
    // pgMask.ellipse(x, y, maskSize, maskSize);
  pgMask.endDraw();
  //// Copy the original image (kept as reference)
  imgMask = imgHidden.get();
  //// Apply mask and display result
  imgMask.mask(pgMask);
  image(imgMask, dw/2, dh/2);
  //// Draw a magnifying frame
  stroke(96,48,32);
  strokeWeight(maskSize/10);
  noFill();
  ellipse(mouseX,mouseY,maskSize,maskSize);
  //// ...and handle
  strokeWeight(maskSize/5);
  line(mouseX+(maskSize/2/sqrt(2)),mouseY+(maskSize/2/sqrt(2)),mouseX+maskSize*3/4,mouseY+maskSize*3/4);
}