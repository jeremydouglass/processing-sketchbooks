    /**
     * Simple Gauge
     * 2016-11-01 Jeremy Douglass Processing 3.2.1
     **/
    void setup(){
      size(200,200);
      fill(0,0,0,0);
      strokeWeight(20);
      stroke(255,56,0);
    }
    void draw(){
      background(0);
      arc(200/2, 200/2, 200*0.7, 200*0.7, 0, (millis()%4000.0)/4000*TWO_PI,OPEN);
    }