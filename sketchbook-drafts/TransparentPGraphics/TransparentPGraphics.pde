/**
 * Transparent PGraphics
 * 2016-10-31 Jeremy Douglass - Processing 3.2.1
 * https:// forum.processing.org/two/discussion/18818/how-to-draw-a-transparent-pgraphics-image-not-possible-as-it-turns-out
 **/

PGraphics gcontrols;
PGraphics gmask;
int gw, gh;

void setup() {
  size(440, 220);
  gw = 220;
  gh = 220;
  gcontrols = createGraphics(gw, gh);
  gmask = createGraphics(gw, gh);
  //// make mask
  gmask.beginDraw();
    gmask.fill(0,0,0,0);      // transparent (ellipse is ring, not circle)
    gmask.stroke(255);        // white (mask area)
    gmask.strokeWeight(20);   // ring thickness
    gmask.ellipse(gw/2, gh/2, gw/2, gh/2);  // draw ring
  gmask.endDraw();
}

void draw() {
  background(64);
  //// draw plate
  fill(100);
  rect(10, 10, gw-20, gh-20, 10);
  //// render controls
  gcontrols.beginDraw();
    gcontrols.background(64,50,0);
    gcontrols.fill(255,56,0);
    gcontrols.arc(gw/2, gh/2, gw*0.75, gh*0.75, 0, (millis()%4000.0)/4000*TWO_PI, PIE); 
  gcontrols.endDraw();
  //// mask controls and draw
  gcontrols.mask(gmask);
  image(gcontrols, 0, 0);
  
  //// show mask
  image(gmask,220,0);
}