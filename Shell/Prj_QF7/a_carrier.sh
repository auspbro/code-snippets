echo "INFO, test PCA carrier"

#firmware version checks
./carrier_bios.sh
read keyboard
./carrier_cpld.sh
read keyboard
./carrier_tpm.sh
read keyboard

#i2c device scan
./carrier_i2c_detect.sh
read keyboard
./carrier_touch.sh
read keyboard

#i2c devices
./carrier_bmc150.sh
read keyboard
./carrier_eeprom.sh
read keyboard
./carrier_tmp108.sh
read keyboard

#ethernet interfaces
./carrier_eth_pri.sh
read keyboard
./carrier_eth_sec.sh
read keyboard

#audio devices
./carrier_hda_detect.sh
read keyboard
./carrier_usb_audio.sh
read keyboard
./carrier_speaker.sh
read keyboard
./carrier_dmic.sh
read keyboard

./carrier_health.sh
read keyboard

#Display tests
./carrier_hdmi.sh
read keyboard
./carrier_lcd.sh
read keyboard
./carrier_backlight.sh
read keyboard
./carrier_lcd_off.sh