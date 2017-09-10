// forum.processing.org/two/discussion/22579/is-it-possible-to-replicate-the-trim-path-function-of-adobe-after-effects-within-processing

PVector[] path;
PShape s;

void setup() {
  path = new PVector[7];
  path[0] = new PVector( - 5, -8.66);
  path[1] = new PVector(   5, -8.66);
  path[2] = new PVector(  10, 0);
  path[3] = new PVector(   5, 8.66);
  path[4] = new PVector( - 5, 8.66);
  path[5] = new PVector( -10, 0);
  path[6] = new PVector( -05, -8.66);
}

void draw() {
  background(192);
  scale(2);
  // progress timer 0.0->1.0
  // float inAmt = 0.25;
  float outAmt  = (millis()%4000)/4000.0;
  // trim path based on timer
  // PVector[] trimmed = trimPath2(inAmt,outAmt,path);
  PVector[] trimmed = trimPath(outAmt, path);
  // draw veclist
  pathLines(trimmed, 10, 10);
  // or render as PShape, then draw
  s = pathShape(trimmed);
  shape(s, width/3, height/3);
}

PVector[] trimPath(float amt, PVector... vecs) {
  if (vecs.length==1 || amt>=1) { 
    return vecs;
  }
  float unit = 1.0/(vecs.length-1);
  PVector midpoint = PVector.lerp(vecs[floor(amt / unit)], vecs[ceil(amt / unit)], amt%unit/unit);
  vecs = (PVector[])subset(vecs, 0, ceil(amt / unit));
  vecs = (PVector[])append(vecs, midpoint);
  return vecs;
}

//PVector[] trimPath2(float inAmt, float outAmt, PVector... vecs) {
//  if (vecs.length==1 || (inAmt<=0 && outAmt>=1)) { 
//    return vecs;
//  }
//  float unit = 1.0 / (vecs.length-1);
//  float in = inAmt / unit;
//  int inIdx = in
//  float out = outAmt / unit;
//  PVector inPoint  = PVector.lerp(vecs[floor(inIdx)], vecs[ceil(inIdx)], inAmt%unit   / unit);
//  PVector outPoint = PVector.lerp(vecs[floor(outIdx)], vecs[ceil(outIdx)], outAmt%unit / unit);
//  vecs = (PVector[])splice(vecs, inPoint, 0);
//  vecs = (PVector[])subset(vecs, ceil(inIdx), floor(outIdx));
//  vecs = (PVector[])append(vecs, outPoint);
//  return vecs;
//}

PVector[] trimPath3(float inAmt, float outAmt, PVector... vecs) {
  if (vecs.length==1 || (inAmt<=0 && outAmt>=1)) { 
    return vecs;
  }
  float[] lens = new float[vecs.length-1];
  for (int i=0; i<vecs.length-2; i++) {
    lens[i] = PVector.dist(vecs[i],vecs[i+1]);
  }
  float[] totals = new float[vecs.length];
  for (int i=1; i<vecs.length-1; i++) {
    totals[i] = totals[i-1] + lens[i];
  }
  return vecs;
}

void pathLines(PVector[] vecs, float x, float y) {
  pushMatrix();
  translate(x, y);
  for (int i=1; i<vecs.length; i++) {
    line(vecs[i-1].x, vecs[i-1].y, vecs[i].x, vecs[i].y);
  }
  popMatrix();
}

PShape pathShape(PVector[] vecs) {
  PShape s = createShape();
  s.beginShape();
  for (int i=0; i<vecs.length; i++) {
    s.vertex(vecs[i].x, vecs[i].y);
  }
  s.endShape();
  return s;
}