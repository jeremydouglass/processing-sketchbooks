PGraphics imgTest;
PImage imgGoal, imgDiff;

PGraphics testRun(PGraphics pg){
  pg = createGraphics(100, 100);
  pg.beginDraw();
  pg.background(204);
  pg.triangle(30, 75, 58, 20, 86, 75);
  pg.save("test.png");
  pg.endDraw();
  return pg;
}

void setup() {
  size(300, 100);
  // delete previous test files
  testSetup("https://processing.org/reference/images/triangle_.png");
}

void draw() {
  testRun(imgTest);
  image(imgTest, 0, 0);
  image(imgGoal, 100, 0);
  image(imgDiff, 200, 0);
  testAnalysis(imgGoal, imgTest);
  noLoop();
}