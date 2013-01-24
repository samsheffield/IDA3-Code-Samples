// receive a stream of bytes from a single arduino input

import processing.serial.*;
Serial myPort;

int inByte;

void setup() {
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[4], 9600);
}

void draw() {
  // nothin'
}

void serialEvent(Serial myPort) {
  int inByte = myPort.read();
  println(inByte);
}

