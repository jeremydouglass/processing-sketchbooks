/** BezierFit
  * test of bezier2(), a beizer() that passes through control points
  * test sketch by jeremydouglass - ported to processing by prince polka,
  * from C# code by Gabe @ Stackoverflow: stackoverflow.com/a/2316440
  * 2017-03-19 Processing 3.2.3
  * forum.processing.org/two/discussion/21355/fixed-make-bezier-curve-pass-through-control-points#latest
 **/
void setup(){
  size(400,400);
}
void draw(){
  background(192);
  noFill();
  bezier2(
    0,height/2,
    width/3,height/3,
    mouseX,mouseY,
    width,height/2
  );
  ellipse(0,height/2,10,10);
  ellipse(width/3,height/3,10,10);
  ellipse(width,height/2,10,10);
  fill(0,255,0);
  ellipse(mouseX,mouseY,10,10);
}

/** bezier2(), a beizer() that passes through control points
  * Ported to processing by prince polka,
  * from C# code by Gabe @ Stackoverflow, <a href="http://stackoverflow.com/a/2316440" target="_blank" rel="nofollow">http://stackoverflow.com/a/2316440</a>
 **/
void bezier2(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3) {
  // measure chord lengths
  float c1=dist(x0, y0, x1, y1);
  float c2=dist(x1, y1, x2, y2);
  float c3=dist(x3, y3, x2, y2);
  // make curve segment lengths proportional to chord lengths
  float t1=c1/(c1+c2+c3);
  float t2=(c1+c2)/(c1+c2+c3);
  float a=t1*(1-t1)*(1-t1)*3;
  float b=(1-t1)*t1*t1*3;
  float d=t2*(1-t2)*(1-t2)*3;
  float c=x1-(x0*pow(1-t1, 3.0))-(x3*pow(t1, 3));
  float e=(1-t2)*t2*t2*3;
  float f=x2-(x0*pow(1-t2, 3.0))-(x3*pow(t2, 3));
  float g=y1-(y0*pow(1-t1, 3.0))-(y3*pow(t1, 3));
  float h=y2-(y0*pow(1-t2, 3.0))-(y3*pow(t2, 3));
  // find bezier control points
  x2=(c-a/d*f)/(b-a*e/d);
  x1=(c-(b*x2))/a;
  y2=(g-a/d*h)/(b-a*e/d);
  y1=(g-(b*y2))/a;
  // draw control points
  pushStyle();
  fill(255,0,0);
  ellipse(x1,y1,10,10);
  ellipse(x2,y2,10,10);
  stroke(255,0,0);
  line(x0, y0, x1, y1);
  line(x2, y2, x3, y3);
  popStyle();
  // draw bezier curve using control points
  bezier(x0, y0, x1, y1, x2, y2, x3, y3);
}