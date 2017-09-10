/**
 * PalimpSet -- based on Sentence Colored Text
 * color each word in a text differently based on data
 * while performing correct text wrapping.
 * @ since 2017-05-03
 * @ author Jeremy Douglass
 * Processing 3.3
 */
 
String[] sentences = {
  "Though the Author’s empire is still very powerful (recent criticism has often merely consolidated it), it is evident that for a long time now certain writers have attempted to topple it. In France, Mallarme was doubtless the first to see and foresee in its full extent the necessity of substituting language itself for the man who hitherto was supposed to own it; for Mallarme, as for us, it is language which speaks, not the author: to write is to reach, through a preexisting impersonality — never to be confused with the castrating objectivity of the realistic novelist — that point where language alone acts, “performs,” and not “oneself”: Mallarme’s entire poetics consists in suppressing the author for the sake of the writing (which is, as we shall see, to restore the status of the reader.) Valery, encumbered with a psychology of the Self, greatly edulcorated Mallarme’s theory, but, turning in a preference for classicism to the lessons of rhetoric, he unceasingly questioned and mocked the Author, emphasized the linguistic and almost “chance” nature of his activity, and throughout his prose works championed the essentially verbal condition of literature, in the face of which any recourse to the writer’s inferiority seemed to him pure superstition. It is clear that Proust himself, despite the apparent psychological character of what is called his analyses, undertook the responsibility of inexorably blurring, by an extreme subtilization, the relation of the writer and his characters: by making the narrator not the person who has seen or felt, nor even the person who writes, but the person who will write (the young man of the novel — but, in fact, how old is he, and who is he? — wants to write but cannot, and the novel ends when at last the writing becomes possible), Proust has given modern writing its epic: by a radical reversal, instead of putting his life into his novel, as we say so often, he makes his very life into a work for which his own book was in a sense the model, so that it is quite obvious to us that it is not Charlus who imitates Montesquiou, but that Montesquiou in his anecdotal, historical reality is merely a secondary fragment, derived from Charlus. Surrealism lastly — to remain on the level of this prehistory of modernity — surrealism doubtless could not accord language a sovereign place, since language is a system and since what the movement sought was, romantically, a direct subversion of all codes — an illusory subversion, moreover, for a code cannot be destroyed, it can only be “played with”; but by abruptly violating expected meanings (this was the famous surrealist “jolt”), by entrusting to the hand the responsibility of writing as fast as possible what the head itself ignores (this was automatic writing), by accepting the principle and the experience of a collective writing, surrealism helped secularize the image of the Author. Finally, outside of literature itself (actually, these distinctions are being superseded), linguistics has just furnished the destruction of the Author with a precious analytic instrument by showing that utterance in its entirety is a void process, which functions perfectly without requiring to be filled by the person of the interlocutors: linguistically, the author is never anything more than the man who writes, just as I is no more than the man who says I: language knows a “subject,” not a “person,” end this subject, void outside of the very utterance which defines it, suffices to make language “work,” that is, to exhaust it.", 
};
String[] sentenceSet;
float TEXTSIZE = 16;
float MARGIN = 40;
 
void setup() {
  size(850, 1100);
  frameRate(1);
}
 
void draw() {
  background(0);
  // select a number of sentences to display based on time
  sentenceSet = subset(sentences, 0, 1);
  // draw colored sentences in a box
  sentenceBox(sentenceSet, MARGIN, MARGIN, width-MARGIN-3, height-2*MARGIN, TEXTSIZE);
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
    // colorMode(HSB, 360, 1, 1);
    // fill( random(360), 1, 1);
    words = split(sentence, " ");
    // loop through words, move to next line if a word won't fit
    for (String word : words) {
      if (xoffset + textWidth(word) > w) {
        xoffset = x;
        yoffset = yoffset + tsize + leading;
        // stopping printing lines beyond the bottom of the box
        if (yoffset > h + tsize + leading ){
          break;
        }
      }
      fill( random(255), 255);
      text(word, xoffset, yoffset);
      xoffset = xoffset + spacing + textWidth(word);
      println(word);
    }
    popStyle();
  }
}