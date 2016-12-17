// https://forum.processing.org/two/discussion/18894/averaging-a-few-seconds-of-a-video-feed-pixel#latest

color videoColor;
float videoFlickerRate;
color smoothColor;
float smoothRate;
color[] colorArray;
color smoothColorArray;

void setup() {
  videoColor = color(128);
  smoothColor = color(128);
  colorArray = new int[60];
  videoFlickerRate = 1.0/32; // 1 is 100% flicker
  smoothRate = 1.0/32;
}

void draw() {
  // get center pixel (for a real video)
  // videoColor = get(width/2, height/2)

  // simulate video pixel with changing flicker rates
  // videoFlickerRate = 1.0/(second()%10+1);
  videoColor = lerpColor(videoColor, color(random(255), random(255), random(255)), videoFlickerRate);

  // draw video flicker, unsmoothed
  fill(videoColor);
  rect(0, 0, width/2, height/2);

  // smooth color
  smoothColor = lerpColor(smoothColor, videoColor, smoothRate);

  // draw smoothed color
  fill(smoothColor);
  rect(width/2,0,width,height/2);
  
  // smooth color 2
  colorArray[frameCount%60] = videoColor;

  // average colors in array
  // smoothColorArray = ;
  
  // draw smoothed color
  fill(smoothColor);
  rect(width/2,0,width,height/2);
}

class clerper {
}

class clerperQueue {
}