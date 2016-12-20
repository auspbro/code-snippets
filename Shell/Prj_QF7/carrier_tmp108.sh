echo "INFO, test carrier_tmp108"

thresh_low=15
thresh_high=50

echo "INFO, Scanning for TMP108"
for i2c_add in 48 4a; do
  found=`i2cdetect -y 9 | grep " $i2c_add "`
  if [ -z "$found" ]; then
    echo "FAIL, Device 0x$i2c_add NOT found"
    #exit 1
  else
    echo "PASS, Device 0x$i2c_add found"
  fi
done

#read temperature
for i2c_add in 48 4a; do
  t_raw=`i2cget -y 9 0x$i2c_add 0x00`
  t_dec=$((0x${t_raw:2}))
  if [ "$t_dec" -lt "$thresh_high" ]; then
    if [ "$t_dec" -gt "$thresh_low" ]; then
      echo "PASS, Temp of device $i2c_add IN spec, degC $t_dec"
    fi
  else
    echo "FAIL, Temp of device $i2c_add OUT of spec, degC $t_dec"
  fi
done
