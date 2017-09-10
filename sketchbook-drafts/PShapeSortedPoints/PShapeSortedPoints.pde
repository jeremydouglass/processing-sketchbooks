// PShapeSortedPoints
// 2017-05-29 Jeremy Douglass -- Processing 3.3.3 
// Generate a list of random points, then sort into a closed PShape.
// forum.processing.org/two/discussion/22796/prevent-random-vertexes-from-intersecting

PShape ps;
void setup() {
  frameRate(1);
}

void draw() {
  background(192);
  translate(50,50);
  ps = sortedPoints(20,100,100);
  shape(ps);
}
  
PShape sortedPoints(int pointCount, int w, int h){
  Table t = new Table();
  // create columns
  t.addColumn("x");
  t.addColumn("y");
  t.addColumn("atan2");
  // create random point data 
  int x, y;
  float at2;
  TableRow row;
  for(int i=0; i<pointCount; i++){
    x = (int)random(-w/2.0,w/2.0);
    y = (int)random(-h/2.0,h/2.0);
    at2 = atan2(y,x);
    if(at2<0) at2+=TWO_PI; // fix for Table.sort() negative numbers
    row = t.addRow();
    row.setInt("x", x);
    row.setInt("y", y);
    row.setFloat("atan2", at2);
  }
  // sort points
  t.sort("atan2");
  // draw shape
  PShape s = createShape();
  s.beginShape();
  s.fill(0, 0, 255);
  for(int i=0;i<t.lastRowIndex();i++){
    row = t.getRow(i);
    s.vertex(row.getInt(0), row.getInt(1));
  }
  s.endShape(CLOSE);
  return s;
}