// forum.processing.org/two/discussion/22579/is-it-possible-to-replicate-the-trim-path-function-of-adobe-after-effects-within-processing

PVector[] path;
PShape s;

void setup() {
  path = new PVector[7];
  path[0] = new PVector( - 5, -8.66);
  path[1] = new PVector(   5, -8.66);
  path[2] = new PVector(  10,  0);
  path[3] = new PVector(   5,  8.66);
  path[4] = new PVector( - 5,  8.66);
  path[5] = new PVector( -10,  0);
  path[6] = new PVector( -05, -8.66);
}

void draw(){
  background(192);
  scale(2);
  // progress timer 0.0->1.0
  float amt = (millis()%4000)/4000.0;
  // trim path based on timer
  PVector[] trimmed = trimPath(amt,path);
  // draw veclist
  pathLines(trimmed, 10, 10);
  // or render as PShape, then draw
  s = pathShape(trimmed);
  shape(s, width/3, height/3);
}

PVector[] trimPath(float amt, PVector... vecs) {
  if (vecs.length==1 || amt>=1) { return vecs; }
  float unit = 1.0/(vecs.length-1);
  PVector midpoint = PVector.lerp(vecs[floor(amt / unit)], vecs[ceil(amt / unit)], amt%unit/unit);
  vecs = (PVector[])subset(vecs, 0, ceil(amt / unit));
  vecs = (PVector[])append(vecs, midpoint);
  return vecs;
}

void pathLines(PVector[] vecs, float x, float y){
  pushMatrix();
  translate(x,y);
  for(int i=1;i<vecs.length;i++){
    line(vecs[i-1].x,vecs[i-1].y,vecs[i].x,vecs[i].y);
  }
  popMatrix();
}

PShape pathShape(PVector[] vecs){
  PShape s = createShape();
  s.beginShape();
  for(int i=0;i<vecs.length;i++){
    s.vertex(vecs[i].x, vecs[i].y);
  }
  s.endShape();
  return s;
}