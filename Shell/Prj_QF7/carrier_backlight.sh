echo "INFO, test carrier_backlight"

backlight_full=ff
backlight_dim=20

echo "INPT, About to turn backlight off for 1 second, press Enter to continue..."
read keyboard
isaset -y -f 0x286 0xfb
sleep 1
isaset -y -f 0x286 0xff
echo "INPT, Did backlight turn off? (y/n)..."
read result

if [ "$result" = "y" ]; then
  echo "PASS, Backlight Enable working"
else
  echo "FAIL, Backlight Enable NOT working"
fi

echo "INPT, About to dim backlight for 1 second, press Enter to continue..."
read keyboard
isaset -y -f 0x289 0x$backlight_dim
sleep 1
isaset -y -f 0x289 0x$backlight_full
echo "INPT, Did backlight dim? (y/n)..."
read result

if [ "$result" = "y" ]; then
  echo "PASS, Backlight PWM working"
else
  echo "FAIL, Backlight PWM NOT working"
fi

#add CPLD backlight VMON
