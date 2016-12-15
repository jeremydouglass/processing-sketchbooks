/**
 * Mouse Cursors
 *
 * Demonstrates the cursor options by rotating through each,
 * including loading a custom image as the cursor.
 * Click in the sketch in order to see the effect --
 * the sketch window must have focus, or the cursor will not change.
 *
 * @author  Jeremy Douglass
 * @since   2016-09-03
 * Processing 3.1.2
 */
 
PVector t;
void setup(){
  size(300,150);
  fill(64);
  textAlign(CENTER,CENTER);
  t = new PVector(width/2,height/2);
}

void draw() 
{
  background(192);
  int mode = (millis()/1500)%8;
  textSize(10);
  text("click once in window to see cursor changes", t.x, 2*t.y-10);
  textSize(32);
  switch(mode){
    case 0: cursor(loadImage("cursor.png")); text("cursor(image)", t.x, t.y); break;
    case 1: cursor(ARROW); text("cursor(ARROW)", t.x, t.y); break;
    case 2: cursor(CROSS); text("cursor(CROSS)", t.x, t.y); break;
    case 3: cursor(HAND);  text("cursor(HAND)" , t.x, t.y); break; //// same as MOVE on Mac
    case 4: cursor(TEXT);  text("cursor(TEXT)" , t.x, t.y); break;
    case 5: cursor(MOVE);  text("cursor(MOVE)" , t.x, t.y); break; //// same as HAND on Mac
    case 6: cursor(WAIT);  text("cursor(WAIT)" , t.x, t.y); break;
    case 7: noCursor();    text("noCursor()"   , t.x, t.y); break;
    default: break;
  }
}