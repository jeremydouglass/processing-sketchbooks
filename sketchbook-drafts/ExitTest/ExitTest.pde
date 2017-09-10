//// do something on exit
void setup() {
  size(400, 400);
}
void draw() {
  if(millis()>10000){exit();}
}
void exit() {
  println("exiting");
  saveFrame("frame-######.png");
  super.exit();
}