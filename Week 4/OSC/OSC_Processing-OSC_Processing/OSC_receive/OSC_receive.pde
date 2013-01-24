import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
float oscX, oscY = -200; // HIDE OFFSCREEN
int bright, button;

void setup() {
    size(400, 400);    
    smooth();
    noStroke();

    // SET UP OSC
    oscP5 = new OscP5(this, 6666); // NEW OSC OBJECT, LISTENING ON PORT 6666
}

void draw() {
    background(bright);
    if(button == 0) fill(255);
    else fill(0);
    ellipse(oscX, oscY, 20, 20);
}

void oscEvent(OscMessage theOscMessage) {
    if (theOscMessage.checkAddrPattern("/brightness")) {
        println("brightness: " + theOscMessage.get(0).intValue());
        bright = theOscMessage.get(0).intValue();
    } 
    else if (theOscMessage.checkAddrPattern("/button")) {
        println("button: " + theOscMessage.get(0).intValue());
        button = theOscMessage.get(0).intValue();
    } 
    else if (theOscMessage.checkAddrPattern("/mouseXY")) {
        println("mouseXY: " + theOscMessage.get(0).intValue() + " " + theOscMessage.get(1).intValue());
        oscX = theOscMessage.get(0).intValue();
        oscY = theOscMessage.get(1).intValue();
    }
}

