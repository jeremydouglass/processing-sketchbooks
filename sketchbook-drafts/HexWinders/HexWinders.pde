float hexRadius;
int hexRings;

color c1;
color c2;
boolean cSwitch;

void setup() {
  size(300, 300);
  stroke(255);
  textAlign(CENTER);
  textSize(12);
  fill(255);
  colorSet();
  hexRadius = 20;
  hexRings = 4;
  noLoop();
}

void draw(){
  background(0);
  translate(width/2, height/2);
  hexWinder(hexRadius,hexRings);
  translate(0,-height/2 + 10);
  text("Mouse = size / Spacebar = color",0,0);
  noLoop();
}

void keyPressed(){
  colorSet();
  redraw();
}

void mouseMoved(){
  hexRings = int(10 * mouseX/width);
  redraw();
}

void mouseWheel(MouseEvent event) {
  hexRadius += event.getCount();
  redraw();
}

void colorSet(){
  if(cSwitch){
    colorMode(RGB);
    c1 = color(255,0,0);
    c2 = color(0,0,255);
  } else {
    colorMode(HSB, 255, 100, 100);
    c1 = color(0,100,100);
    c2 = color(254,100,100);
  }
  cSwitch = !cSwitch;
}

void hexWinder(float radius, int ringCount){
  int hcount = 0;
  int htotal = 1;
  for(int i=0;i<ringCount; i++){ htotal = htotal + i*6; }
  hexagon(0, 0, radius, 0, htotal); // place center hex
  for(int ring = 1; ring<ringCount; ring++){
    for(int i = 0; i<6; i++){ 
      pushMatrix();
        // place side hex
        rotate(i * (PI / 3)); 
        translate(0,-radius*2 * (ring));
        rotate(-i * (PI / 3));
        hexagon(0, 0, radius, hcount+=1, htotal);
        // fill in side, stairstep by circumradius, radius
        rotate(i * (PI / 3));
        for(int side = 0; side < ring-1; side++){ 
          translate(radius * (sqrt(3)),radius);
          rotate(-i * (PI / 3));
          hexagon(0, 0, radius, hcount+=1, htotal);
          rotate(i * (PI / 3));
        }
      popMatrix();
    }
  }
}

//// function to make a colored hexagon
void hexagon(float x, float y, float radius, int hcount, int htotal){
  color c = lerpColor(c1,c2,hcount/(float)htotal);
  polygon(x, y, radius, 6, c);
  fill(255);
  text(hcount,0,0);
}

//// function to make a polygon
//// https:// processing.org/examples/regularpolygon.html
void polygon(float x, float y, float radius, int npoints, color c) {
  float angle = TWO_PI / npoints;
  beginShape();
  fill(c);
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}