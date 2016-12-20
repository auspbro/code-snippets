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

echo "INFO, test ledx_health for pca $1"

t_limit_high=35
t_limit_low=15

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
i2cset -y 9 0x$i2c_add 0x$mux_channel c

for i2c_add in 32 33 34 35; do
  #chip enable
  i2cset -y 9 0x$i2c_add 0x00 0x40
  #trigger temperature measurement
  i2cset -y 9 0x$i2c_add 0x3e 0x06
  #read temperature
  t_raw=`i2cget -y 9 0x$i2c_add 0x3f`
  t_dec=$((0x${t_raw:2}))
  if [ "$t_dec" -lt "$t_limit_high" ]; then
    if [ "$t_dec" -gt "$t_limit_low" ]; then
      echo "PASS, LP55231 at $i2c_add IN spec degC, $t_dec"
    else
      echo "FAIL, LP55231 at $i2c_add too low degC, $t_dec"
    fi
  else
    echo "FAIL, LP55231 at $i2c_add too high degC, $t_dec"
  fi
  #reset device
  i2cset -y 9 0x$i2c_add 0x3d 0xff
done
