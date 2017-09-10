// randomLine
// Processing 3.2.3 -- Jeremy Douglass -- 2017-05-25
// 
// 1. add plain text to "lines.txt"
// 2. run sketch in Processing
// 3. press space key to generate new random lines on screen and in console
// 4. press 's' key to save latest list of lines to "output.txt"
// 5. press ESC to exit

String DATAFILE = "lines.txt";
String OUTPUTFILE = "output.txt";
String DELIMITERS = ",.!?;:/-—()“”\"";
int MINLENGTH = 10;
int MARGIN = 10;

StringList inLines;
StringList outLines;
String screenLines;

void setup() {
  size(400, 400);
  String[] la = loadStrings(DATAFILE);
  inLines = new StringList();
  outLines = new StringList();
  for (int i = 0; i < la.length; i++) {
      String[] substrings = splitTokens(la[i], DELIMITERS);
      for (String s : substrings) {
        if (s.length() > MINLENGTH) {
          inLines.append(s);
        }
      }
  }
  screenLines = "";
  println(DATAFILE + ": " + inLines.size() + " lines" + "\n");
}

void draw() {
  background(0);
  text(screenLines, MARGIN, MARGIN, width-MARGIN, height-MARGIN);
}

void keyReleased() {
  if (key==' ') {
    int r = (int)random(0, inLines.size());
    String il = inLines.get(r);
    println(il + '\n');
    outLines.append(il);
    inLines.remove(r);
    if (outLines.size()>0) {
      screenLines = join(trim(reverse(outLines.array())), "\n\n");
    }
  }
  if (key=='s') {
    saveStrings(OUTPUTFILE, outLines.array());
    println("\n\nSaved to: " + OUTPUTFILE);
  }
}