import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
OscMessage myOSC;

float rr, gg, bb;

void setup() {
    size(600, 600);
    // SET UP OSC
    oscP5 = new OscP5(this, 6666); // START OSC, LISTEN ON THIS PORT
    myRemoteLocation = new NetAddress("10.10.36.204", 5555); // THE IP ADDRESS AND PORT WE'LL BE SENDING DATA TO
}

void draw() {
    background(rr, gg, bb);

    if (mousePressed) {
        // THE OSC MAGIC HAPPENS HERE
        myOSC = new OscMessage("/mouseY"); // NEW MESSAGE WITH ID
        myOSC.add(mouseY); // WHAT YOU WANT TO SEND
        oscP5.send(myOSC, myRemoteLocation); // SEND OSC

        myOSC = new OscMessage("/mouseX"); // NEW MESSAGE WITH ID
        myOSC.add(mouseX); // WHAT YOU WANT TO SEND
        oscP5.send(myOSC, myRemoteLocation); // SEND OSC
    }
}


// HANDLE INCOMING OSC
void oscEvent(OscMessage theOscMessage) {
    if (theOscMessage.checkAddrPattern("/rr")) {
        println("rr: " + theOscMessage.get(0).floatValue());
        rr = theOscMessage.get(0).floatValue();
    } 
    else if (theOscMessage.checkAddrPattern("/gg")) {
        println("gg: " + theOscMessage.get(0).floatValue());
        gg = theOscMessage.get(0).floatValue();
    } 
    else if (theOscMessage.checkAddrPattern("/bb")) {
        println("bb: " + theOscMessage.get(0).floatValue());
        bb = theOscMessage.get(0).floatValue();
    }
}

