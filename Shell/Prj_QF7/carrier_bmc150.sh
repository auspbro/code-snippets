echo "INFO, test carrier_bmc150"

echo "INFO, Scanning for BMC150"
for i2c_add in 10 12; do
  found=`i2cdetect -y 9 | grep " $i2c_add "`
  if [ -z "$found" ]; then
    echo "FAIL, Device 0x$i2c_add NOT found"
    #exit 1
  else
    echo "PASS, Device 0x$i2c_add found"
  fi
done

#test interrupt signal
