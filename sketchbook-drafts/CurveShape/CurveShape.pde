// https://forum.processing.org/two/discussion/18947/how-do-i-use-recursion-on-a-shape-made-out-of-curves#latest
// very broken -- half idea about a rewrite

PShape ps;

void setup() {
  size (1200, 800);
  ps = makeCurve();
}

void draw () {
  background(255);
  for (float scale = 1; scale > 0.4; scale -= 0.1) {
    scale(scale);
    shape(ps);
  }
}

PShape makeCurve() {
  PShape mc;
  mc = createShape();
  mc.beginShape();
  mc.stroke(255, 131, 59);
  mc.strokeWeight (3);
  mc.noFill();
  //curve(100, 300, 250, 200, 500, 100, 500, 400); 
  mc.curveVertex(100, 300);
  mc.curveVertex(250, 200); 
  mc.curveVertex(500, 100); 

  //curve(300, -690, 500, 100, 870, 180, 1000, 750); 
  mc.curveVertex(500, 100); 
  mc.curveVertex(870, 180); 

  // curve(600, -200, 870, 180, 1050, 240, 1500, 100);
  // curve(880, 300, 1050, 240, 1125, 298, 1117, 500);
  // curve(100, -800, 1125, 298, 1000, 450, 400, 500);
  // curve(200, 850, 700, 550, 1000, 450, 1400, 900);
  // curve(400, 0, 170, 400, 700, 550, 800, 200);
  // curve(400, 0, 170, 400, 250, 200, 800, 200);
  mc.endShape ();
  return mc;
}