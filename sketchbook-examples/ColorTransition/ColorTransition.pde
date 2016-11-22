/** 
 * Color Transition
 *
 * Use a countdown to control linear interpolation between
 * old and current colors; load progressive results with background().
 * Press any key to fade in new background. 
 *
 * @author Jeremy Douglass
 * @since 2016-09-21
 * Processing 3.2.1
 *
 * forum.processing.org/two/discussion/18224/how-do-i-lerpcolor-between-two-background-color-values
 */

color[] colorArray  = {color(0,0,0),color(255, 192, 0),color(200, 0, 0),color(126, 255, 0)};
int currentColor;
int lastColor;

float lerpRange;
float lerpCount;

void setup(){
    size(640,480);
    smooth();
    noStroke();
    currentColor = 0;
    lerpCount = 0;
    lerpRange = 20; //// edit the range to change how many frames a fade takes
    frameRate(10);  //// set frameRate to control seconds - 20 lerp / 10fps = 2 second fades
}

void draw(){
    if(lerpCount > 0){
      //// mix colors
      background(lerpColor(colorArray[currentColor], colorArray[lastColor], (1/(lerpRange/lerpCount))));
      lerpCount = lerpCount - 1; //// count down steps to new color
    } else {
      background(colorArray[currentColor]);
    }

    //// display the last and current colors -- this is for inspection, not needed for lerp
    fill(colorArray[lastColor]);
    rect(0, 0, width*.1, height*.1);
    fill(128,128,128);
    text("LAST", width*.025, height*.05);
    fill(colorArray[currentColor]);
    rect(width*.1, 0, width*.1, height*.1);
}

void keyReleased(){
    lastColor = currentColor;
    while (lastColor == currentColor)
    currentColor = (int) random(colorArray.length);
    lerpCount = lerpRange; //// begin countdown
}