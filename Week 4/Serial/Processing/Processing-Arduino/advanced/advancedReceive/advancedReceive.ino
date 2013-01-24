int inByte[2]; // WE'RE EXPECTING TWO NUMBERS

void setup(){
  Serial.begin(9600);
  pinMode(8, OUTPUT);
  pinMode(13, OUTPUT);
}

void loop(){
  // IF THE ARDUINO IS RECEIVING DATA...
  if(Serial.available() > 1){ // 1 LESS THAN YOUR STORAGE ARRAY'S LENGTH
  
    for (int i=0; i < 2 ; i++) {
      inByte[i] = Serial.read(); // STORE 2 NUMBERS INTO THE ARRAY
    }
    Serial.flush(); // FLUSH SERIAL BUFFER
  }

  // DO SOMETHING WITH IT!
  if(inByte[0] == 255){
    digitalWrite(8, HIGH);
  }
  else{
    digitalWrite(8, LOW);
  }
  if(inByte[1] == 255){
    digitalWrite(13, HIGH);
  }
  else{
    digitalWrite(13, LOW);
  }
}



