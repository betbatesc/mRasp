#!/bin/sh

# Bash uses BCM GPIO numbers (i.e. the pin names of the Broadcom Chip itself)
# These are detailed in the Raspberry Pi wiki pages
# Therefore to make life easier I will map them to the Raspberry Pi GPIO
PIN12=12
PIN16=16
PIN18=18
PIN22=22

# Setup Pins
LED01=$PIN12
LED_RED=$PIN16
LED_BLUE=$PIN18
LED_GREEN=$PIN22

#Setup Active states
# Common Cathode RGB-LEDs (Cathode-Active Low)
LED_ENABLE=0
LED_DISABLE=1
RGB_ENABLE=1
RGB_DISABLE=0

# Set up GPIO to Outputs
# Set up GPIO Pin, to output and put in disable state
echo "$LED01" > /sys/class/gpio/export
echo "$LED_RED" > /sys/class/gpio/export
echo "$LED_BLUE" > /sys/class/gpio/export
echo "$LED_GREEN" > /sys/class/gpio/export

echo "out" > /sys/class/gpio/gpio$LED01/direction
echo "out" > /sys/class/gpio/gpio$LED_RED/direction
echo "out" > /sys/class/gpio/gpio$LED_BLUE/direction
echo "out" > /sys/class/gpio/gpio$LED_GREEN/direction

echo "$LED_DISABLE" > /sys/class/gpio/gpio$LED01/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_RED/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_BLUE/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_GREEN/value

#####################################################
# Setup End

# Switch on LED with RED
echo "$LED_ENABLE" > /sys/class/gpio/gpio$LED01/value
echo "$RGB_ENABLE" > /sys/class/gpio/gpio$LED_RED/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_BLUE/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_GREEN/value

# Wait
sleep 1s

# Switch on LED with BLUE
echo "$LED_ENABLE" > /sys/class/gpio/gpio$LED01/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_RED/value
echo "$RGB_ENABLE" > /sys/class/gpio/gpio$LED_BLUE/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_GREEN/value

# Wait
sleep 1s

# Switch on LED with GREEN
echo "$LED_ENABLE" > /sys/class/gpio/gpio$LED01/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_RED/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_BLUE/value
echo "$RGB_ENABLE" > /sys/class/gpio/gpio$LED_GREEN/value

# Wait
sleep 1s

# Switch each LED off
echo "$LED_DISABLE" > /sys/class/gpio/gpio$LED01/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_RED/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_BLUE/value
echo "$RGB_DISABLE" > /sys/class/gpio/gpio$LED_GREEN/value

#####################################################
# Clean up
echo "$LED01" > /sys/class/gpio/unexport
echo "$LED_RED" > /sys/class/gpio/unexport
echo "$LED_BLUE" > /sys/class/gpio/unexport
echo "$LED_GREEN" > /sys/class/gpio/unexport
# End
