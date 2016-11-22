/** Flip Mirror Sketches
 *  2016-10-23 Processing 3.2.1
 *  Flip or mirror drawing between pushMatrix &popMatrix.
 *  Useful for camera interaction.
 *  https:// forum.processing.org/two/discussion/18571/
 **/

PImage img;

void setup(){
  size(512,512);
  img = loadImage("https://forum.processing.org/processing-org.jpg");
  strokeWeight(4);
}

void draw(){
  background(0);

  // start flipping
  if(keyPressed){
    pushMatrix();
    translate(width,0);
    scale(-1,1);
  }

  // flip drawing
  image(img,0,0);
  triangle(0,height/3,width,height/2,0,2*height/3);
  
  // stop flipping
  if(keyPressed){
    popMatrix();
  }
  
  // no flip drawing
  rect(0,0,width/4,height/4); 
}