/**
 * Two U-Distributions
 * 2016-10-04
 * One with randomGaussian(), one with sin()
 * Hold down any key to refresh.
 **/
float[] myGauss;
float[] mySine;
int count;

void setup(){
  size(200,200);
  count = 50;
  myGauss = gaussianDist(count, height/4);
  mySine = sineDist(count, height/4);
  noLoop();
}

void draw(){
  background(192);
  for(int i = 0; i<count; i++){
    line(i*width/count, height/2, i*width/count, height/2-mySine[i]);
    line(i*width/count, height-5, i*width/count, height-myGauss[i]-5);
  }
}

void keyPressed(){
  myGauss = gaussianDist(count, height/4);
  mySine = sineDist(count, height/4);
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
  println(min(vals));
  println(max(vals));
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