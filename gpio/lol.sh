PIN12=22
LED=$PIN12

LED_ENABLE=1
LED_DISABLE=0

echo "$LED" > /sys/class/gpio/export

echo "out" > /sys/class/gpio/gpio$LED/direction

echo "$LED_DISABLE" > /sys/class/gpio/gpio$LED/value

echo "$LED_ENABLE" > /sys/class/gpio/gpio$LED/value

echo "Led enabled..."

sleep 5s

echo "Led disabled..."

echo "$LED_DISABLE" > /sys/class/gpio/gpio$LED/value

echo "$LED" > /sys/class/gpio/unexport


