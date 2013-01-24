import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
    // SET UP OSC
    oscP5 = new OscP5(this, 6666); // NEW OSC OBJECT, LISTENING ON PORT 6666
}

void draw() {
}

void oscEvent(OscMessage theOscMessage) {
    if (theOscMessage.checkAddrPattern("/test")) {
        println("test: " + theOscMessage.get(0).intValue());
    } 
    else if (theOscMessage.checkAddrPattern("/monkeys")) {
        println("monkeys: " + theOscMessage.get(0).intValue());
    } 
    else if (theOscMessage.checkAddrPattern("/multiples")) {
        println("multiples: " + theOscMessage.get(0).intValue() + " " + theOscMessage.get(1).intValue() + " " + theOscMessage.get(2).intValue());
    }
}


