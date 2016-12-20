echo "INFO, test carrier_usb_audio"

usb_audio="0572:1494 Conexant Systems (Rockwell), Inc."
rm Q_CARRIER_USB_AUDIO.txt

found=`lsusb | grep "$usb_audio"`
if [ -z "$found" ]
then
  echo "FAIL, USB Audio Device NOT found"
  echo CARRIER_USB_AUDIO=FAIL >> Q_CARRIER_USB_AUDIO.txt
else
  echo "PASS, USB Audio Device found"
  echo CARRIER_USB_AUDIO=PASS >> Q_CARRIER_USB_AUDIO.txt
fi

