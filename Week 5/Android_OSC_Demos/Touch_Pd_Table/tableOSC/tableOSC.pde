//Android to Pd Table

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

color[] c = {#ffcc66, #ff6766, #9359a6, #6d9e76, #526ec2};
int counter;

void setup() {
  orientation(LANDSCAPE);
  smooth();
  stroke(110);
  background(0);

  // SET UP OSC
  oscP5 = new OscP5(this, 13001);
  myRemoteLocation = new NetAddress("10.10.37.140", 13000);
}

void draw() {
  if(mousePressed){
    background(255);
    stroke(110);
    strokeWeight(10);
    fill(#ff6766);
    ellipse(motionX, motionY, 120, 120);

    if (counter < 255){
      counter++;
    } else {
      counter = 0;
    }

    int adjustedY = int(255 - map(motionY, 0, displayHeight, 0, 255)); // SCALED, REVERSED OUTPUT
    if(adjustedY < 0 ) adjustedY = 0;
    sendArrayOSC("/table", counter, adjustedY);
  } 
  else{ 
    background(0);
    counter = 0;
  }
}  

void sendArrayOSC(String oscAddress, int index, int value){
    OscMessage myMessage = new OscMessage(oscAddress);
    myMessage.add(index);
    myMessage.add(value);
    oscP5.send(myMessage, myRemoteLocation); 
}
