// Arduino to Processing

int outByte = 11;

void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT);
}

void loop() {
  outByte = digitalRead(2);
  Serial.write(outByte);
}
