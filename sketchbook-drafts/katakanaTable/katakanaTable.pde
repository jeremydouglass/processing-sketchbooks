// https://forum.processing.org/two/discussion/21005/error-reading-a-table#latest

int letterSize = 24; 
int staKata = unhex("30A1"); 
int stoKata = unhex("30FA");
 
Table kataTable;
 
void setup() {
  //Set the font. This way you can display special character.
  PFont font = createFont("ufonts.com_arial-unicode-ms.ttf", 64);
  textFont(font);
  kataTable = loadTable("katakana.csv", "header"); //Load the katakana table csv file to get the decimal/hexadecimal value of the characters
  size(720, 480);
  background(0);
 
  println("Start:" + unhex("30A1"));
  println("End:" + unhex("30FA"));
}
 
void draw() {
  background(0);
  textSize(letterSize);
  fill(0, 255, 130);
  //text(new String (Character.toChars(staKata)), width/2, height/2);
}