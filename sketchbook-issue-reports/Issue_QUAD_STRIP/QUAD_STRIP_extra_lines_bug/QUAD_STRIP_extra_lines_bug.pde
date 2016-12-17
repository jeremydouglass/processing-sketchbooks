    /*
     * QUAD_STRIP extra lines bug
     * 2016-09-07 Jeremy Douglass
     * https://forum.processing.org/two/discussion/17876/0/
     * 
     * When child QUAD_STRIPs are added to a PShape, even closed shapes,
     * sets extra lines are rendered from child as follows
     * 
     * -  Three extra lines the same color as background
     *    are drawn from first child vertex 1,3,5...n-3 to origin (0,0,0)
     * -  Three extra lines are drawn from second child vertex 1,3,5...n-3
     *    to first child vertex n-3. These lines are gradient from
     *    child2 color to child1 color, and from child2 stroke to 0.
     * -  Three extra lines are drawn from third child to second child...
     * -  Three extra lines are drawn from fourth child to third child... etc.
     *
     * The extra lines are always rendered, but are most visible when
     * each child shape is separate and nothing is overdrawing (e.g. noFill).
     */
    
    PShape group;
    PShape red;
    PShape green;
    PShape blue;
    
    int translatex = 0;
    int translatey = 0;
        
    color RED = color(255,0,0,255);
    color GREEN = color(0,255,0,255);
    color BLUE = color(0,0,255,255);
    
    void setup() {
      size(400, 400, P3D); 
      group = createShape(GROUP);
      red   = makeChild(RED,80);
      green = makeChild(GREEN,40);
      blue  = makeChild(BLUE,0);
      group.addChild(red);
      group.addChild(green);
      group.addChild(blue);
    }

    void draw(){
      background(0);
      camera(100, 50, 200, 0, 0, 0, 0, 1, 0);
      text("0,0,0",0,0,0);
      shape(group,-translatex, -translatey);
      stroke(255);
    }
    
    PShape makeChild(color stroke_, float offset_){
      PShape shape_ = createShape();
      shape_.beginShape(QUAD_STRIP);
      shape_.stroke(stroke_);
      shape_.strokeWeight(5);
      shape_.noFill();
      //// example quad data copied from https://processing.org/reference/beginShape_.html
      shape_.vertex(30, 10, offset_); /// v1 - line from here to previous child v5
      shape_.vertex(30, 75, offset_); 
      shape_.vertex(50, 20, offset_); /// v3 - line from here to previous child v5
      shape_.vertex(50, 75, offset_);
      shape_.vertex(65, 10, offset_); /// v5 - line from here to previous child v5
      shape_.vertex(65, 75, offset_); 
      shape_.vertex(85, 20, offset_);
      shape_.vertex(85, 75, offset_);
      shape_.endShape(CLOSE);
      return shape_;
    }
    
    /* *** INTERFACE *** */
    
    void mouseDragged(){
      // translate(60 * mouseX/width, 60 * mouseY/height);
      translatex = 30 - 60 * mouseX/width;
      translatey = 30 - 60 * mouseY/height;
      updateShapes();
    }
    void updateShapes(){
      group.removeChild(2);
      group.removeChild(1);
      group.removeChild(0);
      group.addChild( makeChild(RED,80 + translatex) );
      group.addChild( makeChild(GREEN,40) );
      group.addChild( makeChild(BLUE,0 - translatex) );
    }