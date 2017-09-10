// https://forum.processing.org/two/discussion/21157/my-demo-pde-runs-way-way-slower-when-visitng-the-uploaded-version-why#latest
String mode;
int startTime;
 
void setup(){
  mode = "drawPhoto";
  blendMode(ADD);
  textAlign(CENTER,CENTER);
  background(0);
}
 
void draw(){
  if(mode=="drawPhoto"){ drawPhoto(); }
  if(mode=="fade"){ fade(); }
}
 
void drawPhoto(){
  background(0);
  fill(255);
  text(millis()-startTime, width/2, height/2);
  if(millis()>startTime+4000){
    // switch mode and reset timer
    mode="fade";
    startTime=millis();
  }
}
 
void fade(){
  fill(255,3);
  rect(0,0,width,height);
  if(millis()>startTime+2000){
    // switch mode and reset timer
    mode="drawPhoto";
    startTime=millis();
    background(0);
  }
}