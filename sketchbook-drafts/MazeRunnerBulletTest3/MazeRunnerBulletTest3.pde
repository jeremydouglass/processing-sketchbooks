/*
 * NOTE: This doesn't generate real mazes; they're just
 * empty spaces in which to walk around. Enjoy! :)
 *
 */

import queasycam.*;
import picking.*;

Player player;
Maze maze;

Gun gun;
Picker picker;
int pi;

void setup(){
  size(600, 600, P3D);
  strokeWeight(2);
  
  player = new Player(this);
  maze = new Maze(5);
  maze.setPlayerAtStart(player);
  player.sensitivity = 1; 
  gun = new Gun(player);
  picker = new Picker(this);
  maze.update();
}

void draw(){
  background(51);
  maze.update();
  pi=0;
  maze.display();
  player.update();
  gun.display();
}

void mouseClicked() {
  int id = picker.get(mouseX, mouseY);
  println("id: " + id);
  // if (id > -1) {
  //   println(maze.blocks[id][id]);
  //   maze.blocks[id][1].moveDown();
  //  }
}