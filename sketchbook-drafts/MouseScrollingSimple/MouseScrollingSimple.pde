/**
 * MouseScrollingSimple
 * 2017-09-06 Processing 3.3.5
 * Move the mouse to the edges of the screen to scroll across the background.
 * Collision detection works within the offset coordinate context.
 */
PGraphics pg;
float x = 0;
float y = 0;
int margin = 30;
int speed = 5;

int[][] qarray = {
  {   21,  42, 29, 21  }, 
  {   74, 153, 29, 29  }, 
  {   87, 358, 20, 28  }, 
  {  141, 328, 20, 29  }, 
  {  102, 216, 20, 28  }, 
  {  114, 259, 26, 22  }, 
  {  184, 139, 26, 26  }, 
  {  208, 311, 25, 29  }, 
  {  269, 287, 25, 25  }, 
  {  281,  91, 24, 21  }, 
  {  292, 184, 23, 27  }, 
  {  335, 168, 23, 24  }  };

void setup() {
  size(200, 200);
  // create background image buffer
  pg = createGraphics(400, 400);
  // draw quads once only to background image buffer
  pg.beginDraw();
  pg.fill(128);
  pg.stroke(255);
  for (int i=0; i<qarray.length; i++) {
    int[] q = qarray[i];
    pg.rect(q[0]-x, q[1]-y, q[2], q[3]);
  }
  pg.endDraw();
}

void draw() {
  background(0);
  // update scroll location
  update(mouseX, mouseY);
  // set draw coordinates to scroll offset
  translate(-x, -y);
  // draw background at scroll offset
  image(pg, 0, 0);
  // draw highlighted quad(s) at coordinates aligned to background
  for (int[]q : qarray) {
    if (x + mouseX > q[0] && x + mouseX < q[0] + q[2]) {
      if (y + mouseY > q[1] && y + mouseY < q[1] + q[3]) {
        fill(255, 0, 0);
        rect(q[0], q[1], q[2], q[3]);
        fill(255);
      }
    }
  }
}

/**
 * scroll the background when mouse is near screen edge
 */
void update(float mouseX, float mouseY) {
  if (mouseX <= margin) {
    x = x - speed;
    x = constrain(x, 0, pg.width-width);
  } else if (mouseX >= width - margin) {
    x = x + speed;
    x = constrain(x, 0, pg.width-width);
  }
  if (mouseY <= margin) {
    y = y - speed;
    y = constrain(y, 0, pg.height-height);
  } else if (mouseY >= height - margin) {
    y = y + speed;
    y = constrain(y, 0, pg.height-height);
  }
}