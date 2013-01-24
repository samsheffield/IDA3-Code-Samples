// Arduino to Pd
// You can only send out a byte's worth of data, so use map() to scale

int outByte;

void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.write(outByte);
  outByte++;
  delay(100);
}
