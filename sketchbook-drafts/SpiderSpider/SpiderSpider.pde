/**
 * Spider filled with spiders -- based on Draw a Mask example
 * 2017-04-15 Processing 3.2.3
 **/
PImage photo;
PGraphics mask;
void setup() {
  size(512, 512);
  photo = loadImage("https://" + "forum.processing.org/processing-org.jpg");
  mask = createGraphics(512, 512);
}
void draw() {
  background(192);
  // redraw spider
  drawSpider(mask);
  // reapply mask
  photo.mask(mask);
  // display image
  image(photo, mouseX-128, mouseY-128);
}

void drawSpider(PGraphics pg){
  pg.beginDraw();
  pg.noStroke();
  pg.background(0);
  pg.translate(256, 256);
  // draw body
  pg.ellipseMode(CENTER);
  pg.ellipse(0, 0, 120, 120);
  pg.ellipse(-60, 60, 120, 120);
  pg.ellipse(60, -60, 96, 96);
  // animate legs
  pg.rotate(0.3 * sin((frameCount%60)/10.0));
  // draw legs
  pg.rotate(radians(-11));
  for (int i=0; i<4; i++) {
    pg.rotate(radians(22));
    pg.rect(-200, -10, 400, 20);
  }
  pg.endDraw();
}