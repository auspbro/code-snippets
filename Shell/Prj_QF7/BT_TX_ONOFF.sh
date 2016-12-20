pwr="$1"
echo "Power $pwr"

usage()
{
echo "Enter  ON/OFF"
}

if [ "$pwr" == "ON" ]; then

rfkill unblock all
hciconfig hci0 up
hcitool cmd 0x08 0x001e 0x00 0x25 0x00

elif [ "$pwr" == "OFF" ]; then
hcitool cmd 0x08 0x001f
rfkill unblock all
elif [ "$pwr" == "BRCST" ]; then
rfkill unblock all
hciconfig hci0 up
hcitool -i hci0 cmd 0x08 0x0008 15 02 01 1a 11 07 41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e 4f 50 00 00 00 00 00 00 00 00 00 00
hciconfig hci0 leadv
./../../../usr/libexec/bluetooth/bluetoothd &
else
usage
fi
