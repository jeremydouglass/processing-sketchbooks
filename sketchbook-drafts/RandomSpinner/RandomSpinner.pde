PVector spinner;
float stepSize = 10;
 
void setup() { 
  size(800, 800);
  textSize(60);
  textAlign(CENTER,CENTER);
  spinner = new PVector(100,100);
  spinner.rotate(random(0,2)); // random initial position
}
 
void draw() { 
  background(255);
  strokeWeight(2);
  pushStyle();
  fill(255, 0, 0);
  rect(100, 100, 300, 300);
  fill(0, 96, 255);
  rect(100, 400, 300, 300);
  fill(255, 240, 0);
  rect(400, 100, 300, 300);
  fill(0, 255, 0);
  rect(400, 400, 300, 300);
  strokeWeight(20);
  line(width/2, height/2, width/2+spinner.x, height/2+spinner.y);
  popStyle();
 
  if(stepSize > 0){
    spinner.rotate(radians(stepSize));
    stepSize -= 0.05;
  }
  else{
    float h = degrees(spinner.heading());
    String htxt = "";
    if(h >=    0 && h <  90){ htxt = "Lower Right"; }
    if(h >=   90 && h < 180){ htxt = "Lower Left"; }
    if(h >= -180 && h < -90){ htxt = "Upper Left"; }
    if(h >=  -90 && h <   0){ htxt = "Upper Right"; }
    text(htxt, width/2, height/2);
  }
}

void mousePressed() {
  stepSize = random(5, 15);
}