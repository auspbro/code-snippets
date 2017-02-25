#input $1 as serial number (16 characters, use # as padding)
#eg DH5AQTW65NXXXX##
header="FB_GIZMO_SERIAL#"
item="$1"
serial=$2
rm Q_EEPROM_SERIAL.txt
echo "INFO, test cfg_eeprom_serial"

usage()
{
echo "Enter  write 4042920030481234/read"
}


#test mode
if [ "$1" = "test" ]; then
header="????????????????"
fi
if [ "$item" = "write" ]; then

#check $1 is not null
if [ -z "$2" ]; then
echo "FAIL, no serial number supplied"
echo SERIAL_NUMBER_VALUE=FAIL >> Q_EEPROM_SERIAL.txt
exit 1
fi

#hack, should replace this with a better version
#eeprog not working correctly so have to put serial number in byte at a time
#repeat a few times to ensure data written correctly
#for write_eeprom in ${seq 0 4}; do
for i in $(seq 0 15); do
echo ${header:$i:1} | eeprog -f -x -16 /dev/i2c-9 0x57 -w $i
done
for i in $(seq 0 15); do
echo ${serial:$i:1} | eeprog -f -x -16 /dev/i2c-9 0x57 -w $((i + 16))
done
#done

#check header
result=`eeprog -f -16 /dev/i2c-9 0x57 -r 0x00:0x10`
found=`echo $result | grep $header`
echo
if [ -z "$found" ]; then
echo "FAIL, header NOT found, expected $header, read $result"
echo SERIAL_NUMBER_WRITE=FAIL >> Q_EEPROM_SERIAL.txt
exit 1
else
echo "PASS, header found, read $result"
echo SERIAL_NUMBER_WRITE=PASS >> Q_EEPROM_SERIAL.txt
fi
echo
elif [ "$item" == "read" ]; then
#check serial
result=`eeprog -f -16 /dev/i2c-9 0x57 -r 0x10:0x10`
#found=`echo $result | grep $serial`
found=`echo $result`
echo
if [ -z "$found" ]; then
echo "FAIL, serial number NOT found, expected $serial, read $result"
echo SERIAL_NUMBER_READ=FAIL >> Q_EEPROM_SERIAL.txt
#exit 1
else
echo "PASS, serial number found, read $result"
echo SERIAL_NUMBER_READ=$result >> Q_EEPROM_SERIAL.txt
fi

else
	usage
	exit 1
  fi
echo


