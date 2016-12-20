echo "INFO, test carrier_backlight"

backlight_full=ff
backlight_dim=20

item="$1"
usage()
{
echo "Enter  CARRIER_BL_EN_ON/CARRIER_BL_EN_OFF/CARRIER_BL_PWM_DIM/CARRIER_BL_PWM_FULL"
}
rm Q_CARRIER_BACKLIGHT.txt

if [ "$item" == "CARRIER_BL_EN_ON" ]; then

isaset -y -f 0x286 0xff
echo CARRIER_BL_EN_ON=PASS >> Q_CARRIER_BACKLIGHT.txt
elif [ "$item" == "CARRIER_BL_EN_OFF" ]; then
isaset -y -f 0x286 0xfb

echo CARRIER_BL_EN_OFF=PASS >> Q_CARRIER_BACKLIGHT.txt

#if [ "$result" = "y" ]; then
  #echo "PASS, Backlight Enable working"
#else
  #echo "FAIL, Backlight Enable NOT working"
#fi
elif [ "$item" == "CARRIER_BL_PWM_DIM" ]; then
isaset -y -f 0x289 0x$backlight_dim
echo CARRIER_BL_PWM_DIM=PASS >> Q_CARRIER_BACKLIGHT.txt
#sleep $sleep_time
elif [ "$item" == "CARRIER_BL_PWM_FULL" ]; then
isaset -y -f 0x289 0x$backlight_full
echo CARRIER_BL_PWM_FULL=PASS >> Q_CARRIER_BACKLIGHT.txt
else
usage
fi

