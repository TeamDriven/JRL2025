//******************************************************************************
/*! \file		globals.h
    \brief		Global variables that are used throughout the code.
    \date		05/07/2012
*/
//******************************************************************************
#ifndef __GLOBALS_H
#define __GLOBALS_H

#define ENABLE_PIN 8
#define TELE_PIN 9
#define RED_SENSOR_PIN A0
#define BLUE_SENSOR_PIN A2

#define SERVO_OE 5
#define SERVO_ON digitalWrite(SERVO_OE,LOW)
#define SERVO_OFF digitalWrite(SERVO_OE,HIGH)

#define RTS_PIN 24
#define RTS_HIGH digitalWrite(RTS_PIN,HIGH);
#define RTS_LOW digitalWrite(RTS_PIN,LOW);

#define BUFFER_CLEAR_TIME 2000



#define R1E A0
#define R1F A1
#define R2E A2
#define R2F A3
#define R3E A4
#define R3F A5
#define B1E A6
#define B1F A7
#define B2E A8
#define B2F A9
#define B3E A10
#define B3F A11

int bluePollenCount = 0;
int blueLevitateCount = 0;
int redPollenCount = 0;
int redLevitateCount = 0;
int redHighPollenCount = 0;
int blueHighPollenCount = 0;
short blueFrenzyFlag = 0;
short redFrenzyFlag = 0;
int last_vals[16] = {1,};
int counts[16] = {0,};
int sensor_pins[16] = {R1E,
                R1F,
                R2E,
                R2F,
                R3E,
                R3F,
                B1E,
                B1F,
                B2E,
                B2F,
                B3E,
                B3F,
                0,
                0,
                0,
                0};

typedef enum{
  RAINBOW_WAVE=0,
  RAINBOW_PULSE=1,
  COLOR_BLUE=2,
  COLOR_GREEN=3,
  COLOR_YELLOW=4,
  COLOR_RED=5,
  COLOR_OFF=6,
  MATCH_MODE=7,
  }LightMode;

  LightMode lightMode;
  LightMode lastLightMode;

typedef struct {
  volatile unsigned char G;
  volatile unsigned char R;
  volatile unsigned char B;
} pixel;

unsigned char PIXEL_STATE[10];

volatile union
{
  unsigned char LEDS[30];
  pixel PIXEL[10];

} MY;

const int BUFFLENGTH = 40;
String commandBuffer = "";

int bufferCounter = 0;
int redCount = 0;
int blueCount = 0;
int lastRedSensor = 0;
int lastBlueSensor = 0;
bool blueFlytrap_open = false;
bool redFlytrap_open = false;
bool flytraps_enabled = false;
long blueFlytrapTime = 0;
long redFlytrapTime = 0;

// called this way, it uses the default address 0x40
Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver();
#define SERVOMIN  225 // This is the 'minimum' pulse length count (out of 4096)
#define SERVOMAX  400 // This is the 'maximum' pulse length count (out of 4096)
#define SERVO_FREQ 60 // Analog servos run at ~60 Hz updates
int loopCounter = 0;

#endif
