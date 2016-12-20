echo "INFO, test als_tmp108"
item="$1"
usage()
{
echo "Enter  ALS_TMP_I2C/ALS_TMP_TEMPERATURE"
}
rm Q_ALS_TMP.txt

i2c_add=4b
t_limit_low=15
t_limit_high=40

if [ "$item" == "ALS_TMP_I2C" ]; then
echo "INFO, Scanning for TMP108"
found=`i2cdetect -y 9 | grep " $i2c_add "`
if [ -z "$found" ]; then
  echo "FAIL, Device 0x$i2c_add NOT found"
  echo ALS_TMP_I2C=FAIL >> Q_ALS_TMP.txt
  exit 1
else
  echo "PASS, Device 0x$i2c_add found"
  echo ALS_TMP_I2C=PASS >> Q_ALS_TMP.txt
fi

elif [ "$item" == "ALS_TMP_TEMPERATURE" ]; then

#read temperature
t_raw=`i2cget -y 9 0x$i2c_add 0x00`
t_dec=$((0x${t_raw:2}))

if [ "$t_dec" -lt "$t_limit_high" ]; then
  if [ "$t_dec" -gt "$t_limit_low" ]; then
    echo "PASS, TMP108 at $i2c_add IN spec degC, $t_dec"
    echo ALS_TMP_TEMPERATURE=PASS >> Q_ALS_TMP.txt
  else
    echo "FAIL, TMP108 at $i2c_add too low degC, $t_dec"
    echo ALS_TMP_TEMPERATURE=FAIL >> Q_ALS_TMP.txt
  fi
else
  echo "FAIL, TMP108 at $i2c_add too high degC, $t_dec"
  echo ALS_TMP_TEMPERATURE=FAIL >> Q_ALS_TMP.txt
fi

else
usage
fi
