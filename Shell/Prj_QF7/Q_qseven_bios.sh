echo "INFO, test carrier_firmware"

#bios_expected="61117T01"
bios_expected="$1"
resolution_expected="1200x1920"
cpld_expected="05"
rm Q_QSEVEN_BIOS.txt
#found=`dmesg | grep $bios_expected`
found=`dmidecode | grep $bios_expected`
if [ -z "$found" ]
then
  echo "FAIL, BIOS $bios_expected NOT found, please upgrade"
  echo QSEVEN_BIOS_VERSION_$bios_expected=FAIL >> Q_QSEVEN_BIOS.txt
  #exit 1
else
  echo "PASS, BIOS $bios_expected found"
  echo QSEVEN_BIOS_VERSION_$bios_expected=PASS >> Q_QSEVEN_BIOS.txt
fi

found=`xrandr -d :0.0 | grep $resolution_expected`
if [ -z "$found" ]
then
  echo "FAIL, xrandr $resolution_expected NOT found, please upgrade"
  #exit 1
else
  echo "PASS, xrandr $resolution_expected found"
fi

