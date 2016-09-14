/**
 * Change resolution while in fullScreen mode
 * 2016-09-13 Processing 3.2.1
 *
 * Use image to display a PGraphics object,
 * call PGraphics.setSize to change resolution.
 * Press any key to cycle resolutions in this sketch.
 * Also works in non-fullScreen mode.
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