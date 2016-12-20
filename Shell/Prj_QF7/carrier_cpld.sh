echo "INFO, test carrier_cpld"

cpld_id="fa ce"
cpld_version="05"
hw_rev="10" #0x<pcb revision><assembly revision>

echo "INFO, Verifying CPLD is present"
cpld=`isadump -y -f 0x280 0x10 | grep "0280: $cpld_id"`
if [ -z "$cpld" ]; then
  echo "FAIL, Could not communicate with CPLD"
else
  echo "PASS, CPLD found"
fi

echo "INFO, Verifying CPLD version"
cpld=`isadump -y -f 0x282 0x10 | grep "0282: $cpld_version"`
if [ -z "$cpld" ]; then
  echo "FAIL, Incorrect CPLD version, expected 0x$cpld_version"
else
  echo "PASS, Correct CPLD version, 0x$cpld_version"
fi

echo "INFO, Checking Hardware Revision"
cpld=`isadump -y -f 0x283 0x10 | grep "0283: $hw_rev"`
if [ -z "$cpld" ]; then
  echo "FAIL, Incorrect Hardware version, 0x$hw_rev"
else
  echo "PASS, Correct Hardware version, 0x$hw_rev"
fi
