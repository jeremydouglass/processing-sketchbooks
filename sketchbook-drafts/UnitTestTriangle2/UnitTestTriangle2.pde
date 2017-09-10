UTest test;

void setup() {
  test = new UTest("https://processing.org/reference/images/triangle_.png");
  test.setup();
}
void draw() {
  test.begin();
  triangle(30, 75, 58, 20, 86, 75);
  test.end();
}

class UTest {
  PImage imgTest, imgGoal, imgDiff;
  String goal = "goal.png";
  String test = "test.png";
  String diff = "diff.png";
  String imgURL;
  UTest(String url) {
    imgURL = url;
    this.setup();
  }
  void setup() {
    // remove previous results
    fileDelete(sketchPath("test.png"));
    fileDelete(sketchPath("diff.png"));
    fileDelete(sketchPath("diff_rate.txt"));
    // cache goal
    File f = new File("goal.png");
    if (!f.exists()) {
      imgGoal = loadImage(imgURL);
      imgGoal.save("goal.png");
    } else {
      imgGoal = loadImage("goal.png");
    }    
  }
  void begin() {
  }
  void end() {
    // save test
    saveFrame(test);
    imgTest = loadImage(test);
    // save diff
    PImage pdiff = diff(imgGoal, imgTest);
    pdiff.save("diff.png");
    // save diffStats
    diffStats(pdiff);
    noLoop();
  }
  PImage diff(PImage pa, PImage pb) {
    PImage pc = createImage(pa.width, pa.height, RGB);
    color c1, c2;
    for (int i = 0; i < pa.pixels.length; i++) {
      c1 = pa.pixels[i];
      c2 = pb.pixels[i];
      pc.pixels[i] = color(abs(red(c1)-red(c2)), abs(green(c1)-green(c2)), abs(blue(c1)-blue(c2)));
    }
    return pc;
  }
  void diffStats(PImage p) {
    int diff = 0;
    int maxdiff = 0;
    color c = color(255, 255, 255);
    for (int i = 0; i < p.pixels.length; i++) {
      diff += red(p.pixels[i]) + green(p.pixels[i]) + blue(p.pixels[i]);
      maxdiff += (int)(red(c) + green(c) + blue(c));
    }
    String ratiodiff = String.format("%.2f", diff/(float)maxdiff);
    saveStrings("diff.txt", split("" + ratiodiff + ' ' + diff + "/" + maxdiff + ' ', ' '));
    println("error: ", ratiodiff, diff + " / " + maxdiff);
  }
  void fileDelete(String filename) {
    File f = new File(filename);
    if (f.exists()) {
      f.delete();
    }
  }
}