float spieler_x;
float spieler_y;
float ball_y;
float ball_x;
float ball_speed_x;
float ball_speed_y;

int runde;

import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;


public void setup() {
  control = ControlIO.getInstance(this);

  gpad = control.getMatchedDevice("Pong");
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }
  size(800, 600);
  rectMode(CENTER);

  control = ControlIO.getInstance(this);
  gpad = control.getMatchedDevice("pong_pad_conf");
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1);
  }
  spieler_x = 20;
  spieler_y = gpad.getSlider("STICK").getValue();
  ball_x = 400;
  ball_y = 300;
  ball_speed_x = -4;
  ball_speed_y = 0;
  runde = 0;
}

public void draw() {
  background(0);
  rect(spieler_x, spieler_y, 20, 100);
  rect(ball_x, ball_y, 10, 10);
  spieler_y = gpad.getSlider("STICK").getValue();


  //if (keyPressed) {
  //  if (keyCode == DOWN) {
  //    if (spieler_y < 550) {
  //      spieler_y = spieler_y + 5;}
  //    }
  //    if (keyCode == UP) {
  //      if (spieler_y > 50) {
  //        spieler_y = spieler_y - 5;
  //      }
  //    }
  //  }
  ball_x = ball_x + ball_speed_x;
  ball_y = ball_y + ball_speed_y;

  if (ball_x < 30) {
    if (ball_y < (spieler_y + 55) && ball_y > (spieler_y - 55)) {
      ball_speed_x = (-ball_speed_x) + 1;
      ball_speed_y = ball_speed_y - (spieler_y - ball_y) * 0.1;
      runde = runde + 1;
    } else {
      ball_x = 400;
      ball_y = 300;
      ball_speed_x = -4;
      ball_speed_y = 0;
      runde = 0;
    }
  } 
  if (ball_y > 595 || ball_y < 5) {
    ball_speed_y = -ball_speed_y;
  }
  if (ball_x > 795) {
    ball_speed_x = -ball_speed_x;
  }
  text("Runde: " + runde, 700, 20);
}