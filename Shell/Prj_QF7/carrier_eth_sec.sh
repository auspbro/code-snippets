echo "INFO, test carrier_eth_sec"

device="eth1"
pcie="03:00.0"

found=`lspci | grep "$pcie Ethernet controller: Intel Corporation I210 Gigabit Network Connection (rev 03)"`
if [ -z "$found" ]; then
  echo "FAIL, Device $device NOT found, check firmware has been written"
  #exit 1
else
  echo "SUCCESS,  Device $device found"
fi

speed=`cat /sys/class/net/$device/speed`
duplex=`cat /sys/class/net/$device/duplex`

if [ $speed == "1000" ]; then
  echo "PASS, Speed of $device is $speed"
else
  echo "FAIL, Speed of $device is $speed"
fi

if [ $duplex == "full" ]; then
  echo "PASS, Duplex of $device is $duplex"
else
  echo "FAIL, Duplex of $device is $duplex"
fi

#mac_add=ifconfig | grep "MAC:"
#echo "INFO, MAC Address of $device is $mac_add"
