#!/usr/bin/python
import time
import RPi.GPIO as GPIO

LED_ENABLE = 1
LED_DISABLE = 0

PIN12 = 22
LED1 = PIN12

def led_setup():
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(LED1, GPIO.OUT)

def turn_on(led):
	GPIO.output(led, LED_ENABLE)

def turn_off(led):
	GPIO.output(led, LED_DISABLE)


if __name__ == '__main__':

	led_setup()
	
	print("Let's see what the hell...")

	while True:
		turn_on(LED1)
		time.sleep(1)
		turn_off(LED1)
		time.sleep(1)
