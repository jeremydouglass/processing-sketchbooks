/**
 * Scope demo
 * 
 * 2016-09-11 Jeremy Douglass Processing 3.2.1
 */

int globalVal;  //// global scope, works anywhere

void setup() {
  //// functions that set global variables--affecting the whole sketch
  size(200, 200);
  frameRate(30);
  textSize(50);
  textAlign(CENTER, CENTER);

  //// assign initial values to your globals in setup
  //// if they depend on other settings like size(), set these after!
  globalVal = width;         

  //// local scope declaration - exists in setup(), not in draw()
  int onlyInSetup = 10;
  println("Only in setup:", onlyInSetup);
}

//// global scope again, works anywhere
//// -- almost always move this up the top to avoid confusion!!
String anywhere; 

void draw() {
  //// global scope, works anywhere
  if(mousePressed && globalVal>0) { globalVal = globalVal - 2; }
  else if(globalVal < width) { globalVal = width; }
  background(globalVal);
  text(globalVal, mouseX, mouseY);

  //// local scope - exists in draw() only -- recreated every time draw runs!
  String localString = "Local String";
}