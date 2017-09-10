PMatrix pm3d;
float[] matArray;

void setup() {
  size(400, 400, P3D);
  pm3d = new PMatrix3D();
  matArray = new float[16];
  // update PMatrix with default 3D camera and copy results to float array
  // matArray = matUpdate(pm3d);
  noFill();
  textAlign(CENTER, CENTER);
  noLoop();
}

void draw() {
  box(20);
  text("1", 10, 10, 0);
  println("default matrix");
  printMatrix();
  pm3d = getMatrix();
  pm3d.get(matArray);
  println(pm3d);
  println(matArray);

  translate(width/2, height/2);
  box(20);
  text("2", 10, 10, 0);
  println("translate -width/2,-height/2,-100 matrix");
  printMatrix();
  pm3d = getMatrix();
  pm3d.get(matArray);
  println(pm3d);
  println(matArray);

  rotateX(radians(45));
  rotateY(radians(45));
  box(40);
  text("3", 10, 10, 0);
  println("rotateX 45 rotateY 45 matrix");
  printMatrix();
  pm3d = getMatrix();
  pm3d.get(matArray);
  println(pm3d);
  println(matArray);

  resetMatrix();
  box(20);
  text("4", 10, 10, 0);

  println("reset matrix");
  printMatrix();
  pm3d = getMatrix();
  pm3d.get(matArray);
  println(pm3d);
  println(matArray);
}