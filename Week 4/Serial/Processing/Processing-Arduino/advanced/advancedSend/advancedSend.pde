// DEALING WITH MULTIPLE THINGS

import processing.serial.*;

Serial myPort;

int outByte1, outByte2; // WILL HOLD 2 BYTES TO SEND TO ARDUINO
int pOutByte1, pOutByte2; // TO HOLD LAST BYTES SENT TO ARDUINO

void setup() {
  size(400, 400);
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[4], 9600);
}

void draw() {
  if (mouseX > width/2) {
    outByte1 = 255;
  }
  else {
    outByte1 = 0;
  }

  if (mouseY > height/2) {
    outByte2 = 255;
  }
  else {
    outByte2 = 0;
  }

  // ONLY SEND DATA IF IT IS NEW
  if (outByte1 != pOutByte1 || outByte2 != pOutByte2) {
    sendBytes();
    // STORE LAST VYTES SENT
    pOutByte1 = outByte1;
    pOutByte2 = outByte2;
  }
}

// SEND SOME DATA TO THE ARDUINO
void sendBytes() {
  myPort.write(outByte1);
  myPort.write(outByte2);
}

