import processing.serial.*;

Serial myPort;

void setup() {
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[4], 9600);
}

void draw() {
  myPort.write(255);
  delay(500);
  myPort.write(0);
  delay(500);
}

