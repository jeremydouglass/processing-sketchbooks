PVector brushV;
float sensativity;
void setup(){
  brushV = new PVector(0.5,0.5);
  sensativity = 0.05;
}
void draw() {
  brushV = brushV.lerp(new PVector(mouseY-pmouseY, mouseX-pmouseX).setMag(1),sensativity).copy();
  if (mousePressed == true) {
    for(int i=0;i<20;i=i+2){
      line(mouseX - (i*brushV.x), mouseY + (i*brushV.y), pmouseX - (i*brushV.x), pmouseY + (i*brushV.y));
    }
  }
}