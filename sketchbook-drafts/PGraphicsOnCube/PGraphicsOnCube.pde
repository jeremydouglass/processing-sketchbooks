// https://forum.processing.org/two/discussion/18701/how-can-i-put-a-rendered-image-on-the-side-of-a-cube
// http://eoimages.gsfc.nasa.gov/images/imagerecords/55000/55167/earth_lights.jpg
PShape sphereShape;
PImage sphereTexture;
PGraphics  pickingBuffer;
 
void setup() {
  size(600, 600, P3D);
  noStroke();
  fill(255);
 
  sphereTexture = loadImage("earth_lights.jpg");
  sphereShape = createShape(BOX, height/5);
 
  pickingBuffer = createGraphics(width, height, P3D);
}
 
void draw() {
  background(0);
 
 
  pickingBuffer.beginDraw(); 
  pickingBuffer.background(255, 0, 0);
  pickingBuffer.stroke(255, 255, 0);
  pickingBuffer.strokeWeight(5);
  pickingBuffer.line(20, 20, -frameCount%600, mouseX, mouseY, frameCount%600);
  pickingBuffer.endDraw();
 
  text("Current Z val: "+frameCount%600,width/2,4*height/5);
 
  translate(width/2, height/2);
  rotateY(TWO_PI*frameCount/600);
  sphereShape.setTexture(pickingBuffer);
  shape(sphereShape);
}