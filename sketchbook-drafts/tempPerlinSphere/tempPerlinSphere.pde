import peasy.*; 
PeasyCam cam;
 
Table csvTable;
 
final float tstep=0.002;
float ttime;
float xx, yy, zz;
 
FloatList fx=new FloatList();
FloatList fy=new FloatList();
FloatList fz=new FloatList();
FloatList ftheta=new FloatList();
FloatList fphi=new FloatList();
int n=50;
int cidx=0;
 
void setup() 
{
  csvTable = loadTable("cubePositions.txt", "csv"); // load csv file of positions to table 
  // ------------------------------------- CAM SETTINGS ----------------------------------------------------
  size(800, 600, P3D);
  cam = new PeasyCam(this, 0, 0, 0, 280);  
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(width);
  cam.setYawRotationMode();  // cam will only rotate around the rigs(lookAt point) Y axis UNLESS shift is held
 
  for (int i=0; i<n; i++) {
    fx.set(i, 0);
    fy.set(i, 0);
    fz.set(i, 0);
    ftheta.set(i, 0);
    fphi.set(i, 0);
  }
}
 
 
 
 
void draw() 
{
  background(0);
  lights(); 
 
  for (int i = 0; i <156; i++) {
    float X= csvTable.getFloat(i, 0)-128;
    float Y = (csvTable.getFloat(i, 1)-128)* -1;
    float Z = (csvTable.getFloat(i, 2)-128)* -1;
    float posZstate;
    if (Z > 0) {
      posZstate = -Z;
    } else {
      posZstate = Z;
    }
    float angleX = atan2(Y, posZstate);
    float angleY = atan2(-Z, X);
    pushMatrix();
    translate(X, Y, Z);
    float theta=atan2(Y, X);  //Restricte -180,180
    float phi=acos(Z/sqrt(X*X+Y*Y+Z*Z)); //Restricte 0,180
    rotateZ(theta);
    rotateY(phi);
    stroke(3);
    fill(255);
    box(4, 4, 60);
 
    popMatrix();
  }
 
  noStroke();
  //fill(255, 0, 0);
  //sphere(50);
 
  drawNoisyBallspherical();
  //drawNoisyBallxyz();
}
 
void drawNoisyBallspherical() {
 
  zz=noise(ttime+=tstep);
  zz=map(zz, 0, 1, -width/4, width/4);
  zz=width/4;   //ACTIVATE this line to cause particles to move only on a surface defined by a fix radius=width/4
 
  float theta=map(noise(ttime+=tstep), 0, 1, -PI, PI); //Restricte -180,180
  float phi=map(noise(ttime+100), 0, 1, 0, PI);   //Restricte 0,180
 
  for (int i=0; i<n; i++) {
    pushStyle();
    fill(250, 250, 0 );
    pushMatrix();
    rotateZ(ftheta.get(i));
    rotateY(fphi.get(i));
    translate(0, 0, fz.get(i));
    sphere(5);
    popMatrix();
    popStyle();
  }
 
  fz.set(cidx, zz);
  ftheta.set(cidx, theta);
  fphi.set(cidx, phi);
  cidx=(cidx+1)%n;
}
 
 
void drawNoisyBallxyz() {
 
  xx=noise(ttime+=tstep);
  xx=map(xx, 0, 1, -width/4, width/4);
  yy=noise(ttime+100);
  yy=map(yy, 0, 1, -width/4, width/4);
  zz=noise(ttime+1013);
  zz=map(zz, 0, 1, -width/4, width/4);
 
  for (int i=0; i<n; i++) {
    pushStyle();
    fill(250, 250, 0 );
    pushMatrix();
    translate(fx.get(i), fy.get(i), fz.get(i));
    sphere(5);
    popMatrix();
    popStyle();
  }
 
  fx.set(cidx, xx);
  fy.set(cidx, yy);
  fz.set(cidx, zz);
 
  cidx=(cidx+1)%n;
}