/** 
 * Image Corrupter
 * 
 * Swaps image bytes to further corrupt output every x seconds.
 * Press space for corruption.
 *
 * @author Jeremy Douglass
 * @since 2016-10-24
 * Processing 3.2.1
 * 
 * Original image byte corruption by Benjamin Gaulon 2004
 * -- corrupt.recyclism.com -- Feel free to use / modify / share this
 *
 * Source image from "There is No Space for Corruption in Rwanda" by Adam Jones
 * https://commons.wikimedia.org/wiki/File:There_is_No_Space_for_Corruption_in_Rwanda_-_Billboard_in_Musanze-Ruhengeri_-_Northern_Rwanda_-_02.jpg
 *
 * Discussion:
 * https:// forum.processing.org/two/discussion/comment/77002
 */

PImage img;
String sourceFile  = "./data/source.jpg";
String corruptFile = "./data/corrupt.jpg";

boolean timerOn = true; // turn timer on or off
int timerSpan = 5;      // number of seconds for timer to run
int timer;

void setup() {
  size(360, 480);
  // copy clean 'sourceFile' file to working corruptable 'corruptFile'
  saveStream(corruptFile, sourceFile);
  img = loadImage(corruptFile);
  timer = timerSpan;
}

void draw() {
  if (timerOn) { 
    corruptTimer();
  }
  image(img, 0, 0);
}

void keyPressed() {
  // press space to corrupt
  if (key==' ') {
    println("Corrupting (keys):", millis()/1000, "seconds");
    corrupt(corruptFile);
    img = loadImage(corruptFile);
    redraw();
  }
  // press backspace to reset
  if ((key==BACKSPACE)||(key==DELETE)) {
    saveStream(corruptFile, sourceFile);
    img = loadImage(corruptFile);
    redraw();
  }
}

void corruptTimer() {
  if ( millis() > (timer*1000) ) {
    println("Corrupting (time):", timer, "seconds");
    timer = timer+timerSpan;
    corrupt(corruptFile);
    img = loadImage(corruptFile);
    redraw();
  }
}

void corrupt(String corruptFile) {
  byte b[] = loadBytes(corruptFile);
  for (int j = 0; j < 1; j ++) // change 1 to any value to generate more images
  {
    byte bCopy[] = new byte[b.length];
    arrayCopy(b, bCopy);
    // load binary of file
    int scrambleStart = 10;
    // scramble start excludes 10 bytes
    int scrambleEnd = b.length;
    // scramble end
    int nbOfReplacements = int (random(1, 5));
    // number of replacements - go easy as too much will kill the file
    // swap bits
    for (int i = 0; i < nbOfReplacements; i++)
    {
      int PosA = int(random (scrambleStart, scrambleEnd));
      int PosB = int(random (scrambleStart, scrambleEnd));
      byte tmp = bCopy[PosA];
      bCopy[PosA] = bCopy[PosB];
      bCopy[PosB] = tmp;
    }
    // save the file ///
    saveBytes(corruptFile, bCopy);
  }
}