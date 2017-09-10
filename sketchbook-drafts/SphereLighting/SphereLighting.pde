/**
 * Sphere Lighting
 * 2016-10-30 Jeremy Douglass - Processing 3.2.1
 * https:// forum.processing.org/two/discussion/18352/
 **/
 
float sw, sh, sr; // sphere width, height, radius
float lightX, lightY;

void setup() {
  size(800, 400, P3D);
  textAlign(CENTER,CENTER);
  textSize(12);
  textMode(SHAPE);
  sw = width/7.0;
  sh = height/3.0;
  sr = width/14.0;
}  
void draw() {
  background(64);
  translate(0,0,-70);

  styleSphere ( sw * 0, sh * 0, sr, "noStroke", 0,  "noFill");
  styleSphere ( sw * 1, sh * 0, sr, "noStroke", 0,  "0");
  styleSphere ( sw * 2, sh * 0, sr, "noStroke", 0,  "255");
  styleSphere ( sw * 0, sh * 1, sr, "0",        1,  "noFill");
  styleSphere ( sw * 1, sh * 1, sr, "0",        1,  "0");
  styleSphere ( sw * 2, sh * 1, sr, "0",        1,  "255");
  styleSphere ( sw * 0, sh * 2, sr, "255",      1,  "noFill");
  styleSphere ( sw * 1, sh * 2, sr, "255",      1,  "0");
  styleSphere ( sw * 2, sh * 2, sr, "255",      1,  "255");

  styleSphere ( sw * 4, sh * 0, sr, "noStroke", 0, "noFill");
  styleSphere ( sw * 5, sh * 0, sr, "noStroke", 0, "0");
  styleSphere ( sw * 6, sh * 0, sr, "noStroke", 0, "255");
  styleSphere ( sw * 4, sh * 1, sr, "0",        10, "noFill");
  styleSphere ( sw * 5, sh * 1, sr, "0",        10, "0");
  styleSphere ( sw * 6, sh * 1, sr, "0",        10, "255");
  styleSphere ( sw * 4, sh * 2, sr, "255",      10, "noFill");
  styleSphere ( sw * 5, sh * 2, sr, "255",      10, "0");
  styleSphere ( sw * 6, sh * 2, sr, "255",      10, "255");
}

void styleSphere(float x, float y, float r, String strStroke, int strWeight, String strFill){
  pushMatrix();
    translate(x, y, 0);
    translate(r, r, 0);

    //// draw sphere
    pushStyle();
      lightControl();
      strokeWeight(strWeight);
      if(strStroke == "noStroke") { noStroke(); }
      else { stroke(int(strStroke)); }
      if(strFill == "noFill") { noFill(); }
      else { fill(int(strFill)); }
      sphere(r);
    popStyle();

    //// draw label
    translate(0,0,80);
    pushStyle();
      strokeWeight(1);
      fill(255);
      noLights();
      rect(-36,-24,72,48);
      fill(0);
      text(strStroke + "/" + strWeight + "\n" + strFill, 0,0,0);      
    popStyle();
    
  popMatrix();
}

void lightControl(){
  // lights();
  directionalLight(255, 204, 204,
    -(mouseX / float(width)  - 0.5) * 2,
    -(mouseY / float(height) - 0.5) * 2,
    -1); 
}





void strokeControl(){
  if(!mousePressed){
    strokeWeight(1);
  } else {
    strokeWeight(mouseX/(float)width * width/30);
  }
  // strokeWeight(cos(TWO_PI * (millis()%20000/20000.0)) * width/30); 
  // c1 = str(int(255 * (mouseY/(float)height)));
  // c2 = str(255 - int(c1));
  // c1 = str(0);
  // c2 = str(255);
}