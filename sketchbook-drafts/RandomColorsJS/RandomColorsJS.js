// random colors
// ...changes select colors in a list at random
// ...reveals one color (others blacked out) every 10 frames
// Jeremy Douglass -- 2017-03-17 -- p5.js 1.0.3
// https://forum.processing.org/two/discussion/21458/how-to-make-colours-change-for-a-random-period-of-time#latest

var colors;

function setup() {
  createCanvas(200, 200);
  frameRate(2);
  colors = randomColors(4);
  noStroke()
}

function draw() {
  if(frameCount%10==0){
    blackOutColorUpdate(colors);
  } else if((frameCount-1)%10==0){
    colors = randomColors(4);
  } else {
    randomColorUpdates(colors);
  }
  fill(colors[0]);
  rect(0,0,width/2,height/2);
  fill(colors[1]);
  rect(width/2,0,width,height/2);
  fill(colors[2]);
  rect(0,height/2,width/2,height);
  fill(colors[3]);
  rect(width/2,height/2,width,height);
}

function randomColors(count){
  var myArray = new Array();
  for(var i = 0; i < count; i++){
    append(myArray, randomColor());
  }
  return myArray;
}

function randomColor(){
  return color(random(255), random(255), random(255));
}

function randomColorUpdates(myArray){
  for (var i = 0; i < myArray.length; i++) {
    if(random() < 0.5){ // 50% chance of changing
      myArray[i] = randomColor();
    }
  }
}

function blackOutColorUpdate(myArray){
  var choice = floor(random(4));
  for (var i = 0; i < myArray.length; i++) {
    if(i != choice){
      myArray[i] = color(0,0,0);
    }
  }
}