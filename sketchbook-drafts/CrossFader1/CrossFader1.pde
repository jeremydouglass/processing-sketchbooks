void draw() {
  background(0);
  noStroke();
  // update fader
  float f = crossFade(millis(), 3000, 6000, 255, 0); //3->6secs = 255->0 alpha
  // draw red fade
  fill(255, 0, 0, f);
  rect(0, 0, 75, 75);
  // draw green cross-fade
  fill(0, 255, 0, 255-f);
  rect(25, 25, 75, 75);
}
float crossFade (float amt, float start1, float stop1, float start2, float stop2) {
  return constrain(
    map ( amt, start1, stop1, start2, stop2 ), 
    min(start2, stop2), 
    max(start2, stop2)
    );
}