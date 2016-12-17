/**
 * Mouse Wrapping
 * 2016-12-10 Jeremy Douglass - Processing 3.2.3
 * https:// forum.processing.org/two/discussion/19649/
 */
 
float scale;
float mx,my,pmx,pmy,mscale;

void setup(){
  size(600,600);
  strokeWeight(2);
  scale = 3;
  // draw scale frame
  frame(scale);
}

void draw(){
  // draw scaled line segment
  mouseWrap(scale);
  line (mx, my, pmx, pmy);
  // store previous position
  pmx = mx;
  pmy = my;
}

void mouseWrap(float mscale){
  // calculate scaled mouse coordinates
  mx = mouseX*mscale%width;
  my = mouseY*mscale%width;
  // break line at screen wraps
  if((mx - pmx)>width/2) { pmx = width;  }
  if((my - pmy)>height/2){ pmy = height; }
  if((pmx - mx)>width/2) { pmx = 0;  }
  if((pmy - my)>height/2){ pmy = 0; }
}

void frame(float fscale){
  rect(floor((fscale-1)/2) * width/fscale, floor((fscale-1)/2) * height/fscale, width/fscale, height/fscale);
}

  // http://www.local-guru.net/blog/pages/ttslib

void mouseLine(){
  pushStyle();
  stroke(192);
  line(mouseX,mouseY,pmouseX,pmouseY);
  popStyle();
}

void mouseStatus(){
  pushStyle();
  fill(255);
  rect(0,0,70,20);
  fill(0);
  text (mouseX + " " + mouseY,10,15);
  popStyle();
}