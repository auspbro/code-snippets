
echo "INFO, test carrier_spi"

#BIOS versions
bios_qseven="$2"
bios_carrier="$2"

usage()
{
echo "Enter  CARRIER 61117T01 /QSEVEN 61117T01"
}
#BIOS version
bios_header="Portwell, Inc. PQ7-M107"
bios_filename="/home/root/data/bios.spi"

#spi ID
spi_qseven="W25Q64.W"
spi_carrier="W25Q64.V"
select="$1"
rm BIOS_$select.txt
#value to put into isa register 0x284
spi_val_qseven="00"
spi_val_carrier="80"

#CPLD registers
isa_reg_spi=284
isa_reg_action=285

#select carrier BIOS then QSeven BIOS
#for spi_select in carrier qseven; do
  if [ "$select" = "CARRIER" ]; then
    spi=$spi_carrier
    spi_val=$spi_val_carrier
    bios_expected=$bios_carrier
  elif [ "$select" == "QSEVEN" ]; then
    spi=$spi_qseven
    spi_val=$spi_val_qseven
    bios_expected=$bios_qseven
  else
	usage
	exit 1
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
    #exit 1
  else
    echo "PASS, $spi_select SPI device $spi found and identified"
  fi
  echo

  #dump flash to local file
  flashrom -p internal:laptop=this_is_not_a_laptop -r $bios_filename
  found=`cat $bios_filename | grep $bios_expected`
  echo
  if [ -z "$found" ]
  then
    found=`cat $bios_filename | grep $bios_header`
    echo "FAIL, BIOS $bios_expected NOT found on $spi_select device"
    echo BIOS_VERSION_$select$bios_expected=FAIL >> BIOS_$select.txt
    echo "INFO, $found"
    #exit 1
  else
    echo "PASS, BIOS $bios_expected found on $spi_select device"
    echo BIOS_VERSION_$select$bios_expected=PASS >> BIOS_$select.txt
  fi
  echo
  rm $bios_filename
  
#done

