PMatrix pm3d;
float[] matArray;

void setup() {
  size(400, 400, P3D);
  pm3d = new PMatrix3D();
  noFill();
  textAlign(CENTER, CENTER);
  noLoop();
}

void draw() {
  box(20);
  text("1", 10, 10, 0);
  println("default matrix");
  printMatrix();
  // 01.0000  00.0000  00.0000 -50.0000
  // 00.0000  01.0000  00.0000 -50.0000
  // 00.0000  00.0000  01.0000 -86.6025
  // 00.0000  00.0000  00.0000  01.0000
  pm = getMatrix();
  pm3d.get(pmarray);
  println(pmarray);

  translate(width/2, height/2);
  box(20);
  text("2", 10, 10, 0);
  println("translate -width/2,-height/2,-100 matrix");
  printMatrix();
  // 01.0000  00.0000  00.0000 -10.0000
  // 00.0000  01.0000  00.0000 -10.0000
  // 00.0000  00.0000  01.0000 -10.0000
  // 00.0000  00.0000  00.0000  01.0000

  rotateX(radians(45));
  rotateY(radians(45));
  box(40);
  text("3", 10, 10, 0);
  println("rotateX 45 rotateY 45 matrix");
  printMatrix();
  // 00.5253  00.0000  00.8509 -10.0000
  // 00.7240  00.5253 -00.4470 -10.0000
  //-00.4470  00.8509  00.2760 -10.0000
  // 00.0000  00.0000  00.0000  01.0000

  resetMatrix();
  box(20);
  text("4", 10, 10, 0);

  println("reset matrix");
  printMatrix();
  // 1.0000  0.0000  0.0000  0.0000
  // 0.0000  1.0000  0.0000  0.0000
  // 0.0000  0.0000  1.0000  0.0000
  // 0.0000  0.0000  0.0000  1.0000
}