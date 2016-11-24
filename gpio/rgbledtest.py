#!/usr/bin/python
import time
import RPi.GPIO as GPIO

# RGB LED Module (Test)

LED_ENABLE = 0
LED_DISABLE = 1
RGB_ENABLE = 1
RGB_DISABLE = 0

# LED CONFIG - Set GPIO Ports
LED1 = 12

RGB_RED = 16
RGB_BLUE = 18
RGB_GREEN = 22

RGB = [RGB_RED, RGB_BLUE, RGB_GREEN]

def led_setup():
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(LED1, GPIO.OUT)
	for val in RGB:
		GPIO.setup(val, GPIO.OUT)
		
def led_activate(led, colour) :
	GPIO.output(led, LED_ENABLE)
	GPIO.output(colour, RGB_ENABLE)
	
def led_desactivate(led, colour) :
	GPIO.output(led, LED_DISABLE)
	GPIO.output(colour, RGB_DISABLE)

def led_clear():
	GPIO.output(LED1, LED_DISABLE)
	for val in RGB:
		GPIO.output(val, RGB_DISABLE)
		
if __name__ == '__main__':
	led_setup()
	led_clear()
	
	led_activate(LED1, RGB_RED)
	time.sleep(1)
	led_desactivate(LED1, RGB_RED)
	
	led_activate(LED1, RGB_BLUE)
	time.sleep(1)
	led_desactivate(LED1, RGB_BLUE)
	
	led_activate(LED1, RGB_GREEN)
	time.sleep(1)
	led_desactivate(LED1, RGB_GREEN)	
