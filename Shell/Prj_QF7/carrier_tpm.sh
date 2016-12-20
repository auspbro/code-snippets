echo "INFO, test carrier_tpm"

tpm_part="TPM vendor: SLB9665"
tpm_version="0x5003300083200"

echo "INFO, Verifying TPM part number"
tpm=`test_tpm20_get_info | grep "$tpm_part"`
if [ -z "$tpm" ]
then
  echo "FAIL, Incorrect TPM Part found"
else
  echo "PASS, $tpm found"
fi

echo "INFO, Verifying TPM firmware version"
tpm=`test_tpm20_get_info | grep "$tpm_version"`
if [ -z "$tpm" ]
then
  echo "FAIL, Incorrect firmware version found"
else
  echo "PASS, $tpm found"
fi

echo "INFO, Verifying PCR read"
tpm=`tpm2_listpcrs -g 0x0b | grep PCR_00`
if [ -z "$tpm" ]
then
  echo "FAIL, TPM NOT found"
else
  echo "PASS, TPM found and PCR_00 read"
fi
