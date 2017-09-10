CrossFader cf;
void setup(){
  cf = new CrossFader(3000, 6000, 255, 0); //3->6secs = 255->0 alpha
}
void draw() {
  background(0);
  noStroke();
  // update fader
  float f = cf.fade(millis());
  // draw red fade
  fill(255, 0, 0, f);
  rect(0, 0, 75, 75);
  // draw green cross-fade
  fill(0, 255, 0, 255-f);
  rect(25, 25, 75, 75);
}

class CrossFader {
  float amt;
  float start1, stop1, start2, stop2;
  CrossFader(float start1_, float stop1_, float start2_, float stop2_) {    
    start1 = start1_;
    stop1 = stop1_;
    start2 = start2_;
    stop2 = stop2_;
  }
  float fade() {
    return fade(amt);
  }
  float fade(float amt_) {
    amt = amt_;
    return constrain(
      map ( amt_, start1, stop1, start2, stop2 ), 
      min(start2, stop2), 
      max(start2, stop2)
      );
  }
}