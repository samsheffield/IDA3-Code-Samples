import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

int stepCounter = 0;
int counter;
OscMessage myOSC;

void setup() {
    size(600, 200);
    background(#88C894);
    // SET UP OSC
    oscP5 = new OscP5(this, 6666); // START OSC, LISTEN ON THIS PORT
    myRemoteLocation = new NetAddress("127.0.0.1", 5555); // THE IP ADDRESS AND PORT WE'LL BE SENDING DATA TO
}

void draw() {

    if (frameCount % 60 == 0) {
        stepCounter = counter % 8;
        println(stepCounter);
        counter++;
    }

    // THE OSC MAGIC HAPPENS HERE
    myOSC = new OscMessage("/timer"); // NEW MESSAGE WITH ID
    myOSC.add(stepCounter); // WHAT YOU WANT TO SEND
    oscP5.send(myOSC, myRemoteLocation); // SEND OSC


    myOSC = new OscMessage("/mouseX"); // NEW MESSAGE WITH ID
    myOSC.add(mouseX); // WHAT YOU WANT TO SEND
    oscP5.send(myOSC, myRemoteLocation); // SEND OSC
}

