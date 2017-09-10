/*
 * NOTE: This doesn't generate real mazes; they're just
 * empty spaces in which to walk around. Enjoy! :)
 *
 */

import java.awt.MouseInfo;
import java.awt.Point;
import java.awt.Robot;
import java.awt.GraphicsEnvironment;
import java.util.HashMap;
import processing.core.*;
import processing.event.KeyEvent;

Player player;
Maze maze;
Gun gun;

void setup(){
  size(600, 600, P3D);
  strokeWeight(2);
  
  player = new Player(this);
  maze = new Maze(20);
  maze.setPlayerAtStart(player);
  player.sensitivity = 1; 
  gun = new Gun(player);
}

void draw(){
  background(51);
  maze.update();
  maze.display();
  player.update();
  gun.display();
}