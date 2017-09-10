
/**
 * For a list of points in path order,
 * check each line segment for crossing the y axis
 * below 0,0. Negative (anti-clockwise) crossings
 * increase winding count by one, while
 * positive (clockwise) crossings decrease it.
 * If winding count is negative correct by +1
 * to account for the negative <1 winding.
 *
 * Currently only works if points[0] is on the lower vertical line y=0, x<0.
 */
int crossWinding(PVector[] points){
  int windingNumber = 0;
  for(int i=1; i<points.length; i++){
    if(points[i].y > 0){
      if(points[i-1].x * points[i].x < 0){
        if(points[i].x < points[i-1].x){
          windingNumber = windingNumber + 1;
          println("+1", points[i-1], points[i]);
        } else {
          windingNumber = windingNumber - 1;
          println("-1", points[i-1], points[i]);
        }
      }
    }
  }
  //// extend initial re-crossing as zero winding
  if((windingNumber > 0)&&(points[1].x > 0)){ windingNumber = windingNumber - 1; }
  if((windingNumber < 0)&&(points[1].x < 0)){ windingNumber = windingNumber + 1; }
  println("windingNumber", windingNumber);
  return windingNumber;
}


/** incomplete */
int[] crossWindList(PVector[] points){
  int[] windSegs = new int[points.length];
  int windingNumber = 0;
  int windUp = 0;
  int windDown = 0;
  //// extend initial re-crossing as zero winding
  if(points[1].x > 0){
    windUp = - 1;
  } else {
    windDown = -1;
  }
  for(int i=1; i<points.length; i++){
    if(points[i].y > 0){
      if(points[i-1].x * points[i].x < 0){
        if(points[i].x < points[i-1].x){
          windingNumber = windingNumber + 1;
          println("+1", points[i-1], points[i]);
        } else {
          windingNumber = windingNumber - 1;
          println("-1", points[i-1], points[i]);
        }
      }
    }
    windSegs[i]=windingNumber;
  }
  println("windingNumber", windingNumber);
  return new int[]{1,2,3};
  // return windingNumber;
}


void drawCrossings(PVector[] points){
  for(int i=1; i<points.length; i++){
    // draw line specially if line segment is crossing or point is on the crossing line
    if(points[i].y > 0){
      if(points[i-1].x * points[i].x < 0){
        if(points[i].x < points[i-1].x){
          pushStyle();
            stroke(0,0,255);
            strokeWeight(3);
            fill(0,0,255);
            line(points[i-1].x, points[i-1].y, points[i].x, points[i].y);
          popStyle();
          // text("x", (points[i].x+points[i-1].x)/2, (points[i].y+points[i-1].y)/2);
        } else {
          pushStyle();
            stroke(255,0,0);
            strokeWeight(3);
            fill(255,0,0);
            line(points[i-1].x, points[i-1].y, points[i].x, points[i].y);
          popStyle();
        }
      }
    }
  }
}

/** buggy **/
void drawAngleWinding(PVector[] points){
  IntDict crossings = new IntDict();
  float windingAngle = 0.0;
  float diff = 0.0;
  int windingCount = 0;
  for(int i=1; i<points.length-1; i++){
    diff = PVector.angleBetween(points[i],points[i+1]);
    if(points[i].dot(points[i+1].y, -points[i+1].x, 0) < 0){
      windingAngle = windingAngle - diff;
    } else {
      windingAngle = windingAngle + diff;
    }
    //// round partial winds in towards zero
    if(windingAngle > 0){
      windingCount = int(floor(windingAngle/TWO_PI));
    } else {
      windingCount = int(ceil(windingAngle/TWO_PI));
    }
    if(!crossings.hasKey(str(windingCount))){
      crossings.set(str(windingCount), i);
    }
  }
  for(int crossIndex : crossings.valueArray()){
    pushStyle();
    strokeWeight(2);
    stroke(0,255,0);
    fill(255,255,255,64);
    ellipse(points[crossIndex].x, points[crossIndex].y, 20, 20);
    ellipse(points[crossIndex-1].x, points[crossIndex-1].y, 20, 20);
    popStyle();
  }
}


void drawCrossWinding(PVector[] points){
  IntDict crossings = new IntDict();
  int windingNumber = 0;
  for(int i=1; i<points.length; i++){
    if(points[i].y > 0){
      if(points[i-1].x * points[i].x < 0){
        if(points[i].x < points[i-1].x){
          windingNumber = windingNumber + 1;
          println("+1", points[i-1], points[i]);
        } else {
          windingNumber = windingNumber - 1;
          println("-1", points[i-1], points[i]);
        }
        if(!crossings.hasKey(str(windingNumber))){
          crossings.set(str(windingNumber), i);
        }
      }
    }
  }
  for(int crossIndex : crossings.valueArray()){
    pushStyle();
    strokeWeight(4);
    stroke(0,255,0);
    fill(255,255,255,64);
    line(points[crossIndex-1].x, points[crossIndex-1].y, points[crossIndex].x, points[crossIndex].y);
    popStyle();
  }
}

void drawWindColor(PVector[] points){
  color W_4 = color(255,0,0,255);
  color W_3 = color(255,0,0,192);
  color W_2 = color(255,0,0,126);
  color W_1 = color(255,0,0,64);
  color W0 = color(0);
  color W1 = color(0,255,64);
  color W2 = color(0,255,126);
  color W3 = color(0,255,192);
  color W4 = color(0,255,255);
  IntDict crossings = new IntDict();
  int windingNumber = 0;
  for(int i=1; i<points.length; i++){
    if(points[i].y > 0){
      if(points[i-1].x * points[i].x < 0){
        if(points[i].x < points[i-1].x){
          windingNumber = windingNumber + 1;
          println("+1", points[i-1], points[i]);
        } else {
          windingNumber = windingNumber - 1;
          println("-1", points[i-1], points[i]);
        }
        if(!crossings.hasKey(str(windingNumber))){
          crossings.set(str(windingNumber), i);
        }
      }
    }
  }
  for(int crossIndex : crossings.valueArray()){
    pushStyle();
    strokeWeight(4);
    stroke(0,255,0);
    fill(255,255,255,64);
    line(points[crossIndex-1].x, points[crossIndex-1].y, points[crossIndex].x, points[crossIndex].y);
    popStyle();
  }
}