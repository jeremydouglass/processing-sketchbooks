/**
 * PalimpSet -- based on Sentence Colored Text
 * color each word in a text differently based on data
 * while performing correct text wrapping.
 * @ since 2017-05-03
 * @ author Jeremy Douglass
 * Processing 3.3
 */

String[] sentences = {
  "The Death of the Author -- Barthes",
  "Page 2",
  "In his story Sarrasine, Balzac, speaking of a castrato disguised as a woman, writes this sentence: “It was Woman, with her sudden fears, her irrational whims, her instinctive fears, her unprovoked bravado, her daring and her delicious delicacy of feeling” Who is speaking in this way? Is it the story’s hero, concerned to ignore the castrato concealed beneath the woman? Is it the man Balzac, endowed by his personal experience with a philosophy of Woman? Is it the author Balzac, professing certain “literary” ideas of femininity? Is it universal wisdom? or romantic psychology? It will always be impossible to know, for the good reason that all writing is itself this special voice, consisting of several indiscernible voices, and that literature is precisely the invention of this voice, to which we cannot assign a specific origin: literature is that neuter, that composite, that oblique into which every subject escapes, the trap where all identity is lost, beginning with the very identity of the body that writes.",
  "-",
  "Probably this has always been the case: once an action is recounted, for intransitive ends, and no longer in order to act directly upon reality — that is, finally external to any function but the very exercise of the symbol — this disjunction occurs, the voice loses its origin, the author enters his own death, writing begins. Nevertheless, the feeling about this phenomenon has been variable; in primitive societies, narrative is never undertaken by a person, but by a mediator, shaman or speaker, whose “performance” may be admired (that is, his mastery of the narrative code), but not his “genius” The author is a modern figure, produced no doubt by our society insofar as, at the end of the middle ages, with English empiricism, French rationalism and the personal faith of the Reformation, it discovered the prestige of the individual, or, to put it more nobly, of the “human person” Hence it is logical that with regard to literature it should be positivism, resume and the result of capitalist ideology, which has accorded the greatest importance to the author’s “person” The author still rules in manuals of literary history, in biographies of writers, in magazine interviews, and even in the awareness of literary men, anxious to unite, by their private journals, their person and their work; the image of literature to be found in contemporary culture is tyrannically centered on the author, his person, his history, his tastes, his passions; criticism still consists, most of the time, in saying that Baudelaire’s work is the failure of the man Baudelaire, Van Gogh’s work his madness, Tchaikovsky’s his vice: the explanation of the work is always sought in the man who has produced it, as if, through the more or less transparent allegory of fiction, it was always finally the voice of one and the same person, the author, which delivered his “confidence.”",
  "Page 3",
  "Though the Author’s empire is still very powerful (recent criticism has often merely consolidated it), it is evident that for a long time now certain writers have attempted to topple it. In France, Mallarme was doubtless the first to see and foresee in its full extent the necessity of substituting language itself for the man who hitherto was supposed to own it; for Mallarme, as for us, it is language which speaks, not the author: to write is to reach, through a preexisting impersonality — never to be confused with the castrating objectivity of the realistic novelist — that point where language alone acts, “performs,” and not “oneself”: Mallarme’s entire poetics consists in suppressing the author for the sake of the writing (which is, as we shall see, to restore the status of the reader.) Valery, encumbered with a psychology of the Self, greatly edulcorated Mallarme’s theory, but, turning in a preference for classicism to the lessons of rhetoric, he unceasingly questioned and mocked the Author, emphasized the linguistic and almost “chance” nature of his activity, and throughout his prose works championed the essentially verbal condition of literature, in the face of which any recourse to the writer’s inferiority seemed to him pure superstition. It is clear that Proust himself, despite the apparent psychological character of what is called his analyses, undertook the responsibility of inexorably blurring, by an extreme subtilization, the relation of the writer and his characters: by making the narrator not the person who has seen or felt, nor even the person who writes, but the person who will write (the young man of the novel — but, in fact, how old is he, and who is he? — wants to write but cannot, and the novel ends when at last the writing becomes possible), Proust has given modern writing its epic: by a radical reversal, instead of putting his life into his novel, as we say so often, he makes his very life into a work for which his own book was in a sense the model, so that it is quite obvious to us that it is not Charlus who imitates Montesquiou, but that Montesquiou in his anecdotal, historical reality is merely a secondary fragment, derived from Charlus. Surrealism lastly — to remain on the level of this prehistory of modernity — surrealism doubtless could not accord language a sovereign place, since language is a system and since what the movement sought was, romantically, a direct subversion of all codes — an illusory subversion, moreover, for a code cannot be destroyed, it can only be “played with”; but by abruptly violating expected meanings (this was the famous surrealist “jolt”), by entrusting to the hand the responsibility of writing as fast as possible what the head itself ignores (this was automatic writing), by accepting the principle and the experience of a collective writing, surrealism helped secularize the image of the Author. Finally, outside of literature itself (actually, these distinctions are being superseded), linguistics has just furnished the destruction of the Author with a precious analytic instrument by showing that utterance in its entirety is a void process, which functions perfectly without requiring to be filled by the person of the interlocutors: linguistically, the author is never anything more than the man who writes, just as I is no more than the man who says I: language knows a “subject,” not a “person,” end this subject, void outside of the very utterance which defines it, suffices to make language “work,” that is, to exhaust it.",
  "Page 4",
  "-",
  "The absence of the Author (with Brecht, we might speak here of a real “alienation:’ the Author diminishing like a tiny figure at the far end of the literary stage) is not only a historical fact or an act of writing: it utterly transforms the modern text (or — what is the same thing — the text is henceforth written and read so that in it, on every level, the Author absents himself). Time, first of all, is no longer the same. The Author, when we believe in him, is always conceived as the past of his own book: the book and the author take their places of their own accord on the same line, cast as a before and an after: the Author is supposed to feed the book — that is, he pre-exists it, thinks, suffers, lives for it; he maintains with his work the same relation of antecedence a father maintains with his child. Quite the contrary, the modern writer (scriptor) is born simultaneously with his text; he is in no way supplied with a being which precedes or transcends his writing, he is in no way the subject of which his book is the predicate; there is no other time than that of the utterance, and every text is eternally written here and now. This is because (or: it follows that) to write can no longer designate an operation of recording, of observing, of representing, of “painting” (as the Classic writers put it), but rather what the linguisticians, following the vocabulary of the Oxford school, call a performative, a rare verbal form (exclusively given to the first person and to the present), in which utterance has no other content than the act by which it is uttered: something like the / Command of kings or the I Sing of the early bards; the modern writer, having buried the Author, can therefore no longer believe, according to the “pathos” of his predecessors, that his hand is too slow for his thought or his passion, and that in consequence, making a law out of necessity, he must accentuate this gap and endlessly “elaborate” his form; for him, on the contrary, his hand, detached from any voice, borne by a pure gesture of inscription (and not of expression), traces a field without origin — or which, at least, has no other origin than language itself, that is, the very thing which ceaselessly questions any origin.",
  "We know that a text does not consist of a line of words, releasing a single “theological” meaning (the “message” of the Author-God), but is a space of many dimensions, in which are wedded and contested various kinds of writing, no one of which is original: the text is a tissue of citations, resulting from the thousand sources of culture. Like Bouvard and Pecuchet, those eternal copyists, both sublime and comical and whose profound absurdity precisely designates the truth of writing, the writer can only imitate a gesture forever anterior, never original; his only power is to combine the different kinds of writing, to oppose some by others, so as never to sustain himself by just one of them; if he wants to express himself, at least he should know that the",
  "Page 5",
  "internal “thing” he claims to “translate” is itself only a readymade dictionary whose words can be explained (defined) only by other words, and so on ad infinitum: an experience which occurred in an exemplary fashion to the young De Quincey, so gifted in Greek that in order to translate into that dead language certain absolutely modern ideas and images, Baudelaire tells us, “he created for it a standing dictionary much more complex and extensive than the one which results from the vulgar patience of purely literary themes” (Paradis Artificiels). succeeding the Author, the writer no longer contains within himself passions, humors, sentiments, impressions, but that enormous dictionary, from which he derives a writing which can know no end or halt: life can only imitate the book, and the book itself is only a tissue of signs, a lost, infinitely remote imitation.",
  "-",
  "Once the Author is gone, the claim to “decipher” a text becomes quite useless. To give an Author to a text is to impose upon that text a stop clause, to furnish it with a final signification, to close the writing. This conception perfectly suits criticism, which can then take as its major task the discovery of the Author (or his hypostases: society, history, the psyche, freedom) beneath the work: once the Author is discovered, the text is “explained:’ the critic has conquered; hence it is scarcely surprising not only that, historically, the reign of the Author should also have been that of the Critic, but that criticism (even “new criticism”) should be overthrown along with the Author. In a multiple writing, indeed, everything is to be distinguished, but nothing deciphered; structure can be followed, “threaded” (like a stocking that has run) in all its recurrences and all its stages, but there is no underlying ground; the space of the writing is to be traversed, not penetrated: writing ceaselessly posits meaning but always in order to evaporate it: it proceeds to a systematic exemption of meaning. Thus literature (it would be better, henceforth, to say writing), by refusing to assign to the text (and to the world as text) a “secret:’ that is, an ultimate meaning, liberates an activity which we might call counter-theological, properly revolutionary, for to refuse to arrest meaning is finally to refuse God and his hypostases, reason, science, the law.",
  "-",
  "Let us return to Balzac’s sentence: no one (that is, no “person”) utters it: its source, its voice is not to be located; and yet it is perfectly read; this is because the true locus of writing is reading. Another very specific example can make this understood: recent investigations (J. P. Vernant) have shed light upon the constitutively ambiguous nature of Greek tragedy, the text of which is woven with words that have double meanings, each character understanding them unilaterally (this perpetual misunderstanding is",
  "Page 6",
  "precisely what is meant by “the tragic”); yet there is someone who understands each word in its duplicity, and understands further, one might say, the very deafness of the characters speaking in front of him: this someone is precisely the reader (or here the spectator). In this way is revealed the whole being of writing: a text consists of multiple writings, issuing from several cultures and entering into dialogue with each other, into parody, into contestation; but there is one place where this multiplicity is collected, united, and this place is not the author, as we have hitherto said it was, but the reader: the reader is the very space in which are inscribed, without any being lost, all the citations a writing consists of; the unity of a text is not in its origin, it is in its destination; but this destination can no longer be personal: the reader is a man without history, without biography, without psychology; he is only that someone who holds gathered into a single field all the paths of which the text is constituted. This is why it is absurd to hear the new writing condemned in the name of a humanism which hypocritically appoints itself the champion of the reader’s rights. The reader has never been the concern of classical criticism; for it, there is no other man in literature but the one who writes. We are now beginning to be the dupes no longer of such antiphrases, by which our society proudly champions precisely what it dismisses, ignores, smothers or destroys; we know that to restore to writing its future, we must reverse its myth: the birth of the reader must be ransomed by the death of the Author.",
  "— translated by Richard Howard",
  ""
};
int[][] data = {
  {1, 8, 2, 5, 6, 0, 2}, 
  {0},
  {0},
  {0},
  {0},
  {0},
  {0, 0, 3, 5, 3, 3, 3, 3, 2, 6, 2, 1, 1, 1, 1, 0, 0, 0, 4, 0, 0, 3, 4, 2, 0, 7, 0, 0, 1, 1, 2, 0, 0, 3, 5, 1, 1, 0, 1, 0, 2, 0, 2, 0, 0, 0, 0, 3, 3, 6, 6, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 4}
};
int[] dataFlat;
int dataMax;
float TEXTSIZE = 16;
float MARGIN = 40;

void setup() {
  size(850, 1100);
  frameRate(1);
  int[]dm = new int[data.length];
  for (int i=0; i<data.length; i++) {
    dm[i] = max(data[i]);
  }
  dataMax = max(dm);
  noLoop();
}

void draw() {
  background(255);
  // select a number of sentences to display based on time
  String[] sentenceSet = subset(sentences, 6, 1);
  int[][] dataSet = new int[1][data[6].length];
  dataSet[0] = data[6];
  // draw colored sentences in a box
  sentenceBox(sentenceSet, dataSet, MARGIN, MARGIN, width-MARGIN-3, height-2*MARGIN, TEXTSIZE);
}

void sentenceBox(String[] sentences, int[][]data, float x, float y, float w, float h, float tsize) {
  String[] words;
  float spacing = tsize/5;
  float leading = tsize/4;
  float xoffset = x;
  float yoffset = y + tsize + leading;
  // bounding box
  pushStyle();
  fill(255); 
  stroke(223);
  rect(x, y, w, h);
  popStyle();
  // look through sentences, random color each
  for (int j=0; j<sentences.length; j++) {
    String sentence = sentences[j];
    pushStyle();
    textSize(tsize);
    // colorMode(HSB, 360, 1, 1);
    // fill( random(360), 1, 1);
    words = split(sentence, " ");
    // loop through words, move to next line if a word won't fit
    for (int i=0; i<words.length; i++) {
      String word = words[i];
      if (xoffset + textWidth(word) > w) {
        xoffset = x;
        yoffset = yoffset + tsize + leading;
        // stopping printing lines beyond the bottom of the box
        if (yoffset > h + tsize + leading ) {
          break;
        }
      }
      if (data != null && j < data.length && data[j] != null && i < data[j].length) {
         fill( map(data[j][i], 0, dataMax, 191, 0), 255);
      }
      else {
        fill(223, 255);
      }
      text(word, xoffset, yoffset);
      xoffset = xoffset + spacing + textWidth(word);
      // println(word);
    }
    popStyle();
  }
}