/**
 * VideoFaders2 -- FaderLists
 * 2017-04-30 Jeremy Douglass - Processing 3.3
 * - 640x360 short video file transit.mov from "Loop" Processing example sketch
 **/

import processing.video.*;
FaderList fs;
boolean loopFaders;

void setup() {
  size(640, 360);
  textAlign(CENTER, CENTER);
  // Load movies
  Movie m1 = new Movie(this, "transit.mov");
  Movie m2 = new Movie(this, "transit.mov");
  Movie m3 = new Movie(this, "transit.mov");

  // Create display array for faders
  fs = new FaderList();
  fs.list.add(new Fader(m1, 2, 1, 4));
  fs.list.add(new Fader(m2, 9, 10, 10.25, 12.25));
  fs.list.add(new Fader(m3, 2, 2));
  fs.reset();
  fs.chain();
  fs.loop();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  background(0);
  fs.display();
  text("Press space to start / restart", width/2, height/2);
  text("Press enter to switch looping from: " + loopFaders, width/2, height/2 + 16);
}

void keyPressed() {
  if (key==' ') {
    fs.reset();
    fs.play();
  }
  if (key=='1') {
    fs.reset();
    fs.play(1);
  }
  if (key==RETURN || key==ENTER) {
    loopFaders=!loopFaders;
    if (loopFaders) { 
      fs.loop();
    } else { 
      fs.noLoop();
    }
  }
}

class FaderList {
  ArrayList<Fader> list;
  FaderList() {
    list = new ArrayList<Fader>();
  }
  void chain() {
    // link faders 0 -> 1 -> 2 -> 3 ...
    if (list.size()>1) {
      for (int i=1; i<list.size(); i++) {
        list.get(i-1).nextAdd(list.get(i));
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
    // link last fader to first
    list.get(list.size()-1).nextAdd(list.get(0));
  }
  void noLoop() {
    // unlink last fader from first
    list.get(list.size()-1).nextRemove();
  }
  void play() {
    this.play(0);
  }
  void play(int i) {
    list.get(i).play();
  }
  void reset() { // reset all faders
    for (Fader f : list) {
      f.queue();
    }
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