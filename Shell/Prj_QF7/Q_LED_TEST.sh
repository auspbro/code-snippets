#pass board to test (leda, ledb)
if [ "$1" = "leda" ]; then
  mux_channel=01
else
  if [ "$1" = "ledb" ]; then
    mux_channel=02
  else
    echo "FAIL, invalid board specified"
    exit
  fi
fi

echo "INFO, test ledx_led"
echo "INFO, PCA is $1"

i2c_add_mux=72

vf_limit_high=3100
vf_limit_low=1000

v_3v3_limit_high=3500
v_3v3_limit_low=3100

v_4v5_limit_high=4600
v_4v5_limit_low=4400

pwm=0xff
current=0x64    #0x19 (2.5mA), 0x32 (5mA), 0x64 (10mA)

echo "INFO, Scanning for I2C Mux"
i2c_add=72
found=`i2cdetect -y 9 | grep " $i2c_add "`
if [ -z "$found" ]
then
  echo "FAIL, Device 0x$i2c_add NOT found"
  exit
else
  echo "PASS, Device 0x$i2c_add found"
fi
#set mux
i2cset -y 9 0x$i2c_add_mux 0x$mux_channel c

#make sure both banks of LEDs are active
isaset -y -f 0x29e 0x00

#set all LEDs to white
for i2c_add in 0x32 0x33 0x34 0x35; do
  #chip enable
  i2cset -y 9 $i2c_add 0x00 0x40
  #select internal clock and put charge pump into bypass
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
done

echo "INPT, Are all LEDs White? (y/n)..."
read result

if [ "$result" = "y" ]; then
  echo "PASS, Visual check of White LEDs"
else
  echo "FAIL, Visual check of White LEDs"
  exit
fi

#Charge Pump enabled
for i2c_add in 32 33 34 35; do
  i2cset -y 9 0x$i2c_add 0x36 0x51
  data=af
  #measure ADC channel
  i2cset -y 9 0x$i2c_add 0x41 0x$data    
  v_raw=`i2cget -y 9 0x$i2c_add 0x42`
  v_dec=$((0x${v_raw:2}))
  v_mv=$((v_dec * 30 - 1478))
  if [ "$v_mv" -lt "$v_4v5_limit_high" ]; then
    if [ "$v_mv" -gt "$v_4v5_limit_low" ]; then
      echo "PASS, VOUT_CP, Dev 0x$i2c_add mV, $v_mv"
    else
      echo "FAIL, VOUT_CP too low, Dev 0x$i2c_add mV, $v_mv"
    fi
  else
    echo "FAIL, VOUT_CP too high, Dev 0x$i2c_add mV, $v_mv"
  fi
done

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
        fi
      else
        echo "FAIL, LED Vf too high, Bank $bank, Dev 0x$i2c_add, LED $data, possible open circuit"
      fi
    done
  done
done
read result
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

#Charge Pump enabled
for i2c_add in 32 33 34 35; do
  i2cset -y 9 0x$i2c_add 0x36 0x51
  data=af
  #measure ADC channel
  i2cset -y 9 0x$i2c_add 0x41 0x$data    
  v_raw=`i2cget -y 9 0x$i2c_add 0x42`
  v_dec=$((0x${v_raw:2}))
  v_mv=$((v_dec * 30 - 1478))
  if [ "$v_mv" -lt "$v_4v5_limit_high" ]; then
    if [ "$v_mv" -gt "$v_4v5_limit_low" ]; then
      echo "PASS, VOUT_CP, Dev 0x$i2c_add mV, $v_mv"
    else
      echo "FAIL, VOUT_CP too low, Dev 0x$i2c_add mV, $v_mv"
    fi
  else
    echo "FAIL, VOUT_CP too high, Dev 0x$i2c_add mV, $v_mv"
  fi
done

#reset devices
for i2c_add in 32 33 34 35; do
  i2cset -y 9 0x$i2c_add 0x3d 0xff
done
#return CPLD to original state
#make sure both banks of LEDs are active
isaset -y -f 0x29e 0x00

