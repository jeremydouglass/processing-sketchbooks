PImage[] theImages = new PImage[7];
IntList imageIndex = new IntList(); //// create an index

void setup() {
  for (int i = 0; i < theImages.length; i++) {
    theImages[i] = loadImage(i+".gif");
    imageIndex.append(i); //// create a simple list of index numbers 0 1 2 3 ....
  }
}

void draw() {
  // Display The Images
  for (int i = 0; i < theImages.length; i++) {
    pushMatrix();
    translate(width/2, height/2);
    scale(random(0.5, 1));
    image(theImages[imageIndex.get(i)], 0, 0); 
    popMatrix();
  }

// Shuffle the order of the images
  imageIndex.shuffle(); //// shuffle your index 2 0 3 1 ....
}