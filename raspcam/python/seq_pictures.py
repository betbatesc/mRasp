from picamera import PiCamera
import time

camera = PiCamera()

camera.start_preview()
camera.rotation = 180

for i in range(9):
	time.sleep(5)
	camera.capture('/home/pi/raspcam/img/image%s.jpg' % i)

camera.stop_preview()
