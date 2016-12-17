// Processing P3D background on/off bug?
// press d - d to turn background off, then on again to reveal bug.
// PDE 3.2.3
boolean isbg = false;
void setup() {
  size(200, 200, P3D);
  frameRate(6);
  background(0);
}
void draw() {
  if (isbg) background(0);
  ellipse(mouseX, mouseY, 40, 40);
}
void keyPressed() {
  if (key == 'd') isbg = !isbg;
}