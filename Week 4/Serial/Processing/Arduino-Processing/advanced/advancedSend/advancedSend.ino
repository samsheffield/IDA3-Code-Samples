// Arduino to Processing

int outByte1 = 255;
int outByte2 = 128;

void setup() {
  Serial.begin(9600);
  //pinMode(2, INPUT);
}

void loop() {
  //outByte1 = digitalRead(2);
  Serial.print(outByte1);
  Serial.print(",");
  Serial.println(outByte2);
  //Serial.write(10);
}
