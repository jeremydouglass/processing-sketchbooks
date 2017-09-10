PImage img;
color noir;
PVector[] Noirs;
ArrayList<Integer> tabEdgesX = new ArrayList <Integer> ();
ArrayList<Integer> tabEdgesY = new ArrayList <Integer> ();
int nbre = 0;
int pointrouge = 0;
boolean aller = true;
boolean monte = true;
float varY=0f;
float valeurXmin;
float valeurXmax;
float valeurYmin;
float valeurYmax;
int poi = 0;
float initValx;
float initValy;
 
 
 
void setup(){
 
  size(800,600);
  background(255,255,255);
  img = loadImage("cal.png");
 
  //This image is from the .gif, a screen shot that i have imported in photoshop to smooth it && get rid of the pink area which does not matter here
 
  //but if you want to get it more simply you have to use some indi font 'Devanagary' for instance
  //because this "shape"is a char....
 
  // As the screen shot was made randomly the image is black, white and gray
  // firstly i make it only black (as at the end of the .gif
 
  noir = color(0,0,0);
  Noirs = new PVector[img.width*img.height];
  for(int i = 0; i<img.width-1;i++){
 for(int j =0; j<img.height-1;j++){
color coul = img.get(i,j);
if( coul != noir && coul != color(255,255,255)){
 //coul=noir;
 img.set(i,j, noir);
 PVector pv = new PVector(i,j);
 
 Noirs[nbre] = pv;
 tabEdgesX.add(int(pv.x));
 tabEdgesY.add(int(pv.y));
 nbre++;
 
 
     }else if(coul == noir){
        PVector pn = new PVector(i,j);
       Noirs[nbre] = pn;
 tabEdgesX.add(int(pn.x));
 tabEdgesY.add(int(pn.y));
     }
}
 
//  at this point i have all black pixels in an array and x or y values in 2 others
}
 
pointrouge = nbre;
// now to boost up the process i get the max && min values for edges
// because the white pixels do not matter
 
int[] da = new int[tabEdgesX.size()];
for(int n = 0; n<da.length; n++){
 da[n] = tabEdgesX.get(n); 
}
 
valeurXmin = min(da);
valeurXmax = max(da);
initValx = valeurXmin;
 
int[] dY = new int[tabEdgesY.size()];
for(int n = 0; n<dY.length; n++){
 dY[n] = tabEdgesX.get(n); 
}
valeurYmin = min(dY);
valeurYmax = max(dY);
initValy = valeurYmin;
 
image(img,200,200);
 
//noLoop();// here uncommenting you can see the result
}
 
void draw(){
 
 //FIRST SOLUTION (with PVectors) too slow and not the same as the .gif
 
 //UP/DOWN
 
  if(aller){
 
 
    PVector p= new PVector();
 
   p.x = Noirs[poi].x;
    p.y = Noirs[poi].y;
    color rouge = color(255,0,0);
 
   img.set(int(p.x),int(p.y),rouge) ;
  }
 image(img,200,200);
 
    if(poi<nbre-1){
 
  poi++;
  }else{
 
    poi=0;
    aller = false;
 
  }
 
 
  if(!aller){
 
    //DOWN UP
 
     int i = pointrouge-1;
    PVector p= new PVector();
   p.x = Noirs[i].x;
   //println(p.x);
   p.y = Noirs[i].y;
   color bleu = color(0,0,255);
   img.set(int(p.x),int(p.y),bleu) ;
 
 
  //}
   image(img,200,200);
 
    if(pointrouge>1){
  pointrouge--;
 
 
}else{
 
   pointrouge = nbre;
   poi=0;
 
   aller = true;
  }
}
//SECOND SOLUTION USING EDGES to SPEED UP the PROCESS and line 
//for getting the .gif effect
// of course if you want you can change (or add) values for colors and varY
//of course also you can comment the first solution and get only the second one on screen!!
 
  PImage temp = img.get((int)(valeurXmin) ,(int)(varY),(int)(valeurXmax),2);
 
  temp.loadPixels();
  for(int k=0; k<temp.height*temp.width;k++){
 
      if(temp.pixels[k] != color(255,255,255)){
        if(varY <100 ){
          if(!monte){
      temp.pixels[k] = color(255,0,0);
          }else{
            temp.pixels[k] = color(0,0,0);
          }
        }else{
          if(monte){
          temp.pixels[k] = color(0,0,0);
        }else{
         temp.pixels[k] = color(255,0,0);
        }
      }
 
  }
  }
  temp.updatePixels();
   image(temp,500,varY+200);
 
   line(200+valeurXmin,200+varY,200+valeurXmax,200+varY);
 
   if(initValx< valeurXmax){ 
   initValx ++;
   }else{
    initValx = valeurXmin; 
   }
 
  if(varY < valeurYmax && monte){
  varY++;
  }else{
    if(varY>valeurYmin){
   varY--; 
   monte= false;
    }else{
      monte = true;
    }
  }
    };