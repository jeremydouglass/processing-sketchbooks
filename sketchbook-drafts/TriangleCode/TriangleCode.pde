//// Triangle Code the Processing Way
//// https:// forum.processing.org/two/discussion/18240/triangle-code#latest

void setup(){
  size (600,600);
}
 
void draw(){
  background(255);
  for(int i=0; i<width; i+=10){
    stroke(0);
    strokeWeight(1);
    line(i,0,i,height);
  }
  for(int w=0; w<height; w+=10){
    stroke(0);
    line(0,w,width,w);
  }
  
  fill(255,0,0);
  stroke(255);
  ellipse(300,300,5,5);
  
  noFill();
  stroke(255,0,0);
  strokeWeight(4);
  triangle(100,100,200,100,200,200);
  
  rotate(PI/3);
  triangle(100,100,200,100,200,200);
  
  translate(-50, -200);
  triangle(100,100,200,100,200,200);
  
  scale(2);
  triangle(100,100,200,100,200,200);
  
  // noLoop();
  // saveFrame("triangles.png"); 
}