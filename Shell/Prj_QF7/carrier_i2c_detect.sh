echo "INFO, test carrier_i2c_detect"

#touch panel excluded from this test as not located on the carrier
#instead included in separate test carrier_touch

for i2c_add in 10 12 40 41 48 4a 57 5f 68
do
  found=`i2cdetect -y 9 | grep " $i2c_add "`
  if [ -z "$found" ]; then
    echo "FAIL, Device 0x$i2c_add NOT found"
    #exit 1
  else
    echo "PASS, Device 0x$i2c_add found"
  fi
done
