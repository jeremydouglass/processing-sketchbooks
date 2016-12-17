//// push particles with mouse
//// based on simple particle system from https://forum.processing.org/two/discussion/18238/how-do-i-write-a-particle-system-to-evolve-to-form-an-uploaded-black-and-white-image#latest

PVector position = new PVector();

float drift = 2.0;
float pushRadius = 20.0;

Particle[] particles = new Particle[1000];
void setup() {
  background(255);
  size(300,300);
  for(int i = 0; i < particles.length; i++) {
    position.x = random(width);
    position.y = random(height);
    particles[i] = new Particle(position.x,position.y);
  }     
}

void draw() {
  background(255);
  for(int j = 0; j < particles.length; j++) {

    //// move particles around every frame
    particles[j].x += random(-drift,drift);
    particles[j].y += random(-drift,drift);

    //// find particles near the mouse
    if(abs(particles[j].x-mouseX)<pushRadius){
      if(abs(particles[j].y-mouseY)<pushRadius){
        //// ...and push them away
        particles[j].x = particles[j].x + (particles[j].x - mouseX);
        particles[j].y = particles[j].y + (particles[j].y - mouseY);
      }
    }
    
    //// push particles back inside the screen
    if(particles[j].x<0){ particles[j].x = 0; }
    if(particles[j].x>width){ particles[j].x = width; }
    if(particles[j].y<0){ particles[j].y = 0; }
    if(particles[j].y>height){ particles[j].y = height; }

    particles[j].show();
  } 
}

class Particle {
  float x;
  float y;
  Particle(float x_,float y_) {
    x = x_;
    y = y_;
  }
  void show() {
    fill(0);
    strokeWeight(.1);
    rect(x,y,3,3);
  }
}