import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

int pwmValue;

void setup() {
    size(400, 600);

    println(Arduino.list()); // NEED TO KNOW WHAT PORT
    arduino = new Arduino(this, Arduino.list()[4], 57600); // CHANGE ARRAY INDEX TO MATCH PORT NUMBER
    arduino.pinMode(13, Arduino.OUTPUT);
    arduino.pinMode(11, Arduino.OUTPUT);


    noStroke();
    rectMode(CENTER);
}

void draw() {
    background(255, 0, 0);

    // DIGITAL OUTPUT
    if (mousePressed) {
        arduino.digitalWrite(13, Arduino.HIGH);
        fill(255);
    }
    else {
        arduino.digitalWrite(13, Arduino.LOW);
        fill(0);
    }
    ellipse(200, 150, 200, 200);

    //ANALOG OUTPUT (PWM)
    //arduino.analogWrite(11, 0); // OFF
    //arduino.analogWrite(11, 255); // ON
    //arduino.analogWrite(11, 128); // 50%
    if(pwmValue > 0){
        pwmValue--;
    } else {
        pwmValue = 255;
    }
    println(pwmValue);
    arduino.analogWrite(11, pwmValue); // MUST BE ON A PIN WITH A ~. NO NEED TO SET PINMODE
    
}

