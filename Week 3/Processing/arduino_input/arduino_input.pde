import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

float analogFill;

void setup() {
    size(400, 600);
    println(Arduino.list()); // NEED TO KNOW WHAT PORT
    arduino = new Arduino(this, Arduino.list()[4], 57600); // CHANGE ARRAY INDEX TO MATCH PORT NUMBER
    arduino.pinMode(2, Arduino.INPUT);

    rectMode(CENTER); // center all rectangles
    noStroke();
}

void draw() {
    background(#ff0000);

    // DIGITAL INPUT: HIGH (1) or LOW (0)
    if (arduino.digitalRead(2) == Arduino.HIGH) {
        fill(255);
    } 
    else {
        fill(0);
    }
    rect(200, 150, 100, 100);


    // ANALOG INPUT: 0 ~ 1023
    analogFill = map(arduino.analogRead(0), 0, 1023, 0, 255); // map 0-1023 range to 0-255 range
    
    if(arduino.analogRead(0) > 500 ){
      fill(#00ff00);
    }
    //fill(analogFill);
    
    ellipse(200, 450, 100, 100);
}

