int OFFSET=20;
int COUNT=6;
PShape s;
PImage img;

void setup() {
  size(400, 400);
  strokeWeight(3);
  rectMode(CENTER);

  s = createShape();
  s.beginShape();
  s.stroke(192, 192, 192);
  s.fill(255,252,14);
  s.vertex(30, 0);
  s.vertex(10, 20);
  s.vertex(15, 25);
  s.vertex(5, 40);
  s.vertex(30, 20);
  s.vertex(25, 15);
  s.endShape(CLOSE);
  
  // img = loadImage("https://www.goodfreephotos.com/albums/textures/interior-shirt-texture.jpg");
}
void draw() {
  background(220);
  // image(img,0,0);
  translate(width/2-(OFFSET*(COUNT/2)), height/2-(OFFSET*(COUNT/2)));

  // shadows
  noStroke();
  fill(160,255); 
  stack(COUNT-0);

  // cards
  translate(10, -15);
  scale(1.05);
  stroke(192, 192, 192);
  fill(255);
  stack(COUNT);

  translate(56,42);
  
  scale(2.7);
  shape(s);
}

void stack(int c) {
  pushMatrix();
  for (int i=0; i<c; i++) {
    rect(0, 0, 120, 200, 10);
    translate(OFFSET, OFFSET);
  }
  popMatrix();
}