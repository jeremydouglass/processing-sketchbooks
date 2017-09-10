// sketch by kfrajer modified by jeremydouglass -- 2017-04-14
// https://forum.processing.org/two/discussion/21826/removing-an-object-once-it-has-been-hit-by-a-bullet

ArrayList<Aesteroid> aesteroidBelt;
int n=50;
float xSpeed = random(0.6, 2.5);
float ySpeed = random(0.6, 2.5);
float x = random(1, 590);
float y = random(1, 390);

void setup() {
  size(300, 200);
  ellipseMode(RADIUS);
  noCursor();
  aesteroidBelt = new ArrayList<Aesteroid>();
  // create
  for (int i=0; i<n; i++) {
    aesteroidBelt.add(new Aesteroid(color(255), 
      new PVector(random(width), random(height)), 
      new PVector(random(xSpeed), random(ySpeed))));
  }
}

void draw() {
  background(0);
  // draw mouse
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 10, 10);
  fill(255);
  // remove if touched
  for (int i = aesteroidBelt.size() - 1; i >= 0; i--) {
    if (aesteroidBelt.get(i).touched(mouseX, mouseY)) {
      aesteroidBelt.remove(aesteroidBelt.get(i));
    }
  }
  // move and draw
  for (Aesteroid ast : aesteroidBelt) {
    ast.update();
    ast.display();
  }
}

class Aesteroid {
  PVector loc;
  PVector vel;
  color c;
  int radius;
  Aesteroid(color tempC, PVector loc1, PVector vel1) {
    c = tempC;
    loc = loc1;
    vel = vel1;
    radius=15;
  }
  void display() {
    stroke(0);
    fill(c);    
    ellipse(loc.x, loc.y, radius, radius);
  }
  void update() {
    loc.add(vel);
    checkBoundaries();
  }
  // check wall bounce
  void checkBoundaries() {
    if ((loc.x >width-radius) || (loc.x < 0+radius)) {
      vel.x = vel.x * -1;
    }
    if ((loc.y > height-radius) || (loc.y < 0+radius)) {
      vel.y = vel.y * -1;
    }
  }
  // check if touched
  boolean touched(int x, int y) {
    if (dist(loc.x, loc.y, x, y) < radius) {
      return true;
    }
    return false;
  }
}