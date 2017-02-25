echo "INFO, test carrier_usb_audio"

usb_audio="0572:1494 Conexant Systems (Rockwell), Inc."

found=`lsusb | grep "$usb_audio"`
if [ -z "$found" ]
then
  echo "FAIL, USB Audio Device NOT found"
else
  echo "PASS, USB Audio Device found"
fi
