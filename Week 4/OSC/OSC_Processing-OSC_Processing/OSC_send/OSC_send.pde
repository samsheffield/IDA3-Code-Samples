import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

int stepCounter = 0;
int counter;
int button;
int myMouseX, myMouseY = -200;
boolean started; // don't collect mouse input unless in screen

OscMessage myOSC;

void setup() {
    size(400, 400);
    background(#88C894);
    // SET UP OSC
    oscP5 = new OscP5(this, 5555); // START OSC, LISTEN ON THIS PORT
    myRemoteLocation = new NetAddress("127.0.0.1", 6666); // THE IP ADDRESS AND PORT WE'LL BE SENDING DATA TO
}

void draw() {

    if (frameCount % 5 == 0) {
        stepCounter = counter % 255;
        println(stepCounter);
        counter++;
    }

    // THE OSC MAGIC HAPPENS HERE
    myOSC = new OscMessage("/brightness"); // NEW MESSAGE WITH ID
    myOSC.add(stepCounter); // WHAT YOU WANT TO SEND
    oscP5.send(myOSC, myRemoteLocation); // SEND OSC

    if (mousePressed) button = 1;
    else button = 0;

    myOSC = new OscMessage("/button"); // NEW MESSAGE WITH ID
    myOSC.add(button); // WHAT YOU WANT TO SEND
    oscP5.send(myOSC, myRemoteLocation); // SEND OSC

    if (started) { 
        myMouseX = mouseX;
        myMouseY = mouseY;
    } 
    else {
        if (mouseX > 0 || mouseY >0) started = true;
    }

    myOSC = new OscMessage("/mouseXY"); // NEW MESSAGE WITH ID
    myOSC.add(myMouseX); // WHAT YOU WANT TO SEND
    myOSC.add(myMouseY); // WHAT YOU WANT TO SEND
    oscP5.send(myOSC, myRemoteLocation); // SEND OSC
}



