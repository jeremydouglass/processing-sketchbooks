/**
 * Sentence Colored Text
 * color each sentence in a list differently
 * while performing correct text wrapping.
 * @since 2016-12-01
 * @author Jeremy Douglass
 * Processing 3.2.3
 * https://forum.processing.org/two/discussion/comment/80886/
 */

String[] sentences = {
  "Lorem ipsum dolor sit amet.", 
  "Consectetur adipiscing elit.", 
  "Sed do eiusmod tempor incididunt, ut labore et dolore magna aliqua.", 
  "Ut enim ad minim veniam.",
  "Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  "Excepteur sint occaecat cupidatat non proident.",
  "Sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
  "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
  "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem."
};

float TEXTSIZE = 16;
float MARGIN = 40;

void setup() {
  size(400, 400);
  frameRate(1);
}

void draw() {
  background(0);
  sentenceBox(subset(sentences, 0, second()%sentences.length), MARGIN, MARGIN, width-MARGIN-3, height-2*MARGIN, TEXTSIZE);
}

void sentenceBox(String[] sentences, float x, float y, float w, float h, float tsize){
  String[] words;
  float spacing = tsize/5;
  float leading = tsize/4;
  float xoffset = x;
  float yoffset = y + tsize + leading;
  // bounding box
  pushStyle();
    fill(0); stroke(32);
    rect(x,y,w,h);
  popStyle();
  // look through sentences, random color each
  for (String sentence : sentences) {
    pushStyle();
    textSize(tsize);
    colorMode(HSB, 360, 1, 1);
    fill( random(360), 1, 1);
    words = split(sentence, " ");
    // loop through words, move to next line if it won't fit
    for (String word : words) {
      if (xoffset + textWidth(word) > w) {
        xoffset = x;
        yoffset = yoffset + tsize + leading;
        // stopping printing lines beyond the bottom of the box
        if (yoffset > h + tsize + leading ){
          break;
        }
      }
      text(word, xoffset, yoffset);
      xoffset = xoffset + spacing + textWidth(word);
      println(word);
    }
    popStyle();
  }
}