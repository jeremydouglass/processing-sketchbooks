// Pendulums0 -- a sin-based pendulum 
// based on a sketch by injuvik: https://forum.processing.org/two/discussion/15855/is-it-possible-to-create-a-pendolum-with-sin-and-cos

float a;          // angle
float cord;       // length of the string
float speed;      // speed of swing
float strength;   // strength of swing
float decay;      // decay of swing
float posx, posy;
 
void setup() {
  size(300, 300); 
  cord = 100;
  speed = PI/100;
  strength = 0.6;
  decay = 0.001;
}

void draw() {
  background(255);

  // find current pendulum position
  posx = sin(HALF_PI*sin(a)*strength)*cord;  
  posy = cos(HALF_PI*sin(a)*strength)*cord;

  // draw pendulum
  translate(width/2, height/2);
  noFill();
  ellipse(0, 0, 2*cord, 2*cord); 
  line(0, 0, posx, posy);
  fill(0,0,255);
  ellipse(0, 0, cord/2, cord/2); 
  fill(255,0,0);
  ellipse(posx, posy, cord/4, cord/4); 

  // slow or speed up pendulum
  if(mousePressed){
    strength = min(1, strength+0.01); // speed up
  } else {
    strength = max(strength - decay, 0); // slow down
  }
  // swing pendulum
  a = a + speed; 
}