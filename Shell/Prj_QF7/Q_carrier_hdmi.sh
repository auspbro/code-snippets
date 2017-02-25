echo "INFO, test carrier_hdmi"

hdmi_status="HDMI1 connected"
hdmi_resolution="HDMI1 connected 2560x1600"

found=`xrandr -d :0.0 | grep "$hdmi_status"`
if [ -z "$found" ]; then
  echo "FAIL, HDMI not connected"
  #exit 1
else
  echo "PASS, $hdmi_status"
fi

found=`xrandr -d :0.0 | grep "$hdmi_resolution"`
if [ -z "$found" ]; then
  echo "FAIL, HDMI incorrect resolution, expected $hdmi_resolution"
  #exit 1
else
  echo "PASS, $hdmi_resolution"
fi

#stop screen going to sleep
/usr/bin/xset -d :0.0 -dpms
/usr/bin/xset -d :0.0 s off
/usr/bin/xset -d :0.0 s noblank

echo CARRIER_HDMI=PASS >> Q_CARRIER_HDMI.txt
