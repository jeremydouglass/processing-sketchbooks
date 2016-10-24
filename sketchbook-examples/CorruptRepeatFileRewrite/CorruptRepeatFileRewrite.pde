/** 
 * Corrupt Repeat File Rewrite
 * 2016-10 Processing 3.2.1
 * https:// forum.processing.org/two/discussion/comment/77002
 * Press space to corrupt.
 * 
 * Test file from http:// nickyepstein.com/wp-content/uploads/2011/05/IMG_0274-950x150.jpg
 * Coded initially in 2004 Benjamin Gaulon -- corrupt.recyclism.com
 * Feel free to use / modify / Share this
 **/

PImage img;
String sourceFile = "./data/source.jpg";
String corruptFile = "./data/corrupt.jpg";

boolean timerOn = true; // turn timer on or off
int timerSpan = 5;      // number of seconds for timer to run
int timer;

void setup() {
  size(950, 150);
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
    // Number of Replacements - Go easy with this as too much will just kill the file
    // Swap bits
    for (int i = 0; i < nbOfReplacements; i++)
    {
      int PosA = int(random (scrambleStart, scrambleEnd));
      int PosB = int(random (scrambleStart, scrambleEnd));
      byte tmp = bCopy[PosA];
      bCopy[PosA] = bCopy[PosB];
      bCopy[PosB] = tmp;
    }
    // Save the file ///
    saveBytes(corruptFile, bCopy);
  }
}