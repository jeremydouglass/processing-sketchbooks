float[] hexagonX = new float[width];
float[] hexagonY = new float[height];
 
//scale factor to determine the size of the grid
float scaleF = 0.8;
 
void setup() {
 size(480, 640);
 colorMode(HSB, 360, 100, 100);
 background(0);
 stroke(255);
 smooth();
 noLoop();
}
 
void draw() { 
  //hexagon(width/2, height/2); <- Test Hexagon
 
  //loop for drawing an hexagon grid
  for(int i = 0; i < hexagonX.length; i ++){   
    for(int j = 0; j < hexagonY.length; j++){
      //for all the hexagons on the 'even' rows, the X-coördinate of every individual hexagon equals scaleF * (i*102)
      //for all the hexagons on the 'odd' rows, the X-coördinate of every individual hexagon equals scaleF * (51 + i * 102)
      if(j%2==0){
        hexagonX[i] = scaleF * (i * 102);
      }else if(j%2!=0){
        hexagonX[i] = scaleF * (51 + i * 102); 
      }
 
     hexagonY[j] = scaleF * (j * 28);
 
     //draws every hexagon
 
     hexagon(int(hexagonX[i]), int(hexagonY[j]));
    }    
  }  
}
 
//function to make one hexagon
void hexagon(int x, int y){
  pushMatrix();
  translate(x, y);
  scale(scaleF);
  float hue = 360 * sqrt( sq(x - width/2) + sq(y - height/2) ) / max(width/2,height/2);
  stroke(hue, 100, 100);
  line(-17, -28, 17, -28); // upper horizontal line
  line(-34, 0, -17, -28); // left upper line
  line(-34, 0, -17, 28); // left lower line
  line(-17, 28, 17, 28); //lower horizontal line
  line(17, 28, 34, 0);  // right lower line
  line(34, 0, 17, -28); //right upper line
  popMatrix();
}