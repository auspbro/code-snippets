echo "INFO, test carrier_firmware"

bios_expected="61117T01"
resolution_expected="1200x1920"
cpld_expected="05"

#found=`dmesg | grep $bios_expected`
found=`dmidecode | grep $bios_expected`
if [ -z "$found" ]
then
  echo "FAIL, BIOS $bios_expected NOT found, please upgrade"
  #exit 1
else
  echo "PASS, BIOS $bios_expected found"
fi

found=`xrandr -d :0.0 | grep $resolution_expected`
if [ -z "$found" ]
then
  echo "FAIL, xrandr $resolution_expected NOT found, please upgrade"
  #exit 1
else
  echo "PASS, xrandr $resolution_expected found"
fi
