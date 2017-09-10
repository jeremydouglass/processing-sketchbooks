// forum.processing.org/two/discussion/21356/how-to-draw-waves-like-those-in-the-pictures
// 2017-04-14 Jeremy Douglass -- Processing 3.2.3

float x, y, x0, y0;
float amplitude, period, phase;
float amplitude_drift, period_drift;
float COUNT = 40;

void setup(){
  size(400,200);
  stroke(96,96);
  frameRate(20);
}
void draw() {
  // draw a new wave of curves every COUNT frames
  if(frameCount%COUNT == 1){
    background(255);
    randomWave();
  }
  // draw one curve in the new wave
  x0=y0=0;
  // drift new curve compared to last curve
  amplitude += amplitude_drift;
  period += period_drift;
  for (x = 0; x < width; x += 1) {
    y = amplitude * sin(x * (TWO_PI/period) - (phase*period)) + height/2;
    line(x0,y0,x,y);
    x0=x;
    y0=y;
  }
}

// randomize settings for next wave (set of curves)
void randomWave(){
  amplitude = random(20,100);
  period = random(250,350);
  phase = random(-.01,.01);
  amplitude_drift = random(-3,3);
  period_drift = random(-10,20);
}