// ScrollingStripTest
// forum.processing.org/two/discussion/23134/moving-images-from-an-array-across-the-screen#latest
// 2016-06-19
 
String thumbs[] = new String[6]; 
float x; 
float y;
float thumbSpacing;
float thumbStripLength;
float thumbSpeed;
 
void setup() { 
  for (int i = 0; i < thumbs.length; i++) { 
    thumbs[i] = i + " ";
  }
  y=0;
  x=10;
  thumbSpacing = height/4;
  // only show 4 out of 6 full objects
  // on the screen at a any given time --
  // objects will disappear/reappear only while fully off-screen.
  thumbStripLength = thumbSpacing*thumbs.length;
  // how long the strip of all objects is.
  // 6 objects are 6/4ths of the screen
  thumbSpeed = 1;
}
 
void draw() { 
  background(0); 
  y = y + thumbSpeed;
  for (int i = 0; i < thumbs.length; i++) { 
    text( thumbs[i], x,        (y + i * thumbSpacing) % thumbStripLength ); // scroll down
    text( thumbs[i], x + 20, - (y + i * thumbSpacing) % thumbStripLength + height ); // scroll up
    // objects could be text, shapes, images, whatever.
    ellipse(x + 40, (y + i * thumbSpacing) % thumbStripLength, 10, 10);
    rect(x + 60,  - (y + i * thumbSpacing) % thumbStripLength + height, 10, 10);
  }
}