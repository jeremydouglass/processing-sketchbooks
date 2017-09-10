/**
 * Simple Magic Fill -- based on a sketch by CodeSloth
 * 2016-11-05 Processing 3.2.2
 * Click any pixel to highlight similar pixels. Press any key to reset.
 * https:// forum.processing.org/two/discussion/18902/magic-wand-flood-fill-question#latest
 **/ 
PImage img;
void setup() {
  size(600, 600);
  fill(255, 0, 0);
  img = loadImage ("https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Sunflower_sky_backdrop.jpg/693px-Sunflower_sky_backdrop.jpg");
  image(img, 0, 0);
}

void draw() {}

void mouseClicked() {
  magicFill(mouseX, mouseY);
}

void keyPressed(){
  image(img, 0, 0);
}

/**
 * magicFill marks all pixels within sensitivity of selected color.
 * Color is either found at xy coords or specified.
 **/
void magicFill(int x, int y) {
  magicFill(get(x, y));
}
void magicFill(color c_selected) {
  int sensitivity = 96;
  println("magicFill:", c_selected, sensitivity);
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    if ( colorDist(pixels[i], c_selected) < sensitivity) {
      pixels[i] = color(255, 0, 0);
    }
  }
  updatePixels();
}

float colorDist(color c1, color c2) {
  return dist(red(c1), green(c1), blue(c1), red(c2), green(c2), blue(c2));
}