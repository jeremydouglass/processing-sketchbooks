/** Click to remove image
 *  2016-09-21 Jeremy Douglass Processing 3.2.1
 */

boolean drawStack = true;

ArrayList<PImage> myImages = new ArrayList<PImage>();
void setup(){
  size(402,268);  
  imageMode(CENTER);
  myImages.add(loadImage("https://upload.wikimedia.org/wikipedia/commons/c/ce/PNG_demo_Banana.png"));
  myImages.add(loadImage("https://upload.wikimedia.org/wikipedia/commons/3/39/PNG_demo_heatmap_Banana.png"));
  //// load more images here
  println("Loaded", myImages.size(), "images");
}

void draw()
{
  background(0);
  if(drawStack == false){

    //// Solution A: if images cover each other, draw only the last image
    if(myImages.size() > 0){
      PImage im = myImages.get(myImages.size()-1);
      image(im, im.width/2, im.height/2);
    }

  } else {
    
    //// Solution B: if images don't cover each other, draw all
    for(PImage im : myImages){
      image(im, im.width/2, im.height/2);
    }

  }
}
void mouseClicked(){ //// mousePressed might fire many times with a long press
  if(myImages.size() > 0){ //// only remove if there is something there
    println("Removing #", myImages.size()-1);
    myImages.remove(myImages.size()-1); //// remove the last image (#size-1)
  }
}