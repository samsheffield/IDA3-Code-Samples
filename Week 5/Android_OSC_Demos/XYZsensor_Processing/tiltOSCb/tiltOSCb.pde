// FROM PROCESSING TO ANDROID

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

Ring r1;
Pellet p1;

OscMessage myOSC;

float rx, ry;

void setup() {
  size(400,600);
  r1 = new Ring(width/2, height/2, 75);
  p1 = new Pellet();

  oscP5 = new OscP5(this, 5555); // START OSC, LISTEN ON THIS PORT
  myRemoteLocation = new NetAddress("10.10.37.156", 6666);
}

void draw() {
  background(0);

  // MOVE PELLET, CHECK FOR COLLISION WITH RING, DRAW TO SCREEN
  p1.update(hitTest(p1.x, p1.y, r1.x, r1.y), mouseX, mouseY);
  p1.draw();

  // SEND PELLET XY TO ANDROID
  myOSC = new OscMessage("/p1"); // NEW MESSAGE WITH ID
  myOSC.add(p1.x*2); // WHAT YOU WANT TO SEND
  myOSC.add(p1.y*2); // WHAT YOU WANT TO SEND
  oscP5.send(myOSC, myRemoteLocation); // SEND OSC

  // MOVE RING ACCORDING TO INCOMING OSC, DRAW TO SCREEN
  r1.update(rx, ry);
  r1.draw();
}

// TEST FOR COLLISIONS
boolean hitTest(float x1, float y1, float x2, float y2){
	if(dist(x1,y1,x2,y2) < 36){
		return true;
	}else{
		return false;
	}
}

// DEAL WITH INCOMING OSC
void oscEvent(OscMessage theOscMessage) {
    if (theOscMessage.checkAddrPattern("/r1")) {
        rx = theOscMessage.get(0).floatValue()/2; // MY SCREEN IS HALF THE SIZE OF ANDROID
        ry = theOscMessage.get(1).floatValue()/2;
    } 
}
