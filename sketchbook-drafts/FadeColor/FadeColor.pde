/** Press any key to fade to a new random color **/

FadeColorTimer fc;

void setup(){
  fc = new FadeColorTimer( color(0, 0, 0), color(255,0,0), 4000, 1500);
  textAlign(CENTER,CENTER);
}

void draw(){
  background(0);
  fill(fc.c());
  rect(10,10,80,80);
  fill(255);
  text(fc.text(), width/2,height/2);  
}

    void keyReleased(){
      color cr = color(random(255), random(255), random(255));
      fc.set(cr);
    }

/**
 * FadeColorTimer is a timer object that contains two colors
 * interpolated by lerpColor().
 * Instantiate with two colors, a start time, and a duration.
 * c() returns the current interpolated color value
 * set() updates the color, colors, and/or timer.
 **/

class FadeColorTimer {
  color c1, c2, c;
  int start, duration;
  FadeColorTimer(color _c1, color _c2, int _start, int _duration){
    c = _c1;
    c1 = _c1;
    c2 = _c2;
    start = _start;
    duration = _duration;
  }
  void set(color _c2){
    set(c, _c2, millis(), duration);
  }
  void set(color _c2, int _duration){
    set(c, _c2, millis(), _duration);
  }
  void set(color _c2, int _start, int _duration){
    set(c, _c2, _start, _duration);
  }
  void set(color _c1, color _c2, int _start, int _duration){
    c1 = _c1;
    c2 = _c2;
    start = _start;
    duration = _duration;
  }
  void update(){
    println(c1, c2, map(millis(), start, start+duration, 0.0, 1.0));
    c = lerpColor( c1, c2, map(millis(), start, start+duration, 0.0, 1.0));
  }
  color c(){
    this.update();
    return c;
  }
  String text(){
    String[] str = {
      str((int)red(fc.c)),
      str((int)green(fc.c)),
      str((int)blue(fc.c))
    };
    return join(str, ',');
  }
}