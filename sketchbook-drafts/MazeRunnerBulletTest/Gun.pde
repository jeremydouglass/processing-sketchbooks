class Gun {
  Player player;
  float blastDist;
  float blastSize;
  float beamLength;
  float beamSize;
  float gunDist;
  float gunLength;
  float gunOffsetX;
  float gunOffsetY;
  float gunSize;
  float reticuleSize;
  PVector target;
  
  Gun(Player player_){
    player = player_;
    blastDist = 15;
    blastSize = 4;
    beamLength = 200;
    beamSize = 0.05;
    gunDist = 1;
    gunLength = 1;
    gunOffsetX = 0.25;
    gunOffsetY = 0.15;
    gunSize = 0.1;
    reticuleSize = 0.05;
    target = new PVector();
  }
  void display(){
    pushMatrix();
      //player view
      translate(player.position.x,player.position.y, player.position.z);
      // rotateY(-player.pan);
      // rotateZ(player.tilt);
      rotateY(-player.pan);
      rotateZ(player.tilt);

      //gun
      pushMatrix();
        translate(gunLength/2 + gunDist,gunOffsetY,gunOffsetX);
        box(gunLength,gunSize,gunSize);
        pushMatrix();
          translate(-gunLength/2,gunSize,0);
          box(gunSize,gunSize,gunSize/2);
        popMatrix();

        //firing
        if(mousePressed){
          // add collision detection to find target distance
          target = new PVector( modelX(blastDist, 0, 0), modelY(blastDist, 0, 0), modelZ(blastDist, 0, 0) );
          translate((beamLength)/2,0,0);
          pushStyle();
            noStroke();
            fill(255,0,0,8+millis()%247);
            box((gunLength+beamLength),beamSize,beamSize);
            println(target);
          popStyle();
        }
      popMatrix();
      
      // reticule
      pushMatrix();
        translate(1.1,0,0);
        rotateY(HALF_PI);
        pushStyle();
          fill(128,0);
          rect(-reticuleSize,-reticuleSize,2*reticuleSize,2*reticuleSize);
        popStyle();
      popMatrix();

    popMatrix();

    // blast
    if(mousePressed){
      pushMatrix();
        translate(target.x,target.y,target.z);
        pushStyle();
          noStroke();
          fill(255,0,0,64);
          sphere(blastSize);
        popStyle();
      popMatrix();
    }
  }

}