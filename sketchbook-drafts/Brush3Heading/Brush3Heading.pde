PVector mhead, pmhead;
float sensativity;
void setup(){
  mhead = new PVector(0.5,0.5);
  sensativity = 0.05;
}
void draw() {
  mhead = mhead.lerp(new PVector(mouseY-pmouseY, mouseX-pmouseX).setMag(1),sensativity);
  if (mousePressed == true) {
    for(int i=0;i<20;i=i+2){
      line(mouseX - (i*mhead.x), mouseY + (i*mhead.y), pmouseX - (i*pmhead.x), pmouseY + (i*pmhead.y));
    }
  }
  pmhead = mhead.copy();
}