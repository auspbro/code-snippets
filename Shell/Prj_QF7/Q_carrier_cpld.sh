echo "INFO, test carrier_cpld"

item="$1"
usage()
{
echo "Enter  CARRIER_CPLD_PRESENT/CARRIER_CPLD_VERSION/CARRIER_HW_VERSION"
}
rm Q_CARRIER_CPLD.txt

cpld_id="fa ce"
cpld_version="05"
hw_rev="10" #0x<pcb revision><assembly revision>
if [ "$item" == "CARRIER_CPLD_PRESENT" ]; then
echo "INFO, Verifying CPLD is present"
cpld=`isadump -y -f 0x280 0x10 | grep "0280: $cpld_id"`
if [ -z "$cpld" ]; then
  echo "FAIL, Could not communicate with CPLD"
  echo CARRIER_CPLD_PRESENT=FAIL >> Q_CARRIER_CPLD.txt
else
  echo "PASS, CPLD found"
  echo CARRIER_CPLD_PRESENT=PASS >> Q_CARRIER_CPLD.txt
fi
elif [ "$item" == "CARRIER_CPLD_VERSION" ]; then
echo "INFO, Verifying CPLD version"
cpld=`isadump -y -f 0x282 0x10 | grep "0282: $cpld_version"`
if [ -z "$cpld" ]; then
  echo "FAIL, Incorrect CPLD version, expected 0x$cpld_version"
  echo CARRIER_CPLD_VERSION=FAIL >> Q_CARRIER_CPLD.txt
else
  echo "PASS, Correct CPLD version, 0x$cpld_version"
  echo CARRIER_CPLD_VERSION=PASS >> Q_CARRIER_CPLD.txt
fi
elif [ "$item" == "CARRIER_HW_VERSION" ]; then
echo "INFO, Checking Hardware Revision"
cpld=`isadump -y -f 0x283 0x10 | grep "0283: $hw_rev"`
if [ -z "$cpld" ]; then
  echo "FAIL, Incorrect Hardware version, 0x$hw_rev"
  echo CARRIER_HW_VERSION=FAIL >> Q_CARRIER_CPLD.txt
else
  echo "PASS, Correct Hardware version, 0x$hw_rev"
  echo CARRIER_HW_VERSION=PASS >> Q_CARRIER_CPLD.txt
fi

else
usage
fi
