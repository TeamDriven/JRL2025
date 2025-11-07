#include <TimerThree.h>

#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>

#include "globals.h"
//#include "DueTimer.h"
//#include "sam.h"
//#include "String.h"
#include <SPI.h>

//
//https://learn.adafruit.com/adxl345-digital-accelerometer/programming

void timer_isr() {
  int sensval = 0;
  int i = 0;
  bluePollenCount = 0;
  redPollenCount = 0;
  redHighPollenCount = 0;
  blueHighPollenCount = 0;
  redLevitateCount = 0;
  blueLevitateCount = 0;

  if(flytraps_enabled) {
    blueFlytrapTime--;
    redFlytrapTime--;
  }
  
  for(i = 0; i < 12; i++) {
    int sensval = digitalRead(sensor_pins[i]);
    if (sensval == 1 && last_vals[i] == 0 && counts[i] < 9) {
      counts[i]++;
    } else if (counts[i] == 9 && sensval == 0) {
      counts[i]++;
      if (i == 1 || i == 3 || i == 5) {
        if (!blueFlytrap_open) {
          blueFlytrapTime = 0;
        }
        blueFlytrap_open = true;
        blueFrenzyFlag = 1;
        //setFlytraps(blueFlytrap_open, true);
        blueFlytrapTime += 20000;
      }
      if (i == 7 || i == 9 || i == 11) {
        if (!redFlytrap_open) {
          redFlytrapTime = 0;
        }
        redFlytrap_open = true;
        redFrenzyFlag = 1;
        //setFlytraps(redFlytrap_open, false);
        redFlytrapTime += 20000;
      }
    }

    if (i < 6) {
      if (i < 4) {
        redPollenCount += counts[i];
      } else {
        redHighPollenCount += counts[i];
      }
      if (i % 2 == 0 && counts[i] == 10) {
        redLevitateCount++;
      }
    } else if (i < 12) {
      if (i < 10) {
        bluePollenCount += counts[i];
      } else {
        blueHighPollenCount += counts[i];
      }
      
      if (i % 2 == 0 && counts[i] == 10) {
        blueLevitateCount++;
      }
    }
    last_vals[i] = sensval;
  }
}

void reset_counts() {
  int i = 0;
  for(i = 0; i < 16; i++) {
    counts[i] = 0;
  }
  bluePollenCount = 0;
  blueLevitateCount = 0;
  redPollenCount = 0;
  redLevitateCount = 0;
  redHighPollenCount = 0;
  blueHighPollenCount = 0;
}

void print_counts() {
  int i = 0;
  Serial.print(": ");
  for(i = 0; i < 16; i++) {
    Serial.print(counts[i]);
    Serial.print(',');
  }
  Serial.println();
}


// the setup function runs once when you press reset or power the board
void setup() {
  
  
  pinMode(ENABLE_PIN, OUTPUT);
  pinMode(TELE_PIN, OUTPUT);
  // LED OUTPUTS 1 - 5
  pinMode(22, OUTPUT);  // LED 1 Green
  pinMode(23, OUTPUT);  // LED 1 Red
  pinMode(24, OUTPUT);  // LED 1 Blue
  pinMode(25, OUTPUT);  // LED 2 Green
  pinMode(26, OUTPUT);  // LED 2 Red
  pinMode(27, OUTPUT);  // LED 2 Blue
  pinMode(28, OUTPUT);  // LED 3 Green
  pinMode(29, OUTPUT);  // LED 3 Red
  pinMode(30, OUTPUT);  // LED 3 Blue
  pinMode(31, OUTPUT);  // LED 4 Green
  pinMode(32, OUTPUT);  // LED 4 Red
  pinMode(33, OUTPUT);  // LED 4 Blue
  pinMode(34, OUTPUT);  // LED 5 Green
  pinMode(35, OUTPUT);  // LED 5 Red
  pinMode(36, OUTPUT);  // LED 5 Blue
  pinMode(52, OUTPUT);  // PIN52

  // LED OUTPUTS 6 - 10
  pinMode(37, OUTPUT);  // LED 6
  pinMode(38, OUTPUT);  // LED 6
  pinMode(39, OUTPUT);  // LED 6
  pinMode(40, OUTPUT);  // LED 7
  pinMode(41, OUTPUT);  // LED 7
  pinMode(42, OUTPUT);  // LED 7
  pinMode(43, OUTPUT);  // LED 8
  pinMode(44, OUTPUT);  // LED 8
  pinMode(45, OUTPUT);  // LED 8
  pinMode(46, OUTPUT);  // LED 9
  pinMode(47, OUTPUT);  // LED 9
  pinMode(48, OUTPUT);  // LED 9
  pinMode(49, OUTPUT);  // LED 10
  pinMode(50, OUTPUT);  // LED 10
  pinMode(51, OUTPUT);  // LED 10

  pinMode(5, OUTPUT);

  // Set ADC resolution
  //analogReadResolution(12);

  // Analong Inputs
  pinMode(A0, INPUT_PULLUP);  //
  pinMode(A1, INPUT_PULLUP);  //
  pinMode(A2, INPUT_PULLUP);  //
  pinMode(A3, INPUT_PULLUP);  //
  pinMode(A4, INPUT_PULLUP);  //
  pinMode(A5, INPUT_PULLUP);  //
  pinMode(A6, INPUT_PULLUP);  //
  pinMode(A7, INPUT_PULLUP);  //
  pinMode(A8, INPUT_PULLUP);  //
  pinMode(A9, INPUT_PULLUP);  //
  pinMode(A10, INPUT_PULLUP);  //
  pinMode(A11, INPUT_PULLUP);  //

  

  Serial.begin(9600);
  Serial.println("beginning");
  /*Timer4.attachInterrupt(Timer4_ISR);
  Timer4.setFrequency(10000);
  Timer4.start();  

  Timer5.attachInterrupt(Timer5_ISR);
  Timer5.setFrequency(100);
  Timer5.start();  */

  pwm.begin();
  // In theory the internal oscillator is 25MHz but it really isn't
  // that precise. You can 'calibrate' by tweaking this number till
  // you get the frequency you're expecting!
  pwm.setOscillatorFrequency(27000000);  // The int.osc. is closer to 27MHz  
  pwm.setPWMFreq(SERVO_FREQ);  // Analog servos run at ~60 Hz updates

  delay(10);
  setFlytraps(true,false);
  setFlytraps(true,true);

  Timer3.initialize(1000); //500 micro seconds
  Timer3.attachInterrupt(timer_isr);

  reset_counts();
  SERVO_OFF;
  RTS_LOW;
}

int count = 0;
int polarity = 1;

int r = 100;
int g = 0;
int b = 0;
int rV = -1;
int gV = 1;
int bV = -1;
int top = 200;
int bottom = -100;
int limit(int val, int small, int big){
  if (val > big) {
    return big;
  } else if (val < small) {
    return small;
  } else {
    return val;
  }
}


void readCommand(char in) { 
  commandBuffer += in;
  //Serial.print(in);
  commandBuffer.toUpperCase();
  if (commandBuffer == "ET") {
    flytraps_enabled = true;
    blueFlytrapTime = 10000;
    redFlytrapTime = 10000;
    loopCounter = 0;
    setFlytraps(false,false);
    setFlytraps(false,true);
    digitalWrite(ENABLE_PIN, HIGH);   
    digitalWrite(TELE_PIN, HIGH);     
    SERVO_ON;
  } else if (commandBuffer == "DI") {
    flytraps_enabled = false;
    setFlytraps(true,false);
    setFlytraps(true,true);
    digitalWrite(ENABLE_PIN, LOW);  
    SERVO_OFF; 
  } else if (commandBuffer == "EA"){
    flytraps_enabled = false;
    setFlytraps(true,false);
    setFlytraps(true,true);
    digitalWrite(ENABLE_PIN, HIGH);   
    digitalWrite(TELE_PIN, LOW);
    SERVO_ON;
  } else if (commandBuffer == "CN"){
    RTS_HIGH;
    Serial.print(blueLevitateCount);
    Serial.print(",");
    Serial.print(redLevitateCount);
    Serial.print(",");
    Serial.print(bluePollenCount);
    Serial.print(",");
    Serial.print(redPollenCount);
    Serial.print(",");
    Serial.print(blueHighPollenCount);
    Serial.print(",");
    Serial.println(redHighPollenCount);
    RTS_LOW;
  } else if (commandBuffer == "LC") {
    Serial.print(blueLevitateCount);
    Serial.print(",");
    Serial.println(redLevitateCount);
  } else if (commandBuffer == "PC") {
    Serial.print(bluePollenCount);
    Serial.print(",");
    Serial.println(redPollenCount);
  } else if (commandBuffer == "CO") {
    print_counts();
  } else if (commandBuffer == "RE") {
    redCount = 0;
    blueCount = 0;
    reset_counts();
  } else if (commandBuffer == "BL") {
    lightMode = COLOR_BLUE;
  } else if (commandBuffer == "YE") {
    lightMode = COLOR_YELLOW;
  }else if (commandBuffer == "GR") {
    lightMode = COLOR_GREEN;
  }else if (commandBuffer == "RD") {
    lightMode = COLOR_RED;
  }else if (commandBuffer == "RW") {
    lightMode = RAINBOW_WAVE;
  }else if (commandBuffer == "RP") {
    lightMode = RAINBOW_PULSE;
  }else if (commandBuffer == "LO") {
    lightMode = COLOR_OFF;
  }else if (commandBuffer == "MM") {
    lightMode = MATCH_MODE;
  }
  if (commandBuffer.length() >= 2) {
    commandBuffer = "";
  }
  
}


void loop()
{
  checkSensors();
  if (Serial.available()) {
    char tmp = Serial.read();
    //Serial.write(tmp);
    readCommand(tmp);
    bufferCounter = 0;
  }

  bufferCounter += 1;
  if (bufferCounter >= BUFFER_CLEAR_TIME) {
    bufferCounter = 0;
    commandBuffer = "";
  }

  if (flytraps_enabled) {
    //blueFlytrapTime--;
    if (blueFrenzyFlag == 1) {
      setFlytraps(blueFlytrap_open, true);
      blueFrenzyFlag = 0;
    }
    
    if (blueFlytrapTime <= 0) {
      blueFlytrapTime = 10000;
      blueFlytrap_open = !blueFlytrap_open;
      setFlytraps(blueFlytrap_open, true);
    }

    //redFlytrapTime--;
    if (redFrenzyFlag == 1) {
      setFlytraps(redFlytrap_open, false);
      redFrenzyFlag = 0;
    }
    
    if (redFlytrapTime <= 0) {
      redFlytrapTime = 10000;
      redFlytrap_open = !redFlytrap_open;
      setFlytraps(redFlytrap_open, false);
    }
    
  } else {
    redFlytrapTime = 0;
    blueFlytrapTime = 0;
  }

  /*if (flytraps_enabled)
    loopCounter++;
  if (loopCounter > 10000) {
    loopCounter = 0;
    flytrap_open = !flytrap_open;
    
    setFlytraps(flytrap_open);
  }*/
  delay(1);
}

void setFlytraps (bool isOpen,bool isBlue) {
  if (isBlue) {
    if (isOpen) {
      pwm.setPWM(0, 0, SERVOMIN);
      pwm.setPWM(1, 0, SERVOMIN);
    } else {
      pwm.setPWM(0, 0, SERVOMAX);
      pwm.setPWM(1, 0, SERVOMAX);
    } 
  } else {
    if (isOpen) {
      pwm.setPWM(2, 0, SERVOMIN);
      pwm.setPWM(3, 0, SERVOMIN);
    } else {
      pwm.setPWM(2, 0, SERVOMAX);
      pwm.setPWM(3, 0, SERVOMAX);
    } 
  }
  /*for (int i = 0; i < 4; i++) {
      if (isOpen) {
        pwm.setPWM(i, 0, SERVOMIN);
      } else {
        pwm.setPWM(i, 0, SERVOMAX);
      }
    }*/
}

void setServoPulse(uint8_t n, double pulse) {
  double pulselength;
  
  pulselength = 1000000;   // 1,000,000 us per second
  pulselength /= SERVO_FREQ;   // Analog servos run at ~60 Hz updates
  //Serial.print(pulselength); Serial.println(" us per period"); 
  pulselength /= 4096;  // 12 bits of resolution
  //Serial.print(pulselength); Serial.println(" us per bit"); 
  pulse *= 1000000;  // convert input seconds to us
  pulse /= pulselength;
  //Serial.println(pulse);
  pwm.setPWM(n, 0, pulse);
}

void checkSensors() {
  int redSensor = digitalRead(RED_SENSOR_PIN);
  int blueSensor = digitalRead(BLUE_SENSOR_PIN);
  if (redSensor == 0 && redSensor != lastRedSensor) {
    redCount++;
  }
  if (blueSensor == 0 && blueSensor != lastBlueSensor) {
    blueCount++;
  }
  lastRedSensor = redSensor;
  lastBlueSensor = blueSensor;
}

void Timer4_ISR()
{
  static unsigned char percent_counter = 0;
  unsigned char i = 0;
  
  for(int i = 0; i<30; i++)
  {
    if(MY.LEDS[i]<= percent_counter) digitalWrite(i+22,LOW); else digitalWrite(i+22,HIGH);
  }
  
  percent_counter++;
  if (percent_counter == 100) percent_counter = 0;
}

void Timer5_ISR()
{
  if(lightMode!=lastLightMode){
    switch(lightMode)
    {
      case RAINBOW_WAVE:
              
        //RED
        MY.PIXEL[0].R = 100;
        MY.PIXEL[0].G = 0;
        MY.PIXEL[0].B = 0;
        PIXEL_STATE[0] = 0;
        
        //YELLOW
        MY.PIXEL[1].R = 50;
        MY.PIXEL[1].G = 50;
        MY.PIXEL[1].B = 0;
        PIXEL_STATE[1] = 0;
        
        //GREEN
        MY.PIXEL[2].R  = 0;
        MY.PIXEL[2].G  = 100;
        MY.PIXEL[2].B  = 0;
        PIXEL_STATE[2] = 1;
        
        // CYAN
        MY.PIXEL[3].R = 0;
        MY.PIXEL[3].G = 50;
        MY.PIXEL[3].B = 50;
        PIXEL_STATE[3] = 1;

        MY.PIXEL[7].R = 0;
        MY.PIXEL[7].G = 0;
        MY.PIXEL[7].B = 0;
        PIXEL_STATE[7]=0;
        
        MY.PIXEL[8].R = 0;
        MY.PIXEL[8].G = 0;
        MY.PIXEL[8].B = 0;
        PIXEL_STATE[8]=2;
        
        MY.PIXEL[9].R = 0;
        MY.PIXEL[9].G = 0;
        MY.PIXEL[9].B = 0;
        PIXEL_STATE[9]=4;
        break;
      case COLOR_BLUE:
        for(int i=0;i<4;i++)
        {
          MY.PIXEL[i].R = 0;
          MY.PIXEL[i].G = 0;
          MY.PIXEL[i].B = 100;
        }
        break;
      case RAINBOW_PULSE:
        for(int i=0;i<10;i++)
        {
          MY.PIXEL[i].R = 0;
          MY.PIXEL[i].G = 0;
          MY.PIXEL[i].B = 0;
          PIXEL_STATE[i] = 0;
        }
        break;
      case COLOR_GREEN:
        for(int i=0;i<4;i++)
        {
          MY.PIXEL[i].R = 0;
          MY.PIXEL[i].G = 100;
          MY.PIXEL[i].B = 0;
        }
        break;
      case COLOR_YELLOW:
        for(int i=0;i<4;i++)
        {
          MY.PIXEL[i].R = 50;
          MY.PIXEL[i].G = 50;
          MY.PIXEL[i].B = 0;
        }
        break;
      case COLOR_RED:
        for(int i=0;i<4;i++)
        {
          MY.PIXEL[i].R = 100;
          MY.PIXEL[i].G = 0;
          MY.PIXEL[i].B = 0;
        }
        break;
      case MATCH_MODE:
        
        break;
      case COLOR_OFF:
        for(int i=0;i<10;i++)
        {
          MY.PIXEL[i].R = 0;
          MY.PIXEL[i].G = 0;
          MY.PIXEL[i].B = 0;
        }
        break;
    }
  }
  if(lightMode==RAINBOW_WAVE)
  {
    for (unsigned char i = 0; i < 4 ; i++)
    {
      cycleLED(i);
    }
    pulseLED(7);
    pulseLED(8);
    pulseLED(9);
  }
  else if(lightMode==RAINBOW_PULSE)
  {
    for (unsigned char i = 0; i < 10 ; i++)
    {
      pulseLED(i);
    }
  }
  else if (lightMode==MATCH_MODE)
  {
    MatchLED();
  }
  lastLightMode=lightMode;
  
//    Serial.print("lighmode:");
//    Serial.print(lightMode);
//    Serial.print("\n");
//    lastLightMode=lightMode;
}

/*void Timer3_ISR()
{
  if(lightMode!=RAINBOW_WAVE && lightMode!=RAINBOW_PULSE && lightMode != COLOR_OFF)
  {
    float z = redAccel->getZ()*RED_SCALE_CALIBRATION;
    float angle = z<0.999?acos(z)*180.0f/3.14159f:0.0f;
    if(angle<5.0f)
    {
      MY.PIXEL[7].R = 0;
      MY.PIXEL[7].B = 0;
      MY.PIXEL[7].G = 100;
    }
    else
    {
      MY.PIXEL[7].R=100;
      MY.PIXEL[7].B=0;
      MY.PIXEL[7].G=0;
    }
    z = blueAccel->getZ()*BLUE_SCALE_CALIBRATION;
    angle = z<0.999?acos(z)*180.0f/3.14159f:0.0f;
    if(angle<5.0f)
    {
      MY.PIXEL[8].R = 0;
      MY.PIXEL[8].B = 0;
      MY.PIXEL[8].G = 100;
    }
    else
    {
      MY.PIXEL[8].R=100;
      MY.PIXEL[8].B=0;
      MY.PIXEL[8].G=0;
    }
    z = coopAccel->getZ()*COOP_SCALE_CALIBRATION;
    angle = z<0.999?acos(z)*180.0f/3.14159f:0.0f;
    if(angle<5.0f)
    {
      MY.PIXEL[9].R = 0;
      MY.PIXEL[9].B = 0;
      MY.PIXEL[9].G = 100;
    }
    else
    {
      MY.PIXEL[9].R=100;
      MY.PIXEL[9].B=0;
      MY.PIXEL[9].G=0;
    }
  }
}*/

void MatchLED() 
{
  if(redCount <= 10) {
      MY.PIXEL[2].R = 0;
      MY.PIXEL[2].G = 100;
      MY.PIXEL[2].B = 0;
      MY.PIXEL[3].R = 0;
      MY.PIXEL[3].G = 100;
      MY.PIXEL[3].B = 0;
    } else if (redCount > 10 && redCount <= 15) {
      MY.PIXEL[2].R = 50;
      MY.PIXEL[2].G = 50;
      MY.PIXEL[2].B = 0;
      MY.PIXEL[3].R = 50;
      MY.PIXEL[3].G = 50;
      MY.PIXEL[3].B = 0;
    }
    else if (redCount >= 20) {
      MY.PIXEL[2].R = 100;
      MY.PIXEL[2].G = 0;
      MY.PIXEL[2].B = 0;
      MY.PIXEL[3].R = 100;
      MY.PIXEL[3].G = 0;
      MY.PIXEL[3].B = 0;
    }

    if(blueCount <= 10) {
      MY.PIXEL[4].R = 0;
      MY.PIXEL[4].G = 100;
      MY.PIXEL[4].B = 0;
      MY.PIXEL[5].R = 0;
      MY.PIXEL[5].G = 100;
      MY.PIXEL[5].B = 0;
    } else if (blueCount > 10 && blueCount <= 15) {
      MY.PIXEL[4].R = 50;
      MY.PIXEL[4].G = 50;
      MY.PIXEL[4].B = 0;
      MY.PIXEL[5].R = 50;
      MY.PIXEL[5].G = 50;
      MY.PIXEL[5].B = 0;
    }
    else if (blueCount >= 20) {
      MY.PIXEL[4].R = 100;
      MY.PIXEL[4].G = 0;
      MY.PIXEL[4].B = 0;
      MY.PIXEL[5].R = 100;
      MY.PIXEL[5].G = 0;
      MY.PIXEL[5].B = 0;
    }
}

void cycleLED(unsigned char index)
{

  //Serial.print("\nTESTING PIN #");Serial.print(index);
  //Serial.print("\nRunning case:");Serial.print(PIXEL_STATE[index]);
  //Serial.print("\nR:");Serial.print(MY.PIXEL[index].R);Serial.print(" G:");Serial.print(MY.PIXEL[index].G);Serial.print(" B:");Serial.print(MY.PIXEL[index].B);
  //Serial.print("\n");
  
  switch (PIXEL_STATE[index])
  {
    case 0:
      MY.PIXEL[index].G = increment_limit(MY.PIXEL[index].G, 1);
      MY.PIXEL[index].R = increment_limit(MY.PIXEL[index].R, -1);
      if (MY.PIXEL[index].R == 0 && MY.PIXEL[index].G == 100)
        PIXEL_STATE[index]++;
      break;

    case 1:
      MY.PIXEL[index].B = increment_limit(MY.PIXEL[index].B, 1);
      MY.PIXEL[index].G = increment_limit(MY.PIXEL[index].G, -1);
      //if(MY.PIXEL[index].B>=50)MY.PIXEL[index].B=50;
      if (MY.PIXEL[index].G == 0 && MY.PIXEL[index].B == 100)
        PIXEL_STATE[index]++;
      break;

    case 2:
      MY.PIXEL[index].R = increment_limit(MY.PIXEL[index].R, 1);
      MY.PIXEL[index].B = increment_limit(MY.PIXEL[index].B, -1);
      //if(MY.PIXEL[index].B>250)MY.PIXEL[index].B=0;
      if (MY.PIXEL[index].B == 0 && MY.PIXEL[index].R==100)
        PIXEL_STATE[index] = 0;
      break;
  }
}

void pulseLED(unsigned char index)
{
//  Serial.print("\nRunning case:");Serial.print(PIXEL_STATE[index]);
//  Serial.print("\nR:");Serial.print(MY.PIXEL[index].R);Serial.print(" G:");Serial.print(MY.PIXEL[index].G);Serial.print(" B:");Serial.print(MY.PIXEL[index].B);
//  Serial.print("\n");
  switch(PIXEL_STATE[index])
  {
  case 0:
    MY.PIXEL[index].R++;
    if(MY.PIXEL[index].R >=100)
      PIXEL_STATE[index]++;
    break;
  case 1:
    MY.PIXEL[index].R--;
    if(MY.PIXEL[index].R <=0)
      PIXEL_STATE[index]++;
    break;
  case 2:
    MY.PIXEL[index].G++;
    if(MY.PIXEL[index].G >=100)
      PIXEL_STATE[index]++;
    break;
  case 3:
    MY.PIXEL[index].G--;
    if(MY.PIXEL[index].G <=0)
      PIXEL_STATE[index]++;
    break;
  case 4:
    MY.PIXEL[index].B++;
    if(MY.PIXEL[index].B >=100)
      PIXEL_STATE[index]++;
    break;
  case 5:
    MY.PIXEL[index].B--;
    if(MY.PIXEL[index].B <=0)
      PIXEL_STATE[index]=0;  
    break;
  }
}

unsigned char increment_limit(unsigned char num, char val)
{
  char ret = num + val;

  if (ret > 100) return 100;
  if (ret < 0) return 0;

  return ret;

}
























// the loop function runs over and over again forever
//void loop() {
 //    Accelerometer Readings
 
//    int x,y,z;   
//    adxl.readAccel(&x, &y, &z);         // Read the accelerometer values and store them in variables declared above x,y,z
//    
//    // Output Results to Serial
//    /* UNCOMMENT TO VIEW X Y Z ACCELEROMETER VALUES */  
//    Serial.print(millis());
//    Serial.print(", ");
//    Serial.print(x);
//    Serial.print(", ");
//    Serial.print(y);
//    Serial.print(", ");
//    Serial.println(z); 


//  char _address = 0x80 | 0x00;
//    Serial.print(millis());
//    Serial.print(", ");
//  //digitalWrite(10, LOW);
//  SPI.transfer(_address);   // Transfer Starting Reg Address To Be Read  
//    Serial.println(SPI.transfer(0x00),HEX);
  //digitalWrite(10, HIGH);

// SPI.transfer(10, 0, SPI_CONTINUE);
//SPI.transfer(10, value);
 
//    
//  
//  digitalWrite(FIELD1_EN_RED, HIGH);       // FIELD 1 RED ENABLE/DISABLE
//  digitalWrite(FIELD1_TELOP_RED, HIGH);       // FIELD 1 RED TELOP/AUTO
//  digitalWrite(FIELD1_EN_BLUE, HIGH);       // FIELD 1 BLUE ENABLE/DISABLE
//  digitalWrite(FIELD1_TELOP_BLUE, HIGH);       // FIELD 1 BLUE TELOP/AUTO
//  digitalWrite(FIELD2_EN_RED, HIGH);      // FIELD 2 RED ENABLE/DISABLE
//  digitalWrite(FIELD2_TELOP_RED, HIGH);      // FIELD 2 RED TELOP/AUTO
//  digitalWrite(FIELD2_EN_BLUE, HIGH);      // FIELD 2 BLUE ENABLE/DISABLE
//  digitalWrite(FIELD2_TELOP_BLUE, HIGH);      // FIELD 2 BLUE TELOP/AUTO
//  
//  delay(1000);                       // wait for a second
//
//  digitalWrite(FIELD1_EN_RED, LOW);       // FIELD 1 RED ENABLE/DISABLE
//  digitalWrite(FIELD1_TELOP_RED, LOW);       // FIELD 1 RED TELOP/AUTO
//  digitalWrite(FIELD1_EN_BLUE, LOW);       // FIELD 1 BLUE ENABLE/DISABLE
//  digitalWrite(FIELD1_TELOP_BLUE, LOW);       // FIELD 1 BLUE TELOP/AUTO
//  digitalWrite(FIELD2_EN_RED, LOW);      // FIELD 2 RED ENABLE/DISABLE
//  digitalWrite(FIELD2_TELOP_RED, LOW);      // FIELD 2 RED TELOP/AUTO
//  digitalWrite(FIELD2_EN_BLUE, LOW);      // FIELD 2 BLUE ENABLE/DISABLE
//  digitalWrite(FIELD2_TELOP_BLUE, LOW);      // FIELD 2 BLUE TELOP/AUTO
//  
//  delay(1000);                       // wait for a second

//  Serial.print(millis()); Serial.print(" \r\n");
//  Serial.print(analogRead(A0)); Serial.print(" ");
//  Serial.print(analogRead(A1)); Serial.print(" ");
//  Serial.print(analogRead(A2)); Serial.print(" ");
//  Serial.print(analogRead(A3)); Serial.print(" ");
//  Serial.print(analogRead(A4)); Serial.print(" ");
//  Serial.print(analogRead(A5)); Serial.print(" ");
//  Serial.print(analogRead(A6)); Serial.print(" ");
//  Serial.print(analogRead(A7)); Serial.print(" ");
//  Serial.print(analogRead(A8)); Serial.print(" ");
//  Serial.print(analogRead(A9)); Serial.print(" ");
//  Serial.print(analogRead(A10)); Serial.print(" ");
//  Serial.print(analogRead(A11)); Serial.print("\r\n");
//}
