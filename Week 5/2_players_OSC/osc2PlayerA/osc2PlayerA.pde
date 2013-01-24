// PLAYER 1

import oscP5.*;
import netP5.*;
OscMessage myOSC;

OscP5 oscP5;
NetAddress myRemoteLocation;

Player p1;
Opponent p2;

int p2x, p2y; // STORE OPPONENT'S XY FROM OSC

boolean started;

void setup() {
  size(400,400);
  // CROSSOVER PORTS
  oscP5 = new OscP5(this, 6666); // START OSC, LISTEN ON THIS PORT
  myRemoteLocation = new NetAddress("127.0.0.1", 5555); // OPPONENT'S IP
  p1 = new Player();
  p2 = new Opponent();
}

void draw() {
  background(0);
  if(started){
    p1.update(); // US
    p2.update(p2x, p2y); // THEM
  }
  
  p2.draw(); // THEM
  p1.draw(); // US
  
  // SEND YOUR XY TO OPPONENT
  myOSC = new OscMessage("/p1"); // NEW MESSAGE WITH ID
  myOSC.add(p1.x); // PLAYER X
  myOSC.add(p1.y); // PLAYER Y
  oscP5.send(myOSC, myRemoteLocation); // SEND OSC
}

// DEAL WITH INCOMING OSC
void oscEvent(OscMessage theOscMessage) {
    if (theOscMessage.checkAddrPattern("/p2")) {
        p2x = theOscMessage.get(0).intValue(); // OPPONENT X
        p2y = theOscMessage.get(1).intValue(); // OPPONENT Y
    } 
}

// KEEP PLAYER AND OPPONENT FROM STARTING AT 0
void mouseMoved(){
  if(!started)
    started = true;
}
