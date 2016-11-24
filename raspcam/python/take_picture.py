import time
from picamera import PiCamera
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.IN, GPIO.PUD_UP)

camera = PiCamera()
camera.start_preview()
camera.rotation = 180
print('Camera initialized...')
print('Waiting for the falling edge of the GPIO 17')
GPIO.wait_for_edge(17, GPIO.FALLING)
camera.capture('/home/pi/raspcam/img/img.jpg')
camera.stop_preview()
print('Picture taken!')
