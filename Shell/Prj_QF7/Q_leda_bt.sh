echo "INFO, test leda_bt"

item="$1"
echo "Power $pwr"

usage()
{
echo "Enter  BT_DEVICE/BT_HIGHT_PWR/BT_LOW_PWR/BT_OFF"
}
rm Q_LEDA_BT.txt

bt_high_power=ff
bt_low_power=f7

usb_bluetooth="ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle (HCI mode)"

if [ "$item" == "BT_DEVICE" ]; then
found=`lsusb | grep "$usb_bluetooth"`
if [ -z "$found" ]
then
  echo "FAIL, Bluetooth Device NOT found"
  echo BT_DEVICE=FAIL >> Q_LEDA_BT.txt
  exit
else
  echo "PASS, Bluetooth Device found"
  echo BT_DEVICE=PASS >> Q_LEDA_BT.txt
fi

#enable bluetooth
rfkill unblock bluetooth
hciconfig hci0 up

elif [ "$item" == "BT_HIGHT_PWR" ]; then
echo "INFO, High Power Bluetooth Mode"

#set high power antenna mode
isaset -y -f 0x286 0x$bt_high_power

#advertise beacon, maybe random ID and check
va=`shuf -i 1-100 -n 1`
vb=`shuf -i 1-100 -n 1`
hcitool -i hci0 cmd 0x08 0x0006 a0 00 a0 00 03 00 00 00 00 00 00 00 00 07 00
hcitool -i hci0 cmd 0x08 0x0008 1E 02 01 1A 1A FF 4C 00 02 15 $va $vb 57 A2 82 28 44 CD 91 3A 94 A1 22 BA 12 06 00 01 00 02 D1 00
hcitool -i hci0 cmd 0x08 0x000a 01
echo BT_HIGHT_PWR=PASS >> Q_LEDA_BT.txt

elif [ "$item" == "BT_LOW_PWR" ]; then
#set low power antenna mode
isaset -y -f 0x286 0x$bt_low_power

#advertise beacon, maybe random ID and check
va=`shuf -i 1-100 -n 1`
vb=`shuf -i 1-100 -n 1`
hcitool -i hci0 cmd 0x08 0x0006 a0 00 a0 00 03 00 00 00 00 00 00 00 00 07 00
hcitool -i hci0 cmd 0x08 0x0008 1E 02 01 1A 1A FF 4C 00 02 15 $va $vb 57 A2 82 28 44 CD 91 3A 94 A1 22 BA 12 06 00 01 00 02 D1 00
hcitool -i hci0 cmd 0x08 0x000a 01

echo BT_LOW_PWR=PASS >> Q_LEDA_BT.txt

#disable bluetooth
elif [ "$item" == "BT_OFF" ]; then
hcitool cmd 0x08 0x001f
rfkill block bluetooth
echo BT_OFF=PASS >> Q_LEDA_BT.txt

else
usage
fi

