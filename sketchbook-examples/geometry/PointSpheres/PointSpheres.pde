/** 
 * Point Spheres
 * 
 * Demonstration of two different methods for constructing
 * a point sphere:
 * 1. plane projection (elevation from the plane by z/z),
 * 2. the Fibonacci sphere 
 *
 * The plane projection method is drawn in two halves, and has
 * significant distortions around the equator.
 * The Fibonacci method spirals and gives roughly evenly
 * distributed points on the surface.
 *
 * @author Jeremy Douglass
 * @since 2016-10-29
 * Processing 3.2.1
 * 
 * Based on sketches by Jim Bumgardner, paolopastorino, koogs
 * 
 * Discussion
 * https://forum.processing.org/two/discussion/18779/move-a-single-point
 */
 
void setup() {
  size(600, 600, P3D);
  strokeWeight(2);
}
void draw() {
  background(0);
  stroke(32,32,32);
  pointPlane(width, height, 10); // w, h, spacing
  stroke(255,0,0);
  pushMatrix();
    translate(width/3,height/3);
    timedTumble(40);
    pointSphereFibonacci(width/5, 1000); // radius and number of points
  popMatrix();
  pushMatrix();
    translate(width*2/3,height*2/3);
    timedTumble(20);
    pointSphere(width/5); // radius of sphere
  popMatrix();
}

//// Timed 3D tumble, rotations cycle back to start every `duration` milliseconds
void timedTumble(float duration){
  duration = duration*1000; // milliseconds
  float spin = TWO_PI*2 * (millis()%duration)/duration;
  rotateX(spin);
  rotateY(spin/2);
  rotateZ(spin/8);
}

void pointPlane(int pwidth, int pheight, int spacing){
  // initial sketch by paolopastorino https:// forum.processing.org/two/discussion/18779/move-a-single-point
  for (int x = 0; x < pwidth; x+= spacing) {
    for (int y = 0; y < pheight; y+= spacing) {
        point(x, y);
    }
  }
}

void pointSphere(int r){
  // based on suggestion by koogs
  float z;
  pushStyle();
  for (int x = -r; x < r; x+= 10) {
    for (int y = -r; y < r; y+=10) {
      z = sqrt( (r*r) - (x*x) - (y*y));
        stroke(0,255,0);
        point(x, y, z);
        stroke(0,0,255);
        point(x, y, -z);
    }
  }
  popStyle();
}

void pointSphereFibonacci(int radius, int points){
  // based on fibonacci sphere by Jim Bumgardner
  // https:// www.openprocessing.org/sketch/41142
  float phi = (sqrt(5)+1)/2 - 1; // golden ratio
  float ga = phi*2*PI;           // golden angle
  for (int i = 1; i <= points; ++i) {
    float lon = ga*i;
    lon /= 2*PI; lon -= floor(lon); lon *= 2*PI;
    if (lon > PI)  lon -= 2*PI;
    float lat = asin(-1 + 2*i/(float)points);
    pushMatrix();
      rotateY( lon);
      rotateZ( -lat);
      point(radius,0,0);
    popMatrix();
  }
}