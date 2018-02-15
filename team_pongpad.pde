import net.java.games.input.*;
//import org.gamecontrolplus.*;
//import org.gamecontrolplus.gui.*;

//ControlIO control;
//Configuration config;
//ControlDevice gpad;

float spieler_x;
float spieler_y;
float ball_x;
float ball_y;
float ball_geschw_x;
float ball_geschw_y;

int runde; 

void setup() {
    //control = ControlIO.getInstance(this);
    //  gpad = control.getMatchedDevice("Ping");
    //   if (gpad == null) {
    //println("No suitable device configured");
    //System.exit(-1); // End the program NOW!
  
      
  spieler_x = 20;
  //spieler_y = gpad.getSlider("board").getValue();
  ball_x = 400;
  ball_y = 300;
  ball_geschw_x =-3;
  ball_geschw_y = 0;
  runde= 0;
  size(800, 600);
 // rectMode(CENTER);
}

void draw() {
  background(0);
  rectMode(CENTER);
  rect(spieler_x, spieler_y, 20, 100);
  noStroke();
  rect(ball_x, ball_y, 10, 10);
  
  //spieler_y = map((gpad.getSlider("board").getValue()), -550, 550, 0, 600);
  
  //println(gpad.getSlider("board").getValue());
  
  
  if (keyPressed) {
    if (keyCode == DOWN) {
      if (spieler_y < 550) {
        spieler_y = spieler_y + 10;
      }
    }
    if (keyCode == UP) {
      if (spieler_y > 50) {
        spieler_y = spieler_y - 10;
      }
    }
  }
  ball_x = ball_x + ball_geschw_x;
  ball_y = ball_y + ball_geschw_y;
  if (ball_x < 30) {
    if (ball_y < (spieler_y + 55) && ball_y > (spieler_y -55)) {
      ball_geschw_x = (-ball_geschw_x) + 1;
      ball_geschw_y = ball_geschw_y - (spieler_y - ball_y) * 0.1;
      runde= runde + 1;
    } else {
      ball_x = 400;
      ball_y = 300;
      ball_geschw_x = -3;
      ball_geschw_y = 0;
      runde = 0;
    }
  }
  if (ball_y > 595 || ball_y < 5) {
    ball_geschw_y = - ball_geschw_y;
  }
  if (ball_x > 795) {
    ball_geschw_x = -ball_geschw_x;
  }
  text("Runde: " + runde, 700, 20);
}