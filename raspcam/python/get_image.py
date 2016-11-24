from picamera import PiCamera
import time

camera = PiCamera()

camera.start_preview()
#camera.rotation = 180
time.sleep(10)
camera.capture('/home/pi/raspcam/img/ElFeo.jpg')
camera.stop_preview()
