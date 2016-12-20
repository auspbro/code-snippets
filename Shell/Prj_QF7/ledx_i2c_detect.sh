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

echo "INFO, test ledx_i2c_detect for pca $1"

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
i2cset -y 9 0x$i2c_add $mux_channel c

echo "INFO, Scanning for LED Drivers"
for i2c_add in 32 33 34 35; do
  found=`i2cdetect -y 9 | grep " $i2c_add "`
  if [ -z "$found" ]
  then
    echo "FAIL, Device 0x$i2c_add NOT found"
    exit
  else
    echo "PASS, Device 0x$i2c_add found"
  fi
done
