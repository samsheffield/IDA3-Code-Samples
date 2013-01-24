import processing.serial.*;
Serial myPort;

int inByte;
int[] input= new int[2];

void setup() {
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[4], 9600);
  myPort.bufferUntil(10); // when to call serialevent
}

void draw() {
  // nothin'
}

void serialEvent(Serial myPort) {

  String myString = myPort.readString();   
  if (myString != null) {
    myString = trim(myString); // get rid of extra characters
    input = int(split(myString, ','));
    for (int i=0;i < input.length; i++) {
      println("input " + i + ": " + input[i]);
    }
  }
}

