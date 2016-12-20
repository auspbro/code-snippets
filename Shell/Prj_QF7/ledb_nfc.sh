echo "INFO, test ledb_nfc"

i2c_add=28

#set mux to ledb
i2cset -y 9 0x72 0x02 c

#need to run i2cdetect twice to wake device then identify
found=`i2cdetect -y 9`
found=`i2cdetect -y 9 | grep " $i2c_add "`
if [ -z "$found" ]
then
  echo "FAIL, Device 0x$i2c_add NOT found"
  #exit 1
else
  echo "PASS, Device 0x$i2c_add found"
fi
