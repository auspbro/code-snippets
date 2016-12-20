echo "INFO, test als_als"
item="$1"
usage()
{
echo "Enter  ALS_I2C/ALS_BL/ALS_LL"
}

i2c_add=44
thresh_low=20
thresh_bright=100
rm Q_ALS.txt

if [ "$item" == "ALS_I2C" ]; then
echo "INFO, Scanning for ALS"
found=`i2cdetect -y 9 | grep " $i2c_add "`
if [ -z "$found" ]; then
  echo "FAIL, Device 0x$i2c_add NOT found"
  echo ALS_I2C=FAIL >> Q_ALS.txt
  exit 1
else
  echo "PASS, Device 0x$i2c_add found"
  echo ALS_I2C=PASS >> Q_ALS.txt
fi

#set mode to ALS continuous
i2cset -y 9 0x$i2c_add 0x00 0xa0

echo "INFO, Reading Bright Light"
echo "INPT, Please set ambient light to bright (press any key to continue)..."
#read keyboard

elif [ "$item" == "ALS_BL" ]; then
#read data
value=`i2cget -y 9 0x$i2c_add 0x03`
value_dec=$((0x${value:2}))
if [ "$value_dec" -gt "$thresh_bright" ]; then
  echo "PASS, Bright Light detected, $value_dec"
  echo ALS_BL=PASS >> Q_ALS.txt
else
  echo "FAIL, Bright Light NOT detected, $value_dec"
  echo ALS_BL=FAIL >> Q_ALS.txt
fi

echo "INFO, Reading Low Light"
echo "INPT, Please set ambient light to low (press any key to continue)..."
#read keyboard

elif [ "$item" == "ALS_LL" ]; then
#read data
value=`i2cget -y 9 0x$i2c_add 0x02`
value_dec=$((0x${value:2}))
if [ "$value_dec" -lt "$thresh_low" ]; then
  echo "PASS, Low Light detected, $value_dec"
  echo ALS_LL=PASS >> Q_ALS.txt
else
  echo "FAIL, Low Light NOT detected, $value_dec"
  echo ALS_LL=FAIL >> Q_ALS.txt
fi

else
usage
fi
