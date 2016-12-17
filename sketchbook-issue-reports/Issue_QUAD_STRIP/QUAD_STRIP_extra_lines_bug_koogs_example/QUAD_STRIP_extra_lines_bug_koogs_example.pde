/*
 * QUAD_STRIP extra lines -- koogs example
 * 2016-09-07 Jeremy Douglass
 * <a href="https://forum.processing.org/two/discussion/17876/0/#Form_Comment" target="_blank" rel="nofollow">https://forum.processing.org/two/discussion/17876/0/#Form_Comment</a>
 */
PShape shape;
int segments;
int translatex = 0;
int translatey = 0;
String text = "0,0,0";
 
void setup() {
  size(400, 400, P3D);
  segments = 20;
  shape = createKey(0, 0, segments);
}
 
void draw() {
  background(0);
  camera(100, 200, 150, 0, 0, 0, 0, 1, 0);
  scale(2);
  text(text,0,0,0);
  shape(shape, translatex, translatey);
}
 
PShape createKey(float x, float y, int segments_) {
  int BUTTON_RADIUS = 25;
  ArrayList<PVector> points = new ArrayList();
  for (int i = 0; i < segments_*2; i++) {
    float angle = i * TWO_PI / segments_;
    points.add(new PVector(x + BUTTON_RADIUS * cos(angle), y + BUTTON_RADIUS * sin(angle)));
  }
  PShape red   = createChild(points, color(255,0,0), 9,  40 + translatey);
  PShape green = createChild(points, color(0,255,0), 7,   0);
  PShape blue  = createChild(points, color(0,0,255), 5, -40 - translatey);
 
  // add children to shape
  PShape s = createShape(GROUP);
  s.addChild(red);
  s.addChild(green);
  s.addChild(blue);
  return s;
}
 
PShape createChild(ArrayList<PVector> points_, color color_, int weight_, int translate_){
  PShape shape_ = createShape();
  shape_.beginShape(QUAD_STRIP);
  shape_.translate(0,0,translate_);
  shape_.noFill();
  shape_.stroke(color_);
  shape_.strokeWeight(weight_);
  for (PVector p : points_) {
    shape_.vertex(p.x, p.y, 0);
    shape_.vertex(p.x, p.y, 25);
  }
  shape_.endShape(CLOSE);
  return shape_;
}
 
/* *** INTERFACE *** */
 
void keyPressed(){
  switch(key){
    case '_':
    case '-':
      segments = max(2, segments-1);
      drawShape();
      break;
    case '=':
    case '+':
      segments = segments+1;
      drawShape();
      break;
    case ' ':
      if(segments == 2){ segments = 20; }
      else { segments = 2; }
      drawShape();
      break;
  }
}
 
void mouseDragged(){
  // translate(60 * mouseX/width, 60 * mouseY/height);
  translatex = 30 - 60 * mouseX/width;
  translatey = 30 - 60 * mouseY/height;
  drawShape();
}
 
void drawShape(){
  shape = createKey(0, 0, segments);
  redraw();
}