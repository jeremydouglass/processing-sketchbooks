PImage art;
PGraphics pg;

int rad = 10;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 1.0;  // Speed of the shape
float yspeed = 1.0;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


void setup() 
{
  size(362, 262);
  art = loadImage("art1.png");
  pg = createGraphics(362, 262);
  pg.beginDraw();
  pg.stroke(255,0,0);
  pg.strokeWeight(2);
  pg.endDraw();
  
  noStroke();
  frameRate(60);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(102);
  image(art, 0, 0);

  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw the shape
  ellipse(xpos, ypos, rad, rad);

  if (checkpx((int)xpos, (int)ypos, art)) {
    pg.beginDraw();
    pg.point(xpos, ypos);
    pg.endDraw();
  }

  image(pg, 0, 0);
}

boolean checkpx(int x, int y, PImage img) {
  color c = img.get(int(x), int(y));
  float val = (red(c)+green(c)+blue(c))/3.0;
  if (val > 230) {
    return true;
  } else {
    return false;
  }
}