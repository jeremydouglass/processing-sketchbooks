/**
 *
 */
PGraphics bg;
ArrayList<Quad> qlist;
PVector mouseScroll;
int SCROLL_SPEED = 5;
int SCREEN_MARGIN = 40;

void setup() {
  size(200, 200);
  mouseScroll = new PVector(0, 0);

  bg = createGraphics(400, 400);
  drawGrid();

  qlist = new ArrayList<Quad>();
  for (int i=0; i<50; i++) {
    float x = random(SCREEN_MARGIN, bg.width-SCREEN_MARGIN);
    float y = random(SCREEN_MARGIN, bg.height-SCREEN_MARGIN);
    float w = random(10, 30);
    float h = random(10, 30);
    qlist.add(new Quad(x, y, w, h));
  }
  drawbg();
}

void draw() {
  updateMouseScroll();
  background(0);
  image(bg, -mouseScroll.x, -mouseScroll.y);
  for (Quad q : qlist) {
    if (q.over(mouseScroll.x + mouseX, mouseScroll.y + mouseY)) {
      fill(255, 0, 0);
      rect(q.x - mouseScroll.x, q.y - mouseScroll.y, q.w, q.h);
      fill(255);
    }
  }
}

/**
 *
 */
void updateMouseScroll() {
  if (mouseX <= SCREEN_MARGIN) {
    mouseScroll.x = constrain(mouseScroll.x - SCROLL_SPEED, 0, bg.width-width);
  }
  if (mouseX >= width - SCREEN_MARGIN) {
    mouseScroll.x = constrain(mouseScroll.x + SCROLL_SPEED, 0, bg.width-width);
  }
  if (mouseY <= SCREEN_MARGIN) {
    mouseScroll.y = constrain(mouseScroll.y - SCROLL_SPEED, 0, bg.height-height);
  }
  if (mouseY >= height - SCREEN_MARGIN) {
    mouseScroll.y = constrain(mouseScroll.y + SCROLL_SPEED, 0, bg.height-height);
  }
}

/**
 *
 */
void drawGrid() {
  bg.beginDraw();
  bg.noFill();
  bg.stroke(128);
  bg.rect(SCREEN_MARGIN, SCREEN_MARGIN, bg.width-2*SCREEN_MARGIN, bg.height-2*SCREEN_MARGIN);
  for (int i=SCREEN_MARGIN; i<bg.width-SCREEN_MARGIN; i+=SCREEN_MARGIN) {
    bg.line(SCREEN_MARGIN, i, bg.width-SCREEN_MARGIN, i);
  }
  for (int i=SCREEN_MARGIN; i<bg.height-SCREEN_MARGIN; i+=SCREEN_MARGIN) {
    bg.line(i, SCREEN_MARGIN, i, bg.height-SCREEN_MARGIN);
  }
  bg.endDraw();
}

void drawbg() {
  bg.beginDraw();
  bg.fill(255);
  for (int i=0; i<qlist.size(); i++) {
    Quad q = qlist.get(i);
    bg.rect(q.x-mouseScroll.x, q.y-mouseScroll.y, q.w, q.h);
  }
  bg.endDraw();
}

/**
 * 
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