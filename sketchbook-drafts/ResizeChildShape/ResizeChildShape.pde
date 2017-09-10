/**
 * Resize Child Shape
 * 2016-10-23 Processing 3.2.1
 * Using pushMatrix and popMatrix to isolate shape translations and scaling while manipulating child shapes.
 * Press +/- to scale the shape up and down.
 * https:// forum.processing.org/two/discussion/18464
 **/
PShape shape;
PShape ps;
int noOfChilds;
float sscale;

/***************************************************************************/
void setup() 
{
  size(400, 400);
  shape = loadShape("https://processing.org/examples/bot1.svg");
  noOfChilds = shape.getChildCount();
  print(noOfChilds);
  shapeMode(CENTER);
  sscale = 1.0;
} 
/***************************************************************************/
void draw() 
{
  background(100);
  shape.enableStyle();
  stroke(255);
  //shape(shape, mouseX, mouseY, 600, 600);
  //
  shape.disableStyle();
  pushMatrix();
  translate(mouseX, mouseY);
  scale(sscale);
  translate(-shape.width/2,-shape.height/2);
  for (int i = 0; i < noOfChilds; i++)
  {
    ps = shape.getChild(i);
    fill(random(255), random(255), random(255));
    shape(ps, 0, 0);
  }
  popMatrix();
}
void keyPressed(){
  if(key=='='){ sscale = sscale * 1.1; }
  if(key=='+'){ sscale = sscale * 1.1; }
  if(key=='-'){ sscale = sscale * 0.9; }
}
/***************************************************************************/