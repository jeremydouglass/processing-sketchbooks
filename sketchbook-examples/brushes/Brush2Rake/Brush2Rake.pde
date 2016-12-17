void draw() {
  if (mousePressed == true) {
    for(int i=0;i<20;i=i+2){
      line(mouseX+i, mouseY, pmouseX+i, pmouseY);
    }
  }
}