echo "INFO, test carrier_tpm"

tpm_part="TPM vendor: SLB9665"
tpm_version="0x5003300083200"
item="$1"
usage()
{
echo "Enter  CARRIER_TPM_PART/CARRIER_TPM_FW_V/CARRIER_TPM_PCR"
}
rm Q_CARRIER_TPM.txt

if [ "$item" == "CARRIER_TPM_PART" ]; then
echo "INFO, Verifying TPM part number"
tpm=`test_tpm20_get_info | grep "$tpm_part"`
if [ -z "$tpm" ]
then
  echo "FAIL, Incorrect TPM Part found"
  echo CARRIER_TPM_PART=FAIL >> Q_CARRIER_TPM.txt
else
  echo "PASS, $tpm found"
  echo CARRIER_TPM_PART=PASS >> Q_CARRIER_TPM.txt
fi
elif [ "$item" == "CARRIER_TPM_FW_V" ]; then
echo "INFO, Verifying TPM firmware version"
tpm=`test_tpm20_get_info | grep "$tpm_version"`
if [ -z "$tpm" ]
then
  echo "FAIL, Incorrect firmware version found"
  echo CARRIER_TPM_FW_V=FAIL >> Q_CARRIER_TPM.txt
else
  echo "PASS, $tpm found"
  echo CARRIER_TPM_FW_V=PASS >> Q_CARRIER_TPM.txt
fi
elif [ "$item" == "CARRIER_TPM_PCR" ]; then
echo "INFO, Verifying PCR read"
tpm=`tpm2_listpcrs -g 0x0b | grep PCR_00`
if [ -z "$tpm" ]
then
  echo "FAIL, TPM NOT found"
  echo CARRIER_TPM_PCR=FAIL >> Q_CARRIER_TPM.txt
else
  echo "PASS, TPM found and PCR_00 read"
  echo CARRIER_TPM_PCR=PASS >> Q_CARRIER_TPM.txt
fi
else
usage
fi

