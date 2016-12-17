// Frame Rate Averager
// 2016-11-10
float avgRate;
void setup() {
  size(200, 200, P3D); // default
  // size(200, 200, P2D); 
  // size(200, 200, P3D); 
}
void draw() {
  avgRate = lerp(avgRate, frameRate, 0.005);
  background(0);
  text(String.format("%.1f", avgRate), width/2, height/2);
}