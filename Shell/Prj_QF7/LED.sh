
pwm="$1"
current="$2"
color="$3"

echo "$pwm"
echo "$current"
echo "$color"

usage()
{
echo "Enter current 0xFF 0x64 R/G/B/O/W"
echo "R Red"
echo "G Green"
echo "B Blue"
echo "O Off"
echo "W White"
}



for mux_output in 0x01 0x02; do

i2cset -y 9 0x72 $mux_output c

for i2c_add in 0x32 0x33 0x34 0x35; do

#select internal clock and but charge pump into bypass
i2cset -y 9 $i2c_add 0x36 0x49
#pwm setting
for reg in 0x16 0x17 0x18 0x19 0x1A 0x1B 0x1C 0x1D 0x1E; do
i2cset -y 9 $i2c_add $reg $pwm
done
#current setting
for reg in 0x26 0x27 0x28 0x29 0x2A 0x2B 0x2C 0x2D 0x2E; do
i2cset -y 9 $i2c_add $reg $current
done
#turn on all LEDs
i2cset -y 9 $i2c_add 0x04 0x01
i2cset -y 9 $i2c_add 0x05 0xFF
#chip enable
i2cset -y 9 $i2c_add 0x00 0x40

done

done

#Green
if [ "$color" == "G" ]; then
for mux_output in 0x01 0x02; do
i2cset -y 9 0x72 $mux_output c
for i2c_add in 0x32 0x33 0x34 0x35; do
i2cset -y 9 $i2c_add 0x04 0x00
i2cset -y 9 $i2c_add 0x05 0x38
done
done

elif [ "$color" == "R" ]; then
#Red
for mux_output in 0x01 0x02; do
i2cset -y 9 0x72 $mux_output c
for i2c_add in 0x32 0x33 0x34 0x35; do
i2cset -y 9 $i2c_add 0x04 0x01
i2cset -y 9 $i2c_add 0x05 0xC0
done
done

elif [ "$color" == "B" ]; then
#Blue
for mux_output in 0x01 0x02; do
i2cset -y 9 0x72 $mux_output c
for i2c_add in 0x32 0x33 0x34 0x35; do
i2cset -y 9 $i2c_add 0x04 0x00
i2cset -y 9 $i2c_add 0x05 0x07
done
done

elif [ "$color" == "Y" ]; then
#Yellow
for mux_output in 0x01 0x02; do
i2cset -y 9 0x72 $mux_output c
for i2c_add in 0x32 0x33 0x34 0x35; do
i2cset -y 9 $i2c_add 0x04 0x01
i2cset -y 9 $i2c_add 0x05 0xF8
done
done


elif [ "$color" == "O" ]; then
#Off
for mux_output in 0x01 0x02; do
i2cset -y 9 0x72 $mux_output c
for i2c_add in 0x32 0x33 0x34 0x35; do
i2cset -y 9 $i2c_add 0x04 0x00
i2cset -y 9 $i2c_add 0x05 0x00
done
done
elif [ "$color" == "W" ]; then
#White
for mux_output in 0x01 0x02; do
i2cset -y 9 0x72 $mux_output c
for i2c_add in 0x32 0x33 0x34 0x35; do
i2cset -y 9 $i2c_add 0x04 0x01
i2cset -y 9 $i2c_add 0x05 0xFF
done
done
else
usage
fi

