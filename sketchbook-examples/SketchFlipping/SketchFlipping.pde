/**
 * Sketch Flipping
 * 
 * Flipping mirroring, reversing, or mirroring sketch display elements.
 * Particularly useful for camera interaction.
 * Output can be mapped directly to input, with rendering mirrored.
 * 
 * Press any key to flip screen output.
 * 
 * @author Jeremy Douglass
 * @since 2016-10-23
 * Processing 3.2.1
 * https://forum.processing.org/two/discussion/18571/
 */

PImage img;

void setup(){
  size(512,512);
  img = loadImage("processing-org.jpg");
  strokeWeight(4);
}

void draw(){
  background(0);
  // start optional flipping
  if(keyPressed){
    pushMatrix();
      translate(width,0);
      scale(-1,1);
  }
  // flippable content
  image(img,0,0); 
  text("flippable", width/2, height/6);

  // stop optional flipping
  if(keyPressed){
    popMatrix();
  }
  // unflippable content
  rect(0,0,width/4,height/4);
  text("unflippable", 20, height/4 + 20);
}