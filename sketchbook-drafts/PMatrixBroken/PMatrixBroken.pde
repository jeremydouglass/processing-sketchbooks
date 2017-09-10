PMatrix pm3d;
float[] matArray;

void setup() {
  size(400, 400, P3D);
  pm3d = new PMatrix3D();
  // update PMatrix with default 3D camera and copy results to float array
  matArray = matUpdate(pm3d);
  fill(255);
}
float[] matUpdate(PMatrix pm) {
  float[] ma = new float[16];
  // copy current matrix
  pm = getMatrix();
  // write matrix to float array
  pm.get(ma);
  println(ma);
  return ma;
}

void draw() {
  background(0);
  resetMatrix();
  applyMatrix(pm3d);
  // applyMatrix(
  //   matArray[0], matArray[1], matArray[2], matArray[3],
  //   matArray[4], matArray[5], matArray[6], matArray[7],
  //   matArray[8], matArray[9], matArray[10],matArray[11],
  //   matArray[12],matArray[13],matArray[14],matArray[15]
  // );
  if (keyPressed) {
    if (keyCode==LEFT) {
      rotate(-45);
    }
    if (keyCode==RIGHT) {
      rotate(45);
    }
    if (keyCode==UP) {
      translate(20, 0);
    }
    if (keyCode==DOWN) {
      translate(-20, 0);
    }
    matArray = matUpdate(pm3d);
    // pm3d = getMatrix();

    if (key=='p') {
      printMatrix();
      // pm3d = getMatrix();
      // println(matArray);
      // pm3d.get(pm3darray); // copies!
    }
  }
  rect(width/2, height/2, -50, -50);
}