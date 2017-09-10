PMatrix defaultMatrix;
PMatrix lastMatrix;
int turtleSize = 35;

void setup() {
  size(400, 400, P3D);
  translate(width/2,height/2);
  rotateX(radians(-90));
  defaultMatrix = new PMatrix3D();
  defaultMatrix = getMatrix();
  lastMatrix = new PMatrix3D();
  lastMatrix = getMatrix();
  // printMatrix();
  noFill();
  noLoop();
}
void draw(){
  background(128);
  setMatrix(lastMatrix);  // load matrix
  drawTurtle(turtleSize);
}

void keyPressed(){
  if(keyCode==UP){
    rotateX(radians(15));
  }
  if(keyCode==DOWN){
    rotateX(radians(-15));
  }
  if(keyCode==LEFT){
    rotateY(radians(15));
  }
  if(keyCode==RIGHT){
    rotateY(radians(-15));
  }
  if(key =='>' || key == '.'){
    rotateZ(radians(15));
  }
  if(key =='<' || key == ','){
    rotateZ(radians(-15));
  }
  if(key==' '){
    translate(0,0,-turtleSize);
  }
  if(keyCode==BACKSPACE){
    translate(0,0,turtleSize);
  }
  if(key =='+' || key == '='){
    turtleSize+=10;
  }
  if(key =='-' || key == '_'){
    if(turtleSize>10){
      turtleSize-=10;
    }
  }
  if(key =='`' || key == '~'){
    setMatrix(defaultMatrix);
  }
  lastMatrix = getMatrix(); // save matrix
  printMatrix();
  redraw();
}

void drawTurtle(float body){
  pushStyle();
  fill(0,128,0);
  sphereDetail(10);
  stroke(0,100,0);
  sphere(body); // body
  noStroke();
  fill(0,192,0);
  pushMatrix(); // legs and tail
    translate( body*(5.0/7), body*(5.0/7),-body*(5.0/7)); sphere(body*(2.0/7)); // r front leg
    translate(-body*(10.0/7),  0,  0); sphere(body*(2.0/7)); // l front leg 
    translate(  0,  0, body*(10.0/7)); sphere(body*(2.0/7)); // l back leg 
    translate( body*(10.0/7),  0,  0); sphere(body*(2.0/7)); // r back leg 
    translate(-body*(5.0/7),-body*(5.0/7), body*(2.0/7)); sphere(body*(1.0/7));  // tail
  popMatrix();
  pushMatrix(); // head
    translate(0,0,-body*(9.0/7));
    sphere(body*(4.0/7));
    fill(192,192,0);
    translate(-body*(2.0/7),0,-body*(4.0/7));
    sphere(body*(1.0/7));
    translate(body*(4.0/7),0,0);
    sphere(body*(1.0/7));
  popMatrix();
  popStyle();
}