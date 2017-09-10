// arrow key game control test
// Jeremy Douglass -- 2017-03-16 -- p5.js 1.0.3

var lcolor, rcolor, ucolor, dcolor;

function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(128);

  lcolor = (keyIsDown(LEFT_ARROW)  ? color(255,  64, 255) : color(128));
  rcolor = (keyIsDown(RIGHT_ARROW) ? color(255,  64,  64) : color(128));
  ucolor = (keyIsDown(UP_ARROW)    ? color( 64,  255, 64) : color(128));
  dcolor = (keyIsDown(DOWN_ARROW)  ? color( 64,  64, 255) : color(128));  

  lkey(0,height/3, width/3, height/3, 20);
  rkey(2*(width/3), height/3, width/3, height/3, 20);
  ukey(width/3, 0, width/3, height/3, 20);
  dkey(width/3, 2*(height/3), width/3, height/3, 20); 
}

function lkey(x,y,w,h,margin){
  translate(x,y);
  keyplate(w,h);
  stroke(lcolor);
  strokeWeight(10);
  rect(margin, margin, w - 2*margin, h - 2*margin);
  translate(-x,-y);
}
function rkey(x,y,w,h,margin){
  translate(x,y);
  keyplate(w,h);
  stroke(rcolor);
  strokeWeight(10);
  ellipse(w/2, h/2, w - 1.5*margin, h - 1.5*margin);
  translate(-x,-y);
}
function ukey(x,y,w,h,margin){
  translate(x,y);
  keyplate(w,h);
  stroke(ucolor);
  strokeWeight(10);
  triangle(w/2, margin, w - margin, h - margin, margin, h - margin);
  translate(-x,-y);
}
function dkey(x,y,w,h,margin){
  translate(x,y);
  keyplate(w,h);
  stroke(dcolor);
  strokeWeight(10);
  line(margin,margin, w - margin, h - margin);
  line(w - margin, margin, margin, h - margin);
  translate(-x,-y);
}
function keyplate(w,h){
  fill(64);
  strokeWeight(0);
  rect(0, 0, w, h)
}
