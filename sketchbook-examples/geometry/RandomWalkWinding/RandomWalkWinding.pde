/** Random Walk Winding
 *  
 *  Generate random points around a circle, illustrate winding number.
 *  Demonstrates the intensive cumulative angle method rather than crossings.
 *  Alter setttings under "data generator settings".
 *  To pause, press space or click mouse.
 *  
 *  2016-09-14 Jeremy Douglass - Processing 3.2.1 
 */

PVector[] myWalk;

//// data generator settings

int minPoints =  75;
int maxPoints =  350;
float minWalk = -PI/7;
float maxWalk =  PI/6;
float radius  =  50;
float radiusGrowthRate = 1.006;

//// display
boolean pause = false;

void setup(){
  size(800,800);
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(0);
  frameRate(12);
}

void draw(){
  translate(width/2,height/2);
  myWalk = randomWalkAroundPoints(minPoints, maxPoints, minWalk, maxWalk, radius, radiusGrowthRate);
  if(pause){
    background(255); stroke(160); fill(0);  noLoop();
  } else {
    background(128); stroke(160); fill(160); loop();
  }
  text(angleWinding(myWalk)[0], 0, 0);
  text(angleWinding(myWalk)[1], 0, 16);
  drawWalk(myWalk);
}

void keyPressed(){ if(key==' '){ pause = !pause; redraw(); } }
void mouseClicked(){ pause = !pause; redraw(); }


/**
 * Generate a random walk around a circle as an ordered list of PVectors.
 * radiusGrowthRate slowly expands the walking radius over time
 * for easier visual inspection of complex paths.
 */
PVector[] randomWalkAroundPoints(int minPoints, int maxPoints, float minWalk, float maxWalk, float radius, float radiusGrowthRate){
  ArrayList<PVector> points = new ArrayList<PVector>();
  int count = int(random(minPoints,maxPoints));
  points.add(new PVector(0,radius));
  points.get(0).rotate(random(TWO_PI));
  for(int i=0; i<count; i++){
    points.add(points.get(i).copy().rotate(random(minWalk,maxWalk)).mult(radiusGrowthRate));
  }
  return points.toArray(new PVector[points.size()]);
}

/**
 * Draw a random walk PVector list.
 * Marks the beginning and end markers and a crossing line to inspect winding.
 */
void drawWalk(PVector[] points){
  //// visual crossing line to inspect winding.
  line(points[0].x, points[0].y, points[0].x*10, points[0].y*10);
  //// start and end point markers
  ellipse(points[0].x, points[0].y, 10, 10);
  ellipse(points[points.length-1].x, points[points.length-1].y, 10, 10);
  // line segments with marked points
  for(int i=1; i<points.length; i++){
    ellipse(points[i].x, points[i].y, 3, 3);
    line(points[i-1].x, points[i-1].y, points[i].x, points[i].y);
  }
}

/**
 * For a list of points in path order,
 * sum the angle of each new point to the previous points.
 * To simplify to a winding number, round the result towards 0
 * (2.2=2, -2.2=-2).
 * Returns two numbers: the fractional winding results[0]
 *   and the correctly rounded integer winding results[1]
 */
float[] angleWinding(PVector[] points){
  float windingAngle = 0.0;
  float diff = 0.0;
  for(int i=0; i<points.length-1; i++){
    diff = PVector.angleBetween(points[i],points[i+1]);
    //// angleBetween gives only positive values up to PI
    //// so check if positive or negative
    if(points[i].dot(points[i+1].y, -points[i+1].x, 0) < 0){
      windingAngle = windingAngle + diff;
    } else {
      windingAngle = windingAngle - diff;
    }
  }
  //// round partial winds in towards zero
  if(windingAngle > 0){
    return new float[]{
      windingAngle/TWO_PI,
      int(floor(windingAngle/TWO_PI))
    };
  } else {
    return new float[]{
      windingAngle/TWO_PI,
      int(ceil(windingAngle/TWO_PI))
    };
  }
}