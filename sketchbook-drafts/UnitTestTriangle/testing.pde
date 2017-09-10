import java.io.File;

void testSetup(String imgURL) {
  // remove previous results
  fileDelete(sketchPath("goal.png"));
  fileDelete(sketchPath("test.png"));
  fileDelete(sketchPath("diff.png"));
  fileDelete(sketchPath("diff_rate.txt"));
  imgGoal = loadImage(imgURL);
  goal.save("goal.png");
}

void testAnalysis(PImage pa, PImage pb) {
  PImage diff = pdiff(pa, pb);
  diff.save("diff.png");
  PVector error = perror(diff);
  println(error.x, error.y, error.x/error.y);
}

PImage pdiff(PImage pa, PImage pb) {
  PImage pc = createImage(pa.width, pa.height, RGB);
  color c1, c2;
  for (int i = 0; i < pa.pixels.length; i++) {
    c1 = pa.pixels[i];
    c2 = pb.pixels[i];
    pc.pixels[i] = color(abs(red(c1)-red(c2)), abs(green(c1)-green(c2)), abs(blue(c1)-blue(c2)));
  }
  return pc;
}

PVector perror(PImage p) {
  int result = 0;
  int white = 0;
  color c = color(255, 255, 255);
  for (int i = 0; i < p.pixels.length; i++) {
    result += red(p.pixels[i]) + green(p.pixels[i]) + blue(p.pixels[i]);
    white += (int)(red(c) + green(c) + blue(c));
  }
  return new PVector(result, white);
}

void fileDelete(String filename) {
  println(filename);
  File f = new File(filename);
  if (f.exists()) {
    f.delete();
  }
}