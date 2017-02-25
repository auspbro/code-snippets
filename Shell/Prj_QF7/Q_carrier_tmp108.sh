echo "INFO, test carrier_tmp108"

thresh_low=15
thresh_high=50
item="$1"
i2c_add="$2"
usage()
{
echo "Enter  CARRIER_TMP_I2C 48 or 4a /CARRIER_TMP_TEMPERATURE 48 or 4a"
}
rm Q_CARRIER_TMP.txt

if [ "$item" == "CARRIER_TMP_I2C" ]; then
echo "INFO, Scanning for TMP108"
#for i2c_add in 48 4a; do
  found=`i2cdetect -y 9 | grep " $i2c_add "`
  if [ -z "$found" ]; then
    echo "FAIL, Device 0x$i2c_add NOT found"
    if [ "$i2c_add" == "48" ]; then
    echo CARRIER_TMP_I2C_48=FAIL >> Q_CARRIER_TMP.txt
    elif [ "$i2c_add" == "4a" ]; then
    echo CARRIER_TMP_I2C_4a=FAIL >> Q_CARRIER_TMP.txt
    else
    usage
    fi
    #exit 1
  else
    echo "PASS, Device 0x$i2c_add found"
    if [ "$i2c_add" == "48" ]; then
    echo CARRIER_TMP_I2C_48=PASS >> Q_CARRIER_TMP.txt
    elif [ "$i2c_add" == "4a" ]; then
    echo CARRIER_TMP_I2C_4a=PASS >> Q_CARRIER_TMP.txt
    else
    usage
    fi
  fi
#done
elif [ "$item" == "CARRIER_TMP_TEMPERATURE" ]; then
#read temperature
#for i2c_add in 48 4a; do
  t_raw=`i2cget -y 9 0x$i2c_add 0x00`
  t_dec=$((0x${t_raw:2}))
  if [ "$t_dec" -lt "$thresh_high" ]; then
    if [ "$t_dec" -gt "$thresh_low" ]; then
      echo "PASS, Temp of device $i2c_add IN spec, degC $t_dec"
      if [ "$i2c_add" == "48" ]; then
    	echo CARRIER_TMP_TEMPERATURE_48=PASS >> Q_CARRIER_TMP.txt
    	elif [ "$i2c_add" == "4a" ]; then
    	echo CARRIER_TMP_TEMPERATURE_4a=PASS >> Q_CARRIER_TMP.txt
    	else
      usage
    	fi
    fi
  else
    echo "FAIL, Temp of device $i2c_add OUT of spec, degC $t_dec"
    if [ "$i2c_add" == "48" ]; then
    	echo CARRIER_TMP_TEMPERATURE_48=FAIL >> Q_CARRIER_TMP.txt
    	elif [ "$i2c_add" == "4a" ]; then
    	echo CARRIER_TMP_TEMPERATURE_4a=FAIL >> Q_CARRIER_TMP.txt
    	else
      usage
    fi
  fi
#done

else
usage
fi

