// PLAYER 2

import oscP5.*;
import netP5.*;
OscMessage myOSC;

OscP5 oscP5;
NetAddress myRemoteLocation;

Player p2;
Opponent p1;

int p1x, p1y; // STORE OPPONENT'S XY FROM OSC

boolean started;

void setup() {
  size(400,400);
  // CROSSOVER PORTS
  oscP5 = new OscP5(this, 5555); // START OSC, LISTEN ON THIS PORT
  myRemoteLocation = new NetAddress("127.0.0.1", 6666); // OPPONENT'S IP
  p2 = new Player();
  p1 = new Opponent();
}

void draw() {
  background(0);
  if(started){
    p2.update(); // US
    p1.update(p1x, p1y); // THEM
  }

  p1.draw(); // THEM
  p2.draw(); // US
  
  // SEND YOUR XY TO OPPONENT
  myOSC = new OscMessage("/p2"); // NEW MESSAGE WITH ID
  myOSC.add(p2.x); // PLAYER X
  myOSC.add(p2.y); // PLAYER Y
  oscP5.send(myOSC, myRemoteLocation); // SEND OSC
}

// DEAL WITH INCOMING OSC
void oscEvent(OscMessage theOscMessage) {
    if (theOscMessage.checkAddrPattern("/p1")) {
        p1x = theOscMessage.get(0).intValue(); // OPPONENT X
        p1y = theOscMessage.get(1).intValue(); // OPPONENT Y
    } 
}

// KEEP PLAYER AND OPPONENT FROM STARTING AT 0
void mouseMoved(){
  if(!started)
    started = true;
}
