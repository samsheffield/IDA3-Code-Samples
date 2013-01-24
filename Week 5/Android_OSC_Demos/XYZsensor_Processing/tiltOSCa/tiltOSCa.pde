// FROM ANDROID TO PROCESSING

import oscP5.*;
import netP5.*;
OscMessage myOSC;

OscP5 oscP5;
NetAddress myRemoteLocation;

// DEAL WITH ACCELEROMETER
AccelerometerManager accel;
float ax, ay, az;

Ring r1;
Pellet p1;

float px, py;

void setup() {
  accel = new AccelerometerManager(this);
  orientation(PORTRAIT);
  r1 = new Ring(width/2, height/2, 150);
  p1 = new Pellet(true);
  oscP5 = new OscP5(this, 6666); // START OSC, LISTEN ON THIS PORT
  myRemoteLocation = new NetAddress("10.10.37.140", 5555);
}

void draw() {
  background(0);
  p1.update(hitTest(p1.x, p1.y, r1.x, r1.y), px, py);
  p1.draw();

  r1.update(ax, ay);
  r1.draw();
  
  // SEND RING XY TO PROCESSING
  myOSC = new OscMessage("/r1"); // NEW MESSAGE WITH ID
  myOSC.add(r1.x); // WHAT YOU WANT TO SEND
  myOSC.add(r1.y); // WHAT YOU WANT TO SEND
  oscP5.send(myOSC, myRemoteLocation); // SEND OSC
}

// COLLISION
boolean hitTest(float x1, float y1, float x2, float y2){
	if(dist(x1,y1,x2,y2) < 36){
		return true;
	}else{
		return false;
	}
}

// ACCELEROMETER HANDLERS
public void resume() {
  if (accel != null) {
    accel.resume();
  }
}
   
public void pause() {
  if (accel != null) {
    accel.pause();
  }
}

public void shakeEvent(float force) {
  println("shake : " + force);
}


public void accelerationEvent(float x, float y, float z) { 
  //println("acceleration: " + x + ", " + y + ", " + z);
  ax = x;
  ay = y;
  az = z;
  redraw();
}

// DEAL WITH INCOMING OSC
void oscEvent(OscMessage theOscMessage) {
    if (theOscMessage.checkAddrPattern("/p1")) {
        px = theOscMessage.get(0).floatValue();
        py = theOscMessage.get(1).floatValue();
    } 
}
