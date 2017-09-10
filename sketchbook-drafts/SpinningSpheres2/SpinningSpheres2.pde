// https://forum.processing.org/two/discussion/21945/3d-tsp-traveling-salesperson-problem
// Jeremy Douglass 2017-04-18 Processing 3.2.3

ArrayList<PVector> points;
void setup(){
  size(300,300,P3D);
  fill(0);
  points = new ArrayList<PVector>();
  frameRate(10);
}
void draw(){
  background(255);
  translate(width/2,width/2,0);
  rotateY(radians(frameCount*.25));
  points.add(new PVector(random(-width/4,width/4),random(-width/4,width/4),random(-width/4,width/4)));
  for(int i=0; i<points.size(); i++){
    pushMatrix();
    translate(points.get(i).x, points.get(i).y, points.get(i).z);
    sphere(5);
    popMatrix();
  }
  // saveFrame("####.png");
}