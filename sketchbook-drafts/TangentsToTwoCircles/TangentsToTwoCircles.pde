/**
 * Tangents to Two Circles
 * https:// forum.processing.org/two/discussion/18975/simulating-shadow
 * 2016-11-10 Processing 3.2.1
 * a sketch based on the Bounce Example https:// processing.org/examples/bounce.html
 * with the addition of the CircleTangents class https:// en.wikibooks.org/wiki/Algorithm_Implementation/Geometry/Tangents_between_two_circles
 **/
 
int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

double[][] tangentList;

void setup() 
{
  size(640, 360);
  frameRate(30);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(102);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw light
  drawLight();

  // Draw the shape
  ellipse(xpos, ypos, rad, rad);
  
}

void drawLight(){
  pushStyle();
  // get tangent list, draw first two (external) tangents if they exist.
  tangentList = CircleTangents.getTangents((double)mouseX,(double)mouseY,(double)10, (double)xpos,(double)ypos,(double)rad);  
  if(tangentList.length > 1){
    line((float)tangentList[0][0], (float)tangentList[0][1], (float)tangentList[0][2], (float)tangentList[0][3]);
    line((float)tangentList[1][0], (float)tangentList[1][1], (float)tangentList[1][2], (float)tangentList[1][3]);
    
    fill(255,255,255,128);
    beginShape();
      vertex((float)tangentList[0][0],(float)tangentList[0][1]);
      vertex((float)tangentList[0][2], (float)tangentList[0][3]);
      vertex((float)tangentList[1][2], (float)tangentList[1][3]);
      vertex((float)tangentList[1][0],(float)tangentList[1][1]);
    endShape(CLOSE);
  }
  fill(255,255,0);
  ellipse(mouseX, mouseY, 10, 10);
  popStyle();
}

// Algorithm Implementation/Geometry/Tangents between two circles
import java.util.Arrays;
static class CircleTangents {
    /**
     *  Finds tangent segments between two given circles.
     *
     *  Returns an empty, or 2x4, or 4x4 array of doubles representing
     *  the two exterior and two interior tangent segments (in that order).
     *  If some tangents don't exist, they aren't present in the output.
     *  Each segment is represent by a 4-tuple x1,y1,x2,y2.
     * 
     *  Exterior tangents exist iff one of the circles doesn't contain
     *  the other. Interior tangents exist iff circles don't intersect.
     *
     *  In the limiting case when circles touch from outside/inside, there are
     *  no interior/exterior tangents, respectively, but just one common
     *  tangent line (which isn't returned at all, or returned as two very
     *  close or equal points by this code, depending on roundoff -- sorry!)
     *
     *  Java 6 (1.6) required, for Arrays.copyOf()
     */
    static double[][] getTangents(double x1, double y1, double r1, double x2, double y2, double r2) {
        double d_sq = (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2);
        if (d_sq <= (r1-r2)*(r1-r2)) return new double[0][4];

        double d = Math.sqrt(d_sq);
        double vx = (x2 - x1) / d;
        double vy = (y2 - y1) / d;

        double[][] res = new double[4][4];
        int i = 0;

        // Let A, B be the centers, and C, D be points at which the tangent
        // touches first and second circle, and n be the normal vector to it.
        //
        // We have the system:
        //   n * n = 1          (n is a unit vector)          
        //   C = A + r1 * n
        //   D = B +/- r2 * n
        //   n * CD = 0         (common orthogonality)
        //
        // n * CD = n * (AB +/- r2*n - r1*n) = AB*n - (r1 -/+ r2) = 0,  <=>
        // AB * n = (r1 -/+ r2), <=>
        // v * n = (r1 -/+ r2) / d,  where v = AB/|AB| = AB/d
        // This is a linear equation in unknown vector n.

        for (int sign1 = +1; sign1 >= -1; sign1 -= 2) {
            double c = (r1 - sign1 * r2) / d;

            // Now we're just intersecting a line with a circle: v*n=c, n*n=1

            if (c*c > 1.0) continue;
            double h = Math.sqrt(Math.max(0.0, 1.0 - c*c));

            for (int sign2 = +1; sign2 >= -1; sign2 -= 2) {
                double nx = vx * c - sign2 * h * vy;
                double ny = vy * c + sign2 * h * vx;

                double[] a = res[i++];
                a[0] = x1 + r1 * nx;
                a[1] = y1 + r1 * ny;
                a[2] = x2 + sign1 * r2 * nx;
                a[3] = y2 + sign1 * r2 * ny;
            }
        }
        
        return Arrays.copyOf(res, i);
    }
}