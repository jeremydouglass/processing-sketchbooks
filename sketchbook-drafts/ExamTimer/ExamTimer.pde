int startTime;
int duration;
int timeLeft;


void setup(){
  size(400,120);
  fill(0);
  textSize(60);
  textAlign(CENTER,CENTER);
  startTime = millis();
  duration = 121 * 60 * 1000; // mins * secs * millis
  println(duration);
  stroke(0,0,0);
  frameRate(1);
}
void draw(){
  timeLeft = duration - (millis() - startTime);
  
  background(bgcolor(timeLeft));
  textSize(60);
  text(timeLeft/60000 + " min left", width/2,height/2);
  textSize(8);
  text(timeLeft/1000, width-20,height-20);

}

color bgcolor(int time){
  if(time/60000<1){
    return color(255,0,0);
  }
  if(time/60000<2){
    return color(255,128,0);
  }
  if(time/60000<3){
    return color(255,255,0);
  }
  return color(255,255,255);
}