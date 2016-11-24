from picamera import PiCamera
import time

camera = PiCamera()
camera.start_preview()
camera.rotation = 180
camera.start_recording('/home/pi/raspcam/video/video.h264')
time.sleep(10)
camera.stop_recording()
camera.stop_preview()
