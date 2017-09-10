// depth testing

// https://forum.processing.org/two/discussion/23598/finding-intersection-between-two-polygons
// Finding intersection between two polygons

PGraphics layers;
PGraphics layersCache;
PGraphics screen;
int layerSteps;
int layerVal;
int layerMaxThresh;
boolean cacheUpdate;
boolean resetUpdate;

void setup() {
  size(400, 400);

  // 5 layers, 25 brightness per layer, max 112
  layerSteps = 5;
  layerVal = 25;
  layerMaxThresh = int(layerVal * (layerSteps - 0.5));

  screen = createGraphics(width, height);
  layersCache = createGraphics(width/10, height/10);
  layers = createGraphics(width/10, height/10);

  layers.beginDraw();
  layers.blendMode(ADD);
  layers.fill(layerVal);
  layers.noStroke();
  layers.endDraw();

  screen.beginDraw();
  screen.fill(layerVal, 0, 0);
  screen.blendMode(ADD);
  screen.stroke(255);
  screen.endDraw();
}

void draw() {
  if (cacheUpdate) {
    cacheUpdate();
  }
  if (resetUpdate) {
    resetUpdate();
  }
  background(0);
  image(layers, 0, 0);
}

void mouseClicked() {
  drawRect(mouseX, mouseY);
}
void keyPressed() {
  // clear background
  layers.beginDraw();
  layers.background(0);
  layers.endDraw();
  // update screen as cleared
  screen.beginDraw();
  screen.set(0, 0, layers);
  screen.endDraw();
  cacheUpdate = true;
}

void drawRect(float x, float y) {
  layers.beginDraw();
  layers.rect(x/10, y/10, 100/10, 100/10);
  layers.endDraw();
  for (int i=0; i<layers.pixels.length; i=i+4) {
    if ((layers.pixels[i] >> 16 & 0xFF) > (layerMaxThresh)) {
      println(millis() + " Error: 5 layers deep");
      // reset bad draw to cache
      resetUpdate = true;
      return;
    }
  }
  // update screen
  screen.beginDraw();
  screen.rect(x, y, 100, 100);
  screen.endDraw();
  cacheUpdate = true;
}

void cacheUpdate() {
  // update cache
  layersCache.beginDraw();
  layersCache.set(0, 0, layers);
  layersCache.endDraw();
  cacheUpdate = false;
}

void resetUpdate() {
  layers.beginDraw();
  layers.set(0, 0, layersCache);
  layers.endDraw();
}