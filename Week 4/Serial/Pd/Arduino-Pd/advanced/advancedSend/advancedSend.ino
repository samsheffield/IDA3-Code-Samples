// Arduino to Pd
// You can only send out a byte's worth of data, so use map() to scale

int outByte = 1;

void setup() {
  Serial.begin(9600);
}

void loop() {
  if(Serial.available() > 0){
    Serial.write(90);
    Serial.write(50);
    Serial.write(10);
    Serial.write(outByte);
    outByte++;
    Serial.flush();
  }
  
}

