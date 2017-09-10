/**
 * Simple keyboard variable
 * 2016-10-24
 * https:// forum.processing.org/two/discussion/18685/whats-the-best-way-to-put-a-number-in-a-variable-on-a-button-click
 **/
int enemies;
int minEnemies;
int maxEnemies;
boolean menuOpen = true;

void setup(){
  minEnemies = 1;
  maxEnemies = 9;
}
void draw(){
  background(0);
  text("ENEMIES: - " + enemies + " +",5,12);
}
void keyPressed(){
  if(menuOpen){
    if((key=='+')||key=='='){ enemies++; }
    if(key=='-'){ enemies--; }
    enemies = constrain(enemies, minEnemies, maxEnemies);
    println("ENEMIES:", enemies);
  }
}