// forum.processing.org/two/discussion/22122/how-to-check-whether-mouse-pointer-is-currently-on-the-line-drawn-inside-canvas-or-not
ArrayList<PShape> lines;

void setup() {
  size(300,300);
  stroke(255);
  frameRate(10);
  lines = lineSet(6,15);
}

void draw() {
  background(32);
  for (PShape s : lines) {
    s.beginShape();
    if (mouseLine(s.getVertex(0), s.getVertex(1))) {
      s.strokeWeight(4);
    } else {
      s.strokeWeight(1);
    }
    s.endShape();
    shape(s, 0, 0);
  }
}

void keyPressed(){
  lines = lineSet(6,15);
}

ArrayList<PShape> lineSet(int pointCount, int lineCount){
  ArrayList<PVector> points = new ArrayList<PVector>();
  for (int i=0; i<pointCount; i++) {
    points.add(new PVector((int)random(0, width), (int)random(0, height)));
  }
  PShape s;
  ArrayList<PShape> lines = new ArrayList<PShape>();
  for (int i=0; i<lineCount; i++) {
    s = createShape();
    s.beginShape();
    PVector a = points.get((int)random(0, points.size()-1));
    PVector b = points.get((int)random(0, points.size()-1));
    s.vertex(a.x, a.y);
    s.vertex(b.x, b.y);
    s.endShape();
    lines.add(s);
  }
  return lines;
}

boolean mouseLine(PVector a, PVector b){
  return linePoint(a.x, a.y, b.x, b.y, mouseX, mouseY);
}

// www.jeffreythompson.org/collision-detection/line-point.php
boolean linePoint(float x1, float y1, float x2, float y2, float px, float py) {
  float d1 = dist(px, py, x1, y1);
  float d2 = dist(px, py, x2, y2);
  float lineLen = dist(x1, y1, x2, y2);
  float buffer = 0.2;    // higher # = less accurate
  if (d1+d2 >= lineLen-buffer && d1+d2 <= lineLen+buffer) {
    return true;
  }
  return false;
}