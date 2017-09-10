// https:// forum.processing.org/two/discussion/18818/how-to-draw-a-transparent-pgraphics-image-not-possible-as-it-turns-out#latest

void setup(){
  size(200,200);
  fill(0,0,0,0);
  strokeWeight(20);
  stroke(255,56,0);
}
void draw(){
  background(0);
  fill(100);
  rect(10, 10, gw-20, gh-20, 10);
  arc(200/2, 200/2, 200*0.7, 200*0.7, 0, (millis()%4000.0)/4000*TWO_PI,OPEN); 
}