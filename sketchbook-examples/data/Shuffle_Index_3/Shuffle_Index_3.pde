PImage[] theImages = new PImage[7];
IntList imageIndex = new IntList(); //// create an index

void setup() {
  for (int i = 0; i < theImages.length; i++) {
    theImages[i] = loadImage(i+".gif");
    imageIndex.append(i); //// create a simple list of index numbers 0 1 2 3 ....
  }
  imageIndex.shuffle(); //// pre-shuffle
  frameRate(1);
}

void draw() {
  // Every 7 frames, reshuffle the index
  if(frameCount % 7 == 0){
    imageIndex.shuffle(); //// shuffle your index 2 0 3 1 ....
  }

  // Display The Images
  pushMatrix();
    translate(width/2, height/2);
    scale(random(0.5, 1));
    image(theImages[imageIndex.get(frameCount % 7)], 0, 0); //// look up images through index based on the frame number 
  popMatrix();

}