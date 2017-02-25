echo "INFO, test USB Check"

rm Q_CARRIER_USB.txt
cat /run/media/sdb1/Q_USB.txt

found=`cat /run/media/sdb1/Q_USB.txt | grep "PASS"`
if [ -z "$found" ]; then
  echo USB_CHECK=FAIL >> Q_CARRIER_USB.txt
  #exit 1
else
  echo USB_CHECK=PASS >> Q_CARRIER_USB.txt
fi
