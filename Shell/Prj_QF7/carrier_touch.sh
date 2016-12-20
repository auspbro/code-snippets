echo "INFO, test carrier_touch"

i2c_add=38

found=`i2cdetect -y 9 | grep " $i2c_add "`
if [ -z "$found" ]; then
  echo "FAIL, Device 0x$i2c_add NOT found"
  #exit 1
else
  echo "PASS, Device 0x$i2c_add found"
fi

echo "INFO, Loading touchscreen drivers, please wait..."

#load touch screen drivers
modprobe gizmohw

echo "INPT, Is touch screen working? (y/n)..."
read result
if [ "$result" = "y" ]; then
  echo "PASS, Touchscreen working"
else
  echo "FAIL, Touchscreen NOT working"
fi

#unload touch screen drivers
modprobe -r gizmohw
