echo "INFO, test carrier_eeprom"

echo "INFO, Scanning for EEPROM"
for i2c_add in 57 5f; do
  found=`i2cdetect -y 9 | grep " $i2c_add "`
  if [ -z "$found" ]; then
    echo "FAIL, Device 0x$i2c_add NOT found"
    #exit 1
  else
    echo "PASS, Device 0x$i2c_add found"
  fi
done

#quick read/write to ensure WP not asserted
