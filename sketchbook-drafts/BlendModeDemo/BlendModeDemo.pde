// blendMode demo -- Jeremy Douglass 2017-03-03 -- Processing 3.2.3
color c1,c2,c3;
int[] modes = new int[]{
  BLEND, ADD, SUBTRACT, DARKEST, LIGHTEST,
  DIFFERENCE, EXCLUSION, MULTIPLY, SCREEN,
  OVERLAY, HARD_LIGHT, SOFT_LIGHT, DODGE, BURN
};
String[] modeNames = new String[]{
  "BLEND", "ADD", "SUBTRACT", "DARKEST", "LIGHTEST",
  "DIFFERENCE", "EXCLUSION", "MULTIPLY", "SCREEN",
  "OVERLAY", "HARD_LIGHT", "SOFT_LIGHT", "DODGE", "BURN"
};

void setup(){
  size(200,200);
  c1 = color(192,192,0);
  c2 = color(0,192,192);
  textAlign(CENTER,CENTER);
  frameRate(1);
}
void draw(){
  background(255);
  c3 = blendColor(c1, c2, modes[frameCount%modes.length]);
  fill(c1);
  rect(10,10,30,30);
  fill(c2);
  rect(40,10,30,30);
  fill(c3);
  rect(60,60,80,80);  
  fill(0);
  text(modeNames[frameCount%modeNames.length], width/2, height-20);
}