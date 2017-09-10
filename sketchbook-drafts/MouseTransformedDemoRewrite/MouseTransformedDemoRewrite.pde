import mouse.transformed2D.*;
MouseTransformed mouse = new MouseTransformed(this);
Shape test;

void setup() {
  size(500, 500);
  rectMode(CORNER);
  test = new Shape(0, 0, 100, 100, mouse);
}

void draw() {
  background(255);
  //translate both animation & mouse matrix by specified offsets
  test.display("unshifted");
  mouse.translate(width/2, height/2);
  test.display("shifted");
  fill(0);
}

class Shape {
  int x, y, sizeX, sizeY;
  MouseTransformed m;

  Shape(int x, int y, int sizeX, int sizeY, MouseTransformed m) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.m = m;
  }
  void display(String str) {
    pushStyle();
    if (m.mouseX() > x && m.mouseX() < x+sizeX && m.mouseY() > y && m.mouseY() < y+sizeY) {
      fill(255);
    } else {
      fill(0);
    }
    stroke(255, 0, 0);
    rect(x, y, sizeX, sizeY);
    fill(255);
    text(str, 20, -10);
    popStyle();
  }
}