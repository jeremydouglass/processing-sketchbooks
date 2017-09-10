Path p;
void setup() {
  p = new Path( new PVector(0, 0), new PVector(30, 30), new PVector(10, 10) );
  // println(p.points);
  println(p.segLengths);
  println(p.sumLengths);
}
void draw() {
}

class Path {
  PVector[] points;
  PShape s;
  float[] segLengths;
  float[] sumLengths;
  float totalLength;
  float[] percents;
  Path(PVector... points_) {
    points = points_;
    updateLookups();
  }
  void updateLookups() {
    segLengths = new float[points.length];
    sumLengths = new float[points.length];
    segLengths[0] = 0;
    sumLengths[0] = 0;
    // update segLength and sumLength lookups
    for (int i=1; i<points.length; i++) {
      segLengths[i] = PVector.dist(points[i], points[i-1]);
      sumLengths[i] = segLengths[i] + sumLengths[i-1];
    }
    totalLength = sumLengths[sumLengths.length-1];
    // update percent lookup
    percents[0] = 0;
    for (int i=1; i<points.length; i++) {
      percents[i] = sumLengths[i]/totalLength;
    }
  }
  PVector[] trimSegs(int start) {
    points = (PVector[])subset(points, start);
    updateLookups();
    return points;
  }
  PVector[] trimSegs(int start, int count) {
    points = (PVector[])subset(points, start, count);
    updateLookups();
    return points;
  }
  PVector[] trimDist(float dist) {
    return trimDist(0, dist);
  }
  
  //////////
  PVector[] trimDist(float start, float dist) {
    for (int = sumLengths[].length-1; i>0; i--) {
      if (dist<=sumLengths[i]) {
        PVector d = PVector.lerp(points[i], points[i+1]);
        // return or break?
      }
    }
    updateLookups();
    return points;
  }
  
  
  PVector[] trimStretchDist( float amt) {
    float unit = 1.0/(points.length-1);
    PVector midpoint = PVector.lerp(points[floor(amt / unit)], points[ceil(amt / unit)], amt%unit/unit);
    points = (PVector[])subset(points, 0, ceil(amt / unit));
    points = (PVector[])append(points, midpoint);
    return points;
  }
  PVector[] trimStretchDist(float start, float amt) {
    return points;
  }
  PVector[] trimPercent(float pct) {
    //
    updateLookups();
    return trimPercent(0, pct);
  }
  PVector[] trimPercent(float pct1, float pct2) {
    //
    updateLookups();
    return points;
  }
}