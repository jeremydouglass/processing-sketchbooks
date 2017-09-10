/**
 * VideoCrossFade2
 * 2017-04-28 Jeremy Douglass - Processing 3.3
 * based on "Loop" Processing example sketch 
 *
 * - 640x360 short video file from "Loop" Processing example sketch
 * - 640x360 short video file from http:// www.sample-videos.com/index.php#sample-mp4-video
 **/

import processing.video.*;

boolean go;
Movie movie, movie2;
float fader, fader2;
int fadeDuration = 3000; // 3 seconds

void setup() {
  size(640, 360);
  textAlign(CENTER, CENTER);
  movie = new Movie(this, "transit.mov");
  movie2 = new Movie(this, "SampleVideo_640x360_1mb.mp4");
  movie.volume(0);
  movie2.volume(0);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  background(0);
  if (movie.available()) {
    println(movie.duration(), movie.time());
    fader  = map( movie.duration() - movie.time(), 0, fadeDuration, 255, 0 );
    fader  = constrain( fader, 0, 255 );
  }
  if (movie2.available()) {
    fader2 = map( movie2.time(), 0, fadeDuration, 0, 255 );
    fader2 = constrain( fader2, 0, 255 );
  }
  tint(255, fader2);
  image(movie, 0, 0, movie.width, movie.height);

  tint(255, fader);
  image(movie2, 0, 0, movie2.width, movie2.height);
}

void keyPressed() {
  go=!go;
  if (go) {
    println("go");
    loop();
    movie.play();
    movie2.play();
  } else {
    println("stop");
    noLoop();
    movie.stop();
    movie2.stop();
  }
}

MovieFader(){
  Movie[] movies;
  int[] timings;
  MovieFader(Movie[] ms; int[] ts){
    movies = ms;
    timings = ts;
  }
  
}