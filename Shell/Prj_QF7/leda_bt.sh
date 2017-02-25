echo "INFO, test leda_bt"

bt_high_power=ff
bt_low_power=f7

usb_bluetooth="ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle (HCI mode)"

found=`lsusb | grep "$usb_bluetooth"`
if [ -z "$found" ]
then
  echo "FAIL, Bluetooth Device NOT found"
  exit
else
  echo "PASS, Bluetooth Device found"
fi

#enable bluetooth
rfkill unblock bluetooth
hciconfig hci0 up

echo "INFO, High Power Bluetooth Mode"

#set high power antenna mode
isaset -y -f 0x286 0x$bt_high_power

#advertise beacon, maybe random ID and check
va=`shuf -i 1-100 -n 1`
vb=`shuf -i 1-100 -n 1`
hcitool -i hci0 cmd 0x08 0x0006 a0 00 a0 00 03 00 00 00 00 00 00 00 00 07 00
hcitool -i hci0 cmd 0x08 0x0008 1E 02 01 1A 1A FF 4C 00 02 15 $va $vb 57 A2 82 28 44 CD 91 3A 94 A1 22 BA 12 06 00 01 00 02 D1 00
hcitool -i hci0 cmd 0x08 0x000a 01

echo "INPT, Please Enter first 2 digits of Beacon"
read beacon_id
if [ "$beacon_id" = "$va" ]; then
  echo "INPT, Please measure signal strength and enter below"
  read signal_strength
  echo "PASS, Bluetooth detected with strength $signal_strength"
else
  echo "FAIL, Beacon ID did not match"
fi

#set low power antenna mode
isaset -y -f 0x286 0x$bt_low_power

#advertise beacon, maybe random ID and check
va=`shuf -i 1-100 -n 1`
vb=`shuf -i 1-100 -n 1`
hcitool -i hci0 cmd 0x08 0x0006 a0 00 a0 00 03 00 00 00 00 00 00 00 00 07 00
hcitool -i hci0 cmd 0x08 0x0008 1E 02 01 1A 1A FF 4C 00 02 15 $va $vb 57 A2 82 28 44 CD 91 3A 94 A1 22 BA 12 06 00 01 00 02 D1 00
hcitool -i hci0 cmd 0x08 0x000a 01

echo "INPT, Please Enter first 2 digits of Beacon"
read beacon_id
if [ "$beacon_id" = "$va" ]; then
  echo "INPT, Please measure signal strength and enter below"
  read signal_strength
  echo "PASS, Bluetooth detected with strength $signal_strength"
else
  echo "FAIL, Beacon ID did not match"
fi

#disable bluetooth
rfkill block bluetooth
