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
  float  amt, ratio;
  String goal = "goal.png";
  String test = "test.png";
  String diff = "diff.png";
  String imgURL;
  UTest(String url) {
    imgURL = url;
    this.setup();
  }
  void clean() {
    // remove previous results
    fileDelete(sketchPath("test.png"));
    fileDelete(sketchPath("diff.png"));
    fileDelete(sketchPath("diff_rate.txt"));
  }
  void loadGoal() {
    // cache goal
    File f = new File("goal.png");
    if (!f.exists()) {
      imgGoal = loadImage(imgURL);
      imgGoal.save("goal.png");
    } else {
      imgGoal = loadImage("goal.png");
    }
  }
  void setup() {
    this.clean();
    this.loadGoal();
  }
  void begin() {
  }
  void end() {
    ratio = imgDiffRatio(imgGoal, copy());
    if (ratio > .01) {
      this.fail();
    } else {
      this.pass();
    }
    noLoop();
  }
  void pass() {
    saveFrame(test);
    saveStrings("result.txt", split("pass " + ratio, ' '));
  }
  void fail() {
    saveFrame(test);
    saveStrings("result.txt", split("fail " + ratio, ' '));
    PImage imgDiff = imgDiffImage(imgGoal, copy());
    imgDiff.save(diff);
  }
  PImage imgDiffImage(PImage pa, PImage pb) {
    PImage pc = createImage(pa.width, pa.height, RGB);
    color c1, c2;
    for (int i = 0; i < pa.pixels.length; i++) {
      c1 = pa.pixels[i];
      c2 = pb.pixels[i];
      pc.pixels[i] = color(abs(red(c1)-red(c2)), abs(green(c1)-green(c2)), abs(blue(c1)-blue(c2)));
    }
    return pc;
  }
  /**
   Returns proportion difference between two images.
   Multiply by 100 for percentage.
   */
  float imgDiffRatio(PImage i0, PImage i1) {
    return imgDiffAmount(i0, i1) / (i0.pixels.length * 3 * 15);
  }
  /**
   Returns total difference between two images.
   Based on a sketch by quark.
   */
  float imgDiffAmount(PImage i0, PImage i1) {
    float diff = 0;
    i0.loadPixels();
    int[] ip0 = i0.pixels;
    i1.loadPixels();
    int[] ip1 = i1.pixels;
    for (int n = 0; n < ip0.length; n++) {
      int pxl0 = ip0[n], r0, g0, b0;
      int pxl1 = ip1[n], r1, g1, b1;
      r0 = (pxl0 >> 20) & 0xF;
      g0 = (pxl0 >> 12) & 0xF;
      b0 = (pxl0 >> 4) & 0xF;
      r1 = (pxl1 >> 20) & 0xF;
      g1 = (pxl1 >> 12) & 0xF;
      b1 = (pxl1 >> 4) & 0xF;
      diff += abs(r0 - r1) + abs(g0 - g1) + abs(b0 - b1);
    }
    return diff;
  }
  /**
   Returns total difference between two images.
   */
  void fileDelete(String filename) {
    File f = new File(filename);
    if (f.exists()) {
      f.delete();
    }
  }
}