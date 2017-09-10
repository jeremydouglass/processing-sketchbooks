/**
 * VideoFaders
 * 2017-04-30 Jeremy Douglass - Processing 3.3
 * - 640x360 short video file transit.mov from "Loop" Processing example sketch
 **/

import processing.video.*;
ArrayList<Fader> fs;
//boolean loopFaders;

void setup() {
  size(640, 360);
  textAlign(CENTER, CENTER);
  // Load movies
  Movie m1 = new Movie(this, "transit.mov");
  Movie m2 = new Movie(this, "transit.mov");
  Movie m3 = new Movie(this, "transit.mov");

  // Define fader on each movie
  Fader f1 = new Fader(m1, 2, 1, 4); // give lengths (2s in, 1s out, 4s long)
  Fader f2 = new Fader(m2, 9, 10, 10.25, 12.25); // define timecode pairs (1s in, 2s out)
  Fader f3 = new Fader(m3, 2, 2); // give lengths (2s in, 2s out--on full movie)

  // Set next fader transitions 1 -> 2 -> 3
  f1.nextAdd(f2);
  f2.nextAdd(f3);
  //f3.nextAdd(f1); // looping

  // Create display array for faders
  fs = new ArrayList<Fader>();
  fs.add(f1);
  fs.add(f2);
  fs.add(f3);
  // fs.get(fs.size()-1).nextAdd(fs.get(0)); // list looping on
  // fs.get(fs.size()-1).nextRemot();        // list looping off
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  background(0);
  // display movie(s) with current fader levels
  for (Fader f : fs) {
    f.display();
    f.nextCheck();
  }
  text("Press space to start / restart", width/2, height/2);
  //text("Press enter to switch looping from: " + loopFaders,  width/2, height/2 + 16);
}

void keyPressed() {
  if (key==' ') {
    // reset all faders
    for (Fader f : fs) {
      f.queue();
    }
    // play first fader
    fs.get(0).play();
  }
  //if (key==RETURN || key==ENTER){
  //  // add-remove a looping transition from last fader to first
  //  loopFaders=!loopFaders;
  //  if(loopFaders){
  //    fs.get(fs.size()-1).nextAdd(fs.get(0));
  //  } else {
  //    fs.get(fs.size()-1).nextRemove();
  //  }
  //}
}

class FaderList {
  ArrayList<Fader> list;
  FaderList() {
  }
  void chain() {
    if (list.size()>1) {
      for (int i=1; i<list.size(); i++) {
        list.get(i).nextAdd(list.get(i-1));
      }
    }
  }
  void display() {
    for (Fader f : list) {
      f.display();
      f.nextCheck();
    }
  }
  void loop() {
    list.get(list.size()-1).nextAdd(list.get(0));
  }
  void noLoop() {
    list.get(list.size()-1).nextRemove();
  }
  void play() { // play first fader
    list.get(0).play();
  }
  void reset() { // reset all faders
    for (Fader f : list) {
      f.queue();
    }
    this.play();
  }
  void stop() {
    for (Fader f : list) {
      f.movie.stop();
    }
  }
}

class Fader {
  Movie movie;
  Fader nextFader;
  float introBegin, introEnd;
  float outroBegin, outroEnd;
  float duration;
  Fader(Movie movie_, float introLength_, float outroLength_, float duration_) {
    this(movie_, 0, introLength_, duration_ - outroLength_, duration_);
  }
  Fader(Movie movie_, float introBegin_, float introEnd_, float outroBegin_, float outroEnd_) {
    movie = movie_;
    duration = outroEnd_ - introBegin_;
    introBegin = introBegin_;
    introEnd = introEnd_;
    outroBegin = outroBegin_;
    outroEnd = outroEnd_;
    this.queue();
  }
  Fader(Movie movie_, float introLength_, float outroLength_) {
    movie = movie_;
    duration = this.findDuration();
    introBegin = 0;
    introEnd = introLength_;
    outroEnd = duration;
    outroBegin = duration - outroLength_;
    this.queue();
  } 
  void display() {
    // check for reset
    if (movie.time()>=outroEnd) {
      this.queue();
    }
    if (movie.time()>introBegin) {
      pushStyle();
      tint(255, 255*this.level());
      movie.volume(this.level());
      image(movie, 0, 0, movie.width, movie.height);
      // display current movie object and timing info for debugging
      text(movie.filename + ": " + this.movie + ": " + nfc(movie.time(), 2), 200, height-movie.time()*4 - 20);
      popStyle();
    }
  }
  float findDuration() {
    float dur;
    if (movie.time()>=0) {
      dur = movie.duration();
    } else {
      movie.play(); // duration "must be called after play() in order to report accurately."
      dur = movie.duration();
      movie.pause();
    }
    return dur;
  }  
  boolean isIntro() { 
    return isIntro(movie.time());
  }
  boolean isIntro(float time) {
    return (time > introBegin && time < introEnd);
  }
  boolean isFull() { 
    return isFull(movie.time());
  }
  boolean isFull(float time) {
    return (time > introEnd && time < outroBegin);
  }
  boolean isOutro() { 
    return isOutro(movie.time());
  }
  boolean isOutro(float time) {
    return (time > outroBegin && time < outroEnd);
  }
  float level() { 
    return level(movie.time());
  }
  float level(float time) {
    if (isIntro(time)) {
      return map(time, introBegin, introEnd, 0, 1);
    }
    if (isOutro(time)) {
      return map(time, outroBegin, outroEnd, 1, 0);
    }
    if (isFull(time)) {
      return 1;
    } else return 0;
  }
  void nextAdd(Fader f) {
    nextFader = f;
  }
  boolean nextCheck() {
    return nextCheck(nextFader);
  }
  boolean nextCheck(Fader f) {
    if (f!=null) {
      if (this.isOutro() && f.movie.time()<=f.introBegin) {
        // println("play()", f.movie, f.movie.time());
        f.movie.play();
        return true;
      }
    }
    return false;
  }
  void nextRemove() {
    nextFader = null;
  }
  void play() { 
    movie.play();
  }
  void queue() {
    movie.pause();
    movie.jump(introBegin);
  }
}