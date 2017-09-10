/**
 * MouseScrolling2
 * 2017-09-06 Processing 3.3.5
 * Move the mouse to the edges of the screen to scroll across the background.
 * Collision detection works within the offset coordinate context.
 */
PGraphics bg;
ArrayList<Quad> qlist;
Scroller mouseScroll;

int SCROLL_SPEED = 5;
int SCREEN_MARGIN = 40;
int QUAD_COUNT = 200;

void setup() {
  size(200, 200);
  // create background image buffer
  bg = createGraphics(400, 400);
  // create scroller
  mouseScroll = new Scroller(0, bg.width, 0, bg.height, SCREEN_MARGIN, SCROLL_SPEED);
  drawGrid(bg, SCREEN_MARGIN);

  // create random quads
  qlist = new ArrayList<Quad>();
  for (int i=0; i<QUAD_COUNT; i++) {
    float x = random(SCREEN_MARGIN, bg.width-SCREEN_MARGIN);
    float y = random(SCREEN_MARGIN, bg.height-SCREEN_MARGIN);
    float w = random(10, 30);
    float h = random(10, 30);
    qlist.add(new Quad(x, y, w, h));
  }
  
  // draw quads once only to background image buffer
  drawQuads(bg, qlist);
}

void draw() {
  background(0);
  // update scroll location
  mouseScroll.update(mouseX,mouseY);
  // set draw coordinates to scroll offset
  pushMatrix();
  translate(-mouseScroll.x, -mouseScroll.y);
  // draw background at scroll offset
  image(bg, 0, 0);
  // draw highlighted quad(s) at coordinates aligned to background
  for (Quad q : qlist) {
    if (q.over(mouseScroll.x + mouseX, mouseScroll.y + mouseY)) {
      fill(255, 0, 0);
      rect(q.x, q.y, q.w, q.h);
      fill(255);
    }
  }
  popMatrix();
}

/**
 * Creates a scrolling offset (x,y) in relation to
 * a bounding box that is larger than the screen.
 * If the input (e.g. mouse) is within the margin
 * at the edges of the screen, the offset scrolls at speed.
 */
class Scroller {
  float x;
  float y;
  float minx, miny;
  float maxx, maxy;
  float margin;
  float speed;
  Scroller(float minx, float maxx, float miny, float maxy, float margin, float speed) {
    this.minx = minx;
    this.maxx = maxx - width;
    this.miny = miny;
    this.maxy = maxy - height;
    this.margin = margin;
    this.speed = speed;
  }  
  void update(float mx, float my) {
    if (mx <= margin) {
      x = x - speed;
      x = constrain(x, minx, maxx);
    }
    else if (mx >= width - margin) {
      x = x + speed;
      x = constrain(x, minx, maxx);
    }
    if (my <= margin) {
      y = y - speed;
      y = constrain(y, miny, maxy);
    }
    else if (my >= height - margin) {
      y = y + speed;
      y = constrain(y, miny, maxy);
    }
  }
}

/**
 * a basic rectangle with mouseover collision detection
 */
class Quad {
  float x, y, w, h;
  Quad (float x_, float y_, float w_, float h_) {
    x=x_;
    y=y_;
    w=w_;
    h=h_;
  }
  boolean over(float mx, float my) {
    if (mx > x && mx < x+w) {
      if (my > y && my < y+h) {
        return true;
      }
    }
    return false;
  }
}

/**
 * draw a background grid on a PGraphics
 */
void drawGrid(PGraphics pg, int margin) {
  int m=margin;
  pg.beginDraw();
  pg.pushStyle();
  pg.noFill();
  pg.stroke(128);
  pg.rect(m, m, pg.width-2*m, pg.height-2*m);
  for (int i=m; i<pg.width-m; i+=m) {
    pg.line(m, i, bg.width-m, i);
  }
  for (int i=m; i<bg.height-m; i+=m) {
    pg.line(i, m, i, pg.height-m);
  }
  pg.popStyle();
  pg.endDraw();
}

/**
 * draw a list of quads on a PGraphics
 */
void drawQuads(PGraphics pg, ArrayList<Quad> ql) {
  pg.beginDraw();
  pg.pushStyle();
  pg.fill(128);
  pg.stroke(255);
  for (int i=0; i<ql.size(); i++) {
    Quad q = ql.get(i);
    pg.rect(q.x-mouseScroll.x, q.y-mouseScroll.y, q.w, q.h);
  }
  pg.popStyle();
  pg.endDraw();
}