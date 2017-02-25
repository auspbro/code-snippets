

pwm="$1"
current="$2"
color="$3"

echo "$pwm"
echo "$current"
echo "$color"
file_name="$4"
usage()
{
echo "Enter current 0xFF 0x64 R/G/B/O/W"
echo "R Red"
echo "G Green"
echo "B Blue"
echo "O Off"
echo "W White"
}

vf_limit_high=4000
vf_limit_low=1000

v_3v3_limit_high=3500
v_3v3_limit_low=3100

v_4v5_limit_high=4600
v_4v5_limit_low=4400

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
elif [ "$color" == "VF" ]; then

for mux_output in 0x01 0x02; do
i2cset -y 9 0x72 $mux_output c
#Read voltages for both banks of LEDs separately
for bank in 01 02; do
  isaset -y -f 0x29e 0x$bank
  #Measure LED voltages
  for i2c_add in 32 33 34 35; do
    for data in a0 a1 a2 a3 a4 a5 a6 a7 a8; do
      #measure ADC channel
      i2cset -y 9 0x$i2c_add 0x41 0x$data
      v_raw=`i2cget -y 9 0x$i2c_add 0x42`
      v_dec=$((0x${v_raw:2}))
      v_mv=$((v_dec * 30 - 1478))
      if [ "$v_mv" -lt "$vf_limit_high" ]; then
        if [ "$v_mv" -gt "$vf_limit_low" ]; then
          echo "PASS, Vf, Bank $bank, Dev 0x$i2c_add, LED $data, IN spec mV, $v_mv"
        else
          echo "FAIL, LED Vf too low, Bank $bank, Dev 0x$i2c_add, LED $data, possible short circuit"
          echo VF_LOW=PASS >> Q_LCD_DETECT.txt
        fi
      else
        echo "FAIL, LED Vf too high, Bank $bank, Dev 0x$i2c_add, LED $data, possible open circuit"
      fi
    done
  done
done
done
isaset -y -f 0x29e 0x00
elif [ "$color" == "DCP" ]; then
#Charge Pump disabled
for i2c_add in 32 33 34 35; do
  i2cset -y 9 0x$i2c_add 0x36 0x49
  data=af
  #measure ADC channel
  i2cset -y 9 0x$i2c_add 0x41 0x$data
  v_raw=`i2cget -y 9 0x$i2c_add 0x42`
  v_dec=$((0x${v_raw:2}))
  v_mv=$((v_dec * 30 - 1478))
  if [ "$v_mv" -lt "$v_3v3_limit_high" ]; then
    if [ "$v_mv" -gt "$v_3v3_limit_low" ]; then
      echo "PASS, VOUT, Dev 0x$i2c_add mV, $v_mv"
    else
      echo "FAIL, VOUT too low, Dev 0x$i2c_add mV, $v_mv"
    fi
  else
    echo "FAIL, VOUT too high, Dev 0x$i2c_add mV, $v_mv"
  fi
done

elif [ "$color" == "VSV" ]; then
#VDD Supply Voltage
for i2c_add in 32 33 34 35; do
  data=b0
  #measure ADC channel
  i2cset -y 9 0x$i2c_add 0x41 0x$data
  v_raw=`i2cget -y 9 0x$i2c_add 0x42`
  v_dec=$((0x${v_raw:2}))
  v_mv=$((v_dec * 30 - 1478))
  if [ "$v_mv" -lt "$v_3v3_limit_high" ]; then
    if [ "$v_mv" -gt "$v_3v3_limit_low" ]; then
      echo "PASS, VDD, Dev 0x$i2c_add mV, $v_mv"
    else
      echo "FAIL, VDD too low, Dev 0x$i2c_add mV, $v_mv"
    fi
  else
    echo "FAIL, VDD too high, Dev 0x$i2c_add mV, $v_mv"
  fi
done


else
usage
fi


