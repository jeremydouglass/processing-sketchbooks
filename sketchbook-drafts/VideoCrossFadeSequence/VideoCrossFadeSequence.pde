/**
 * VideoCrossFade
 * 2016-11-16 Jeremy Douglass - Processing 3.2.3
 * based on "Loop" Processing example sketch 
 *
 * - 640x360 short video file from "Loop" Processing example sketch
 * - 640x360 short video file from http:// www.sample-videos.com/index.php#sample-mp4-video
 **/

import processing.video.*;

Movie movie;
Movie movie2;
int fadeStartTime = 0;
int fadeDuration = 3000; // 3 seconds

void setup() {
  size(640, 720);
  textAlign(CENTER,CENTER);
  
  // Load and play each video in a loop
  movie = new Movie(this, "transit.mov");
  // movie.loop();
  // movie.volume(0);
  movie2 = new Movie(this, "SampleVideo_640x360_1mb.mp4");
  // movie2.loop();
  // movie2.volume(0);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  // clear screen
  background(0);
  
  // calculate fader level 0-255 based on time since last keypress
  float fader = map( millis()-fadeStartTime, 0, fadeDuration, 255, 0 );
  fader = constrain( fader, 0, 255 );

  if(fader < 255){
    // cross-fade movie image and display
    tint(255, 255-fader);
    image(movie, 0, 0, width, height/2);
  }

  if(fader > 0){
    // fade movie image and display
    tint(255, fader);
    image(movie2, 0, height/2, width, height);
  }
  
  // show it again in a mini monitor
  tint(255, 255);
  rect(-2, -2, 132, 76);
  tint(255, 255-fader);
  image(movie,  0, 0, 128, 72);
  tint(255, fader);
  image(movie2, 0, 0, 128, 72);

  
  text("Press space to reset cross-fade", width/2, height/2);
}

void keyPressed(){
  fadeStartTime = millis();
}