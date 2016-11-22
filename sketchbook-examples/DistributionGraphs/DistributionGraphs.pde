/**
 * Four U-Distributions
 * 2016-10-05 Jeremy Douglass
 * One with randomGaussian(), one with sin().
 * Hold down any key to refresh.
 * Processing 3.2.1
 **/
float[] myGauss;
float[] myMap;
float[] myNorm;
float[] mySine;
int count;
 
void setup(){
  size(200,200);
  textAlign(CENTER,CENTER);
  count = 50;
  myGauss = gaussianDist(count, height/5);
  myMap = mapDist(count, height/5);
  myNorm = normDist(count, height/5);
  mySine = sineDist(count, height/5);
  noLoop();
}
 
void draw(){
  background(192);
  for(int i = 0; i<count; i++){
    line(i*width/count, height*1/4, i*width/count, height*1/4 - myGauss[i]);
    line(i*width/count, height*2/4, i*width/count, height*2/4 - myMap[i]);
    line(i*width/count, height*3/4, i*width/count, height*3/4 - myNorm[i]);
    line(i*width/count, height,     i*width/count, height     - mySine[i]);
  }
  text("PRESS SPACE TO REFRESH", width/2,height/32);
  text("gaussian",width/2,height*1/8);
  text("map",     width/2,height*3/8);
  text("normal",  width/2,height*5/8);
  text("sine",    width/2,height*7/8);
}
 
void keyPressed(){
  myGauss = gaussianDist(count, height/5);
  myMap = mapDist(count, height/5);
  myNorm = normDist(count, height/5);
  mySine = sineDist(count, height/5);
  redraw();
}
 
//// see also https:// processing.org/reference/sin_.html
float[] sineDist(int count, float scale){
  float[] vals = new float[count];
  float x = PI;
  for (int i = 0; i < count; i++) {
    vals[i] = (1 + sin(x)) * scale;
    x = x + (PI)/count;
  }
  return vals;
}
 
 
//// see also https:// processing.org/reference/randomGaussian_.html
float[] gaussianDist(int count, float scale){
  float[] vals = new float[count];
  //// fill a list with random numbers
  for(int i = 0; i<vals.length; i++){
    vals[i] = randomGaussian();
  }
  //// sort to -1..0..+1 dist
  vals = sort(vals);
  //// flip to +1..0..+1 dist, scale
  float vmax = max(abs(max(vals)),abs(min(vals)));
  for(int i = 0; i<vals.length; i++){
    vals[i] = abs(vals[i] * scale/vmax);
  }
  return vals;
}

//// based on @quark https:// forum.processing.org/two/discussion/comment/75903/#Comment_75903
float[] normDist(int count, float scale){
  float[] vals = new float[count];
  for(int i = 0; i<vals.length; i++){
    vals[i] = (random(-1, 1) + random(-1, 1) + random(-1, 1) + random(-1, 1) + random(-1, 1) + random(-1, 1))/6;
  }
  vals = sort(vals);
  for(int i = 0; i<vals.length; i++){
    vals[i] = abs(vals[i]*scale);
  }
  return vals;
}

//// based on @Chrisir https:// forum.processing.org/two/discussion/comment/75885/#Comment_75885
float[] mapDist(int count, float scale){
  float[] vals = new float[count];
  for(int i = 0; i<vals.length; i++){
    vals[i] = abs(map(i,0,scale,-count/2,count/2));
  }
  return vals;
}