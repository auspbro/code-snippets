#input $1 as mac address XX:XX:XX:XX:XX:XX UPPER CASE
mac=$1
echo "INFO, test cfg_bt_mac"
rm Q_BTMAC.txt
#check $1 is not null
if [ -z "$1" ]; then
  echo "FAIL, no mac address supplied"
  echo "INFO, mac address should be XX:XX:XX:XX:XX:XX with UPPER CASE"
  exit 1
fi

#mac address is entered in a different order in bccmd
#mac is 11:22:33:44:55:66
#bccmd -d hci0 psset -s 0 bdaddr 0x44 0x00 0x66 0x55 0x33 0x00 0x22 0x11
mac1=${mac:0:2}
mac2=${mac:2:2}
mac3=${mac:4:2}
mac4=${mac:6:2}
mac5=${mac:8:2}
mac6=${mac:10:2}
compare_mac="$mac1:$mac2:$mac3:$mac4:$mac5:$mac6"
echo "$compare_mac"
#enable bluetooth device
rfkill unblock bluetooth
hciconfig hci0 up

#set mac address
bccmd -d hci0 psset -s 0 bdaddr 0x$mac4 0x00 0x$mac6 0x$mac5 0x$mac3 0x00 0x$mac2 0x$mac1

#reset device
bccmd -d hci0 warmreset

sleep 1

#check BT Address
found=`hciconfig hci0 | grep $compare_mac`
if [ -z "$found" ]; then
  echo "FAIL, BT Address not set correctly, $mac expected"
  echo BTMAC_Write=FAIL >> Q_BTMAC.txt 
 #exit 1
else
  echo "PASS, BT Address set correctly, $mac"
  echo BTMAC_Write=PASS >> Q_BTMAC.txt
fi

