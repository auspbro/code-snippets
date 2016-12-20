echo "INFO, test carrier_hda_detect"

audio_device=ALC298

found=`dmesg | grep "$audio_device"`
if [ -z "$found" ]
then
  echo "FAIL, $audio_device Device NOT found"
else
  echo "PASS, $audio_device Device found"
fi
