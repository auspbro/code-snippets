echo "INFO, test carrier_i2c_detect"

#touch panel excluded from this test as not located on the carrier
#instead included in separate test carrier_touch
i2c_add="$1"
usage()
{
echo "Enter i2c address [10/12/40/41/48/4a/57/5f/68]"
}
rm Q_CARRIER_I2C_DETECT.txt
#for i2c_add in 10 12 40 41 48 4a 57 5f 68
#do

found=`i2cdetect -y 9 | grep " $i2c_add "`
  if [ -z "$found" ]; then
    echo "FAIL, Device 0x$i2c_add NOT found"
    if [ "$i2c_add" == "10" ]; then
    echo CARRIER_I2C_DET_BMC150_G=FAIL >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "12" ]; then
    echo CARRIER_I2C_DET_BMC150_M=FAIL >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "40" ]; then
    echo CARRIER_I2C_DET_INA230=FAIL >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "41" ]; then
    echo CARRIER_I2C_DET_CX20921=FAIL >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "48" ]; then
    echo CARRIER_I2C_DET_TMP_48=FAIL >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "4a" ]; then
    echo CARRIER_I2C_DET_TMP_4a=FAIL >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "57" ]; then
    echo CARRIER_I2C_DET_EEPROM_57=FAIL >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "5f" ]; then
    echo CARRIER_I2C_DET_EEPROM_5f=FAIL >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "68" ]; then
    echo CARRIER_I2C_DET_MIPI=FAIL >> Q_CARRIER_I2C_DETECT.txt
    else
		usage
		fi
    #exit 1
  else
    echo "PASS, Device 0x$i2c_add found"
    if [ "$i2c_add" == "10" ]; then
    echo CARRIER_I2C_DET_BMC150_G=PASS >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "12" ]; then
    echo CARRIER_I2C_DET_BMC150_M=PASS >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "40" ]; then
    echo CARRIER_I2C_DET_INA230=PASS >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "41" ]; then
    echo CARRIER_I2C_DET_CX20921=PASS >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "48" ]; then
    echo CARRIER_I2C_DET_TMP_48=PASS >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "4a" ]; then
    echo CARRIER_I2C_DET_TMP_4a=PASS >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "57" ]; then
    echo CARRIER_I2C_DET_EEPROM_57=PASS >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "5f" ]; then
    echo CARRIER_I2C_DET_EEPROM_5f=PASS >> Q_CARRIER_I2C_DETECT.txt
    elif [ "$i2c_add" == "68" ]; then
    echo CARRIER_I2C_DET_MIPI=PASS >> Q_CARRIER_I2C_DETECT.txt
    else
		usage
		fi
  fi
#done

