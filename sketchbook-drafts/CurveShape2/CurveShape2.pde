// https://forum.processing.org/two/discussion/18947/how-do-i-use-recursion-on-a-shape-made-out-of-curves#latest
void setup() {
  size (1200, 800);
}
void draw () {
  background(255);
  translate(width/2,height/2); // draw with 0,0 at the center of the screen
  for (float scale = 1; scale > 0.4; scale -= 0.025) {
    scale(scale);
    drawCurve();
  }
}
void drawCurve() {
  stroke(255, 131, 59);
  strokeWeight (3);
  noFill();
  pushMatrix();
    ellipse(0, 0, 2, 2);
    // Align 0,0 with the center of the width/height of the curve.
    // The curves run from x=170 to x=1125, and y = 100 to 550.
    // So the center is offset (1125+170)/2 = 647.5 , y = (550+100)/2 = 325. 
    // We fix that by subtracting.
    translate (-647.5, -325);
    curve(100, 300, 250, 200, 500, 100, 500, 400); 
    curve(300, -690, 500, 100, 870, 180, 1000, 750); 
    curve(600, -200, 870, 180, 1050, 240, 1500, 100);
    curve(880, 300, 1050, 240, 1125, 298, 1117, 500);
    curve(100, -800, 1125, 298, 1000, 450, 400, 500);
    curve(200, 850, 700, 550, 1000, 450, 1400, 900);
    curve(400, 0, 170, 400, 700, 550, 800, 200);
    curve(400, 0, 170, 400, 250, 200, 800, 200);
    // ... although it would have been better to draw the curves around 0,0 in the first place!
  popMatrix();

}