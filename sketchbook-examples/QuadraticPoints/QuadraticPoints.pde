/**
 * Quadratic Points
 * plot a quadratic equation with points
 * @since 2016-11-20
 * @author Jeremy Douglass
 * Processing 3.2.3
 * https://forum.processing.org/two/discussion/19180/plot-graph
 */
 
PVector origin;

void setup(){
  size(400,400);
  origin = new PVector(width/2, 3*height/4);
}

void draw(){
  // draw axes (relative to screen edges)
  stroke(255,0,0);
  line(0,origin.y,width,origin.y);
  line(origin.x,0,origin.x,height);

  // draw graph -- center on origin, y goes up not down
  translate(origin.x, origin.y - 10);
  scale(1, -1);
  stroke(0);
  
  // draw quadratic function with points
  quadraticPoints(0.025, 2, 30, -width/2, width/2);
}

void quadraticPoints (float a, float b, float c, float xmin, float xmax){
  float y;
  for(float x=xmin; x<xmax; x=x+0.25){
    y = a*x*x + b*x + c; // ( y = 0.025x^2 + 2x + 30 )
    point(x, y);
  }
}