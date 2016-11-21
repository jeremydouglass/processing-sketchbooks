/**
 * FullScreen Resolution 
 *
 * Change the apparent resolution while in fullScreen mode.
 * Uses a PGraphics object, call PGraphics.setSize()
 * to change the pixel dimensions, then use image() to
 * stretch the pixels to the screen space.
 * This effect also works in non-fullScreen mode.
 * Note that it is a visual effect -- not memory-efficient.
 *
 * Press any key to cycle resolutions in this sketch.
 *
 * @author Jeremy Douglass
 * @since 2016-09-13
 * Processing 3.2.1
 */

PGraphics pg;
void setup(){
  fullScreen();
  // size(640,320);
  pg = createGraphics(320,160, JAVA2D);
  pgDraw(pg);
  loop();
}

void draw(){
  background(128);
  image(pg,0,0, width, height);
}

void keyTyped(){
  if(pg.width==width){
    pg.setSize(320,160);
  } else if(pg.width==320){
    pg.setSize(640,320);
  } else {
    pg.setSize(width,height);
  }
  pgDraw(pg);
}

void pgDraw(PGraphics pg){
  pg.beginDraw();
  pg.background(0);
  pg.stroke(255);
  pg.rect(0,0,pg.width/4,pg.height/4);
  pg.ellipse(pg.width/2,pg.height/2,pg.width/2,pg.height/2);
  pg.endDraw();
}