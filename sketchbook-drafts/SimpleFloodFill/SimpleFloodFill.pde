/**
 * Simple Flood Fill -- based on a sketch by CodeSloth
 * 2016-11-05 Processing 3.2.2
 * Click any pixel to highlight similar nearby pixels. Press any key to reset.
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
  floodFill(mouseX, mouseY);
}

void keyPressed(){
  image(img, 0, 0);
}

/**
 * floodFill marks all pixels within sensitivity of selected color.
 * Color is either found at xy coords or specified.
 * Based on http:// stackoverflow.com/questions/2783204/flood-fill-using-a-stack
 **/
void floodFill(int x, int y) {
  floodFill(x, y, get(x, y), 96);
}
// ** !! **
// Need to use a better algorithm to avoid StackOverflowError on large regions
// -  http://stackoverflow.com/questions/29914125/java-flood-fill-issue
// -  http://stackoverflow.com/questions/27341953/error-in-flood-fill-algorithm-in-java
void floodFill(int x, int y, color c_selected, int sensitivity) {
  if ( colorDist(get(x,y), c_selected) > sensitivity) return;
  set(x, y, color(255, 0, 0));
  floodFill(x - 1, y, c_selected, sensitivity);
  floodFill(x + 1, y, c_selected, sensitivity);
  floodFill(x, y - 1, c_selected, sensitivity);
  floodFill(x, y + 1, c_selected, sensitivity);
  return;
}

float colorDist(color c1, color c2) {
  return dist(red(c1), green(c1), blue(c1), red(c2), green(c2), blue(c2));
}