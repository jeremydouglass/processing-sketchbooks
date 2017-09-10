// forum.processing.org/two/discussion/22468/magnetic-objects-in-processing#latest
Ball b, b2;
void setup(){
  size(400,400);
  b = new Ball(width/2,height/2,30,100);
  b2 = new Ball(100,100,10,50);
}
void draw(){
  background(0);
  b.display();
  b2.display();
  b.attract(mouseX,mouseY);
  b2.attract(mouseX,mouseY);
}

class Ball {  
  float x, y;
  float diameter;
  float attract;
  Ball(float xin, float yin, float din, float ain) {
    x = xin;
    y = yin;
    diameter = din;
    attract = ain;
  }
  void display() {
    ellipse(x, y, diameter, diameter);
  }
  void attract(float x2, float y2){
    if(dist(x,y,x2,y2)<attract){
      x = lerp(x,x2,0.1);
      y = lerp(y,y2,0.1);
    }
  }
}