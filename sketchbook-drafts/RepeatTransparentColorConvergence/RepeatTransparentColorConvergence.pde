// Repeat Transparent Color Convergence
// 2016-11-15 Processing 3.2.3
// https:// github.com/processing/processing/issues/4743
// blacker and whiter squares stall out at (25,25,25) and (230,230,230)
color c1, c2;
color prev1, prev2;
int alpha = 20;

void setup() {
  size(400,200); 
  noStroke();
  textAlign(CENTER,CENTER);
  frameRate(15);
  background(128);
}
void draw() {
  // wash blacker
  fill(0,alpha);
  rect(0,0,width/2,height);
  // wash whiter
  fill(255,alpha);
  // reference strip
  rect(width/2,0,width,height);
  for(int i = 0; i <= 480; i+=5) {
    int gray = (int)map(i, 0, 480, 0, 255);
    noStroke();
    fill(gray);
    rect(i, 0, 20,40);
  }
  // console inspector
  c1 = get(width/4,height/2);
  c2 = get(3*width/4, height/2);
  println(red(c1),green(c1),blue(c1),"  |  ", red(c2),green(c2),blue(c2));
  // stop when no longer changing
  if(prev1 == c1 && prev2 == c2){
    fill(255);
    text(red(c1)+" "+green(c1)+" "+blue(c1),width/4,height/2);
    fill(0);
    text(red(c2)+" "+green(c2)+" "+blue(c2),3*width/4, height/2);
    noLoop();
  }
  prev1 = c1;
  prev2 = c2;
}