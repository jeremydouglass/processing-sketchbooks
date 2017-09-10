/**
 * PauseSaveFrame
 * 2017-04-20 Jeremy Douglass Processing 3.2.3 
 * sketch runs for 10 seconds (10fps)
 * output pauses for 1 sec at 2, 4, 6, 8, 10 (15 secs total output at 10fps)
 * forum.processing.org/two/discussion/22104/freeze-the-movie-for-a-few-seconds
**/
void setup() {
  textAlign(CENTER, CENTER);
  frameRate(10);
}
void draw() {
  background(192);
  text(frameCount, width/2, height/2);
  if (frameCount%20==0) {
    for (int i=0; i<10; i++) {
      saveFrame("video/video_####_" + i + ".png");
    }
  } else {
    saveFrame("video/video_####_" + "0" + ".png");
  }
  if (frameCount>=100) {
    exit();
  }
}