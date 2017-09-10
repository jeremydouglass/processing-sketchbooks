// Pendulums -- a sin-based pendulum class
// Jeremy Douglass 2017-04-16 Processing 3.2.2
// based on a sketch: https://forum.processing.org/two/discussion/15855/is-it-possible-to-create-a-pendolum-with-sin-and-cos

Pendulum pen, penDouble, penOffset, penSlow;

void setup() {
  size(300, 300);
  pen       = new Pendulum(100, PI/100, 0.5, 0, 0);
  penDouble = new Pendulum( 40, PI/50, 0.5, 0, 0);
  penOffset = new Pendulum( 40, PI/100, 0.5, 0, HALF_PI);
  penSlow   = new Pendulum( 40, PI/100, 1.0, 0.002, 0);
}
void draw() {
  background(255);
  fill(0);
  text("hold mouse to recharge top: \ntap key to pause middle:", 10, 20);

  translate(width/2, height/2);
  penDraw(pen);
  translate(-100, 100);
  penDraw(penDouble);
  translate(200, 0);
  penDraw(penOffset);
  translate(0, -200);
  penDraw(penSlow);

  if (mousePressed) {
    penSlow.faster();
  } else {
    penSlow.slower();
  }
}

void keyReleased() {
  pen.paused = !pen.paused; // freeze-unfreeze pendulum
}

void penDraw(Pendulum p) {
  if (!p.paused) { 
    p.update();
  }
  pushStyle();
  noFill();
  stroke(128);
  arc(0, 0, 2*p.rod, 2*p.rod, HALF_PI*(1-p.strength), HALF_PI*(1-p.strength) + PI*p.strength);
  stroke(0);
  if (!p.paused) {
    fill(255, 0, 0, p.strength*255);
    ellipse(0, 0, p.rod/2, p.rod/2);
  }
  line(0, 0, p.pos.x, p.pos.y);
  fill(0, 0, 255);
  ellipse(p.pos.x, p.pos.y, p.rod/4, p.rod/4);
  popStyle();
}

class Pendulum {
  float rod;        // length of the rod
  float speed;      // speed of swing
  float strength;   // strength of swing
  float decay;      // decay of swing
  float time;       // time
  boolean paused;
  PVector pos = new PVector();

  Pendulum(float rod_, float speed_, float strength_, float decay_, float time_) {
    rod = rod_;
    speed = speed_;
    strength = strength_;
    decay = decay_;
    time = time_;
  };
  void update() {
    pos.x = sin(HALF_PI*strength*sin(time))*rod;  
    pos.y = cos(HALF_PI*strength*sin(time))*rod;
    time = time + speed;
  }
  void faster() {
    strength = min(1, strength + decay);
  }
  void slower() {
    strength = max(strength - decay, 0);
  }
}