
#input $1 as upgrade bin file

echo "INFO, test cfg_carrier_spi"
spi_select="$1"
rm CARRIER_QSEVEN_BIOS.txt
rm /home/root/$2
cp /run/media/sdb1/$2 /home/root


if [ -f /home/root/$2 ]; then
  echo "Bin alive"
  
else
	echo BIOS_BIN=FAIL >> CARRIER_QSEVEN_BIOS.txt
  exit 1
fi

usage()
{
echo "Enter  carrier 61117T01.bin/qseven 61117T01.bin"
}


#spi ID
spi_qseven="W25Q64.W"
spi_carrier="W25Q64.V"

#value to put into isa register 0x284
spi_val_qseven="00"
spi_val_carrier="80"

isa_reg_spi=284
isa_reg_action=285

#echo "Enter SPI device to configure, carrier or qseven"
#read spi_select

if [ "$spi_select" = "carrier" ]; then
  spi=$spi_carrier
  spi_val=$spi_val_carrier
else
  if [ "$spi_select" = "qseven" ]; then
    spi=$spi_qseven
    spi_val=$spi_val_qseven
  else
    echo "FAIL, Invalid SPI"
    usage
    exit 1
  fi
fi

#select spi and set action register to change
isaset -y -f 0x$isa_reg_spi 0x$spi_val
action=`isadump -y -f 0x$isa_reg_action 0x10 | grep $isa_reg_action`
action=${action:6:2}
isaset -y -f 0x$isa_reg_action 0x$action
sleep 1
#check spi ID is correct
found=`flashrom -p internal:laptop=this_is_not_a_laptop | grep $spi`
echo
if [ -z "$found" ]; then
  echo "FAIL, $spi_select SPI device $spi NOT found and identified"
  if [ "$spi_select" == "carrier" ]; then
  	echo CARRIER_BIOS_UPGRADE=FAIL >> CARRIER_QSEVEN_BIOS.txt
  else [ "$spi_select" == "qseven" ];
  	echo QSEVEN_BIOS_UPGRADE=FAIL >> CARRIER_QSEVEN_BIOS.txt	
  fi
  exit 1
else
  echo "PASS, $spi_select SPI device $spi found and identified"
  
fi
echo

#upgrade SPI
flashrom -p internal:laptop=this_is_not_a_laptop -w /home/root/$2

  if [ "$spi_select" == "carrier" ]; then
  	echo CARRIER_BIOS_UPGRADE=PASS >> CARRIER_QSEVEN_BIOS.txt
  else [ "$spi_select" == "qseven" ];
  	echo QSEVEN_BIOS_UPGRADE=PASS >> CARRIER_QSEVEN_BIOS.txt	
  fi

