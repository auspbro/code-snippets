echo "INFO, test carrier_init"

#reset DSI bridge
isaset -y -f 0x287 0x20
isaset -y -f 0x287 0x00

#disable internal display
xrandr -d :0.0 --output eDP1 --off

#disable monitor sleep states
#stop screen going to sleep
/usr/bin/xset -d :0.0 -dpms
/usr/bin/xset -d :0.0 s off
/usr/bin/xset -d :0.0 s noblank

#unload gizmo drivers
modprobe -r gizmohw

chmod 777 /home/root/Q_als_als.sh
chmod 777 /home/root/Q_als_tmp108.sh
chmod 777 /home/root/Q_BT_TX_ONOFF.sh
chmod 777 /home/root/Q_carrier_backlight.sh
chmod 777 /home/root/Q_carrier_cpld.sh
chmod 777 /home/root/Q_carrier_dmic.sh
chmod 777 /home/root/Q_carrier_eth_mac_read.sh
chmod 777 /home/root/Q_carrier_eth_pri.sh
chmod 777 /home/root/Q_carrier_eth_sec.sh
chmod 777 /home/root/Q_carrier_hdmi.sh
chmod 777 /home/root/Q_carrier_health.sh
chmod 777 /home/root/Q_carrier_i2c_detect.sh
chmod 777 /home/root/Q_carrier_lcd.sh
chmod 777 /home/root/Q_carrier_speaker.sh
chmod 777 /home/root/Q_carrier_spi.sh
chmod 777 /home/root/Q_carrier_tmp108.sh
chmod 777 /home/root/Q_carrier_touch.sh
chmod 777 /home/root/Q_carrier_tpm.sh
chmod 777 /home/root/Q_carrier_usb_audio.sh
chmod 777 /home/root/Q_cfg_bt_mac.sh
chmod 777 /home/root/Q_cfg_carrier_spi.sh
chmod 777 /home/root/Q_cfg_eeprom_serial.sh
chmod 777 /home/root/Q_LED.sh
chmod 777 /home/root/Q_leda_bt.sh
chmod 777 /home/root/Q_qseven_bios.sh
chmod 777 /home/root/Q_USB_check.sh
mixer set Master 65536


