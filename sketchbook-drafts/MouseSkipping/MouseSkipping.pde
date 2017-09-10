https://forum.processing.org/two/discussion/22478/trying-to-simulate-paint-app-in-processing-question-about-drawing-effect#latest

int far=50;
boolean skip;
void setup() {
  size(400,400);
  frameRate(10);
}
void draw() {
  if (dist(pmouseX, pmouseY, mouseX, mouseY)<far) {    
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    // ellipse(pmouseX, pmouseY, 10, 10);
    ellipse(mouseX, mouseY, 10, 10);
  }
}