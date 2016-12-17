// word-at-a-time reading, general frame rate control sketch
// 2016-12-09
// https://forum.processing.org/two/discussion/19593/fast-reading-system#latest

int fpm;    // frames per minute
float fps;  // frames per second
String text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
String[] words; 

void setup(){
  size(200,200);
  fpm = 300;
  updateFrameRate(fpm);
  words = split(text, ' ');
}
void draw(){
  background(0);

  // draw labels
  textAlign(RIGHT);
  text("+/- fpm:", 80, 20);  
  text("fps:", 80, 40);
  text("frate:", 80, 60);
  text("count:", 80, 80);

  // draw values
  textAlign(LEFT);
  text(fpm, 100 ,20);
  text(fps, 100, 40);
  text(frameRate, 100, 60);
  text(frameCount, 100, 80);
  text(words[frameCount%words.length], 100, 120);
}

void keyPressed(){
  if(key=='+' || key=='='){
    fpm = fpm + 10;
  }
  if(key=='-'){
    fpm = fpm - 10;
  }
  // set minimum and maximum fpm
  constrain(fpm,30,1200);
  updateFrameRate(fpm);
}

void updateFrameRate(int fpm){
  fps = fpm/60.0;
  frameRate(fps);
}