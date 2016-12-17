PImage[] theImages = new PImage[7];

void setup() {
  for (int i = 0; i < theImages.length; i++) {
    theImages[i] = loadImage(i+".gif");
  }
  frameRate(3);
}

void draw() {
  // Display The Images
  pushMatrix();
    translate(width/2, height/2);
    scale(random(0.5, 1));
    image(theImages[int(random(7))], 0, 0); //// draw a random image 0-6
  popMatrix();
}