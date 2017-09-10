/** lerpColors -- interpolates any list of colors rather than just two
  * Jeremy Douglass 2017-03-27 Processing 3.2.3
 **/

color RED =   color(255,   0,   0);
color GREEN = color(  0, 255,   0);
color BLUE =  color(  0,   0, 255);
color BLACK = color(  0,   0,   0);
color WHITE = color(255, 255, 255);
color[] colors = {RED,GREEN,BLUE,BLACK,WHITE};

void setup() {
  size(400, 400);
  noStroke(); 
  noLoop();
} 


void draw() {
  lerpBar(20, 20, 360, 40, BLACK, WHITE);
  lerpBar(20, 80, 360, 40, RED, GREEN, BLUE);
  lerpBar(20,140, 360, 40, BLUE, GREEN, RED);
  lerpBar(20,200, 360, 40, RED, WHITE, RED, BLACK, RED);
  lerpBar(20,260, 360, 40, GREEN, WHITE, GREEN, WHITE, GREEN, WHITE, GREEN, WHITE, GREEN);
  lerpBar(20,320, 360, 40, colors);
}

void lerpBar(int x, int y, int w, int h, color... colors) {
  pushStyle();
  for (int i=0; i<w; i++) {
    stroke(lerpColors(float(i)/w, colors));
    line(x+i, y, x+i, y+h);
  }
  popStyle();
}

color lerpColors(float amt, color... colors) {
  if(colors.length==1){ return colors[0]; }
  float cunit = 1.0/(colors.length-1);
  return lerpColor(colors[floor(amt / cunit)], colors[ceil(amt / cunit)], amt%cunit/cunit);
}