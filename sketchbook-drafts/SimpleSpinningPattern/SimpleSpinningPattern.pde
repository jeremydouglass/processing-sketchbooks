// inspired by but not related to:
// forum.processing.org/two/discussion/22331/pattern-function-in-processing#latest
// 2017-05-01

float rotation, rotationAngle;
float scaling,  scalingFactor;

void setup(){
  size(400,400);
  rotation = 0.0;
  rotationAngle = 0.1;
  scaling  = 1.0;
  scalingFactor = 0.995;
}

void draw(){
  // cycle colors
  fill(frameCount%255);
  
  // draw rectangle
  translate(width/2,height/2);
  rotate(rotation);
  scale(scaling);
  rect(0,0,width*2,width/5);

  // update rotation and scaling
  rotation = rotation + rotationAngle;
  scaling  = scaling  * scalingFactor;

  // check to stop drawing
  if(scaling < max(0.001, 1.0/width)){
    noLoop();
  }
}