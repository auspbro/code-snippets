echo "INFO, test carrier_dmic"

audio_file=test_recording
channel="$1"
usage()
{
echo "Enter  left_rec/left_rec_play/right_rec/right_rec_play"
}
rm Q_CARRIER_DMIC.txt

found=`arecord -l | grep "card 0: CX20921"`
if [ -z "$found" ]; then
  hw_dev="hw:1,0"
else
  hw_dev="hw:0,0"
fi

if [ "$channel" == "left_rec" ]; then
  arecord -q -c 2 -f S16_LE -r 16000 -d 2 -D $hw_dev /home/root/data/"$audio_file".wav
  echo CARRIER_DMIC_LEFT=PASS >>Q_CARRIER_DMIC.txt
elif [ "$channel" == "right_rec" ]; then
  arecord -q -c 2 -f S16_LE -r 16000 -d 2 -D $hw_dev /home/root/data/"$audio_file".wav
  echo CARRIER_DMIC_RIGHT=PASS >>Q_CARRIER_DMIC.txt
elif [ "$channel" == "left_rec_play" ]; then 
  aplay -q -c 2 -f S16_LE -r 16000 /home/root/data/"$audio_file".wav
  echo CARRIER_DMIC_L_PLAY=PASS >>Q_CARRIER_DMIC.txt
  rm /home/root/data/"$audio_file".wav
elif [ "$channel" == "right_rec_play" ]; then 
  aplay -q -c 2 -f S16_LE -r 16000 /home/root/data/"$audio_file".wav
  echo CARRIER_DMIC_R_PLAY=PASS >>Q_CARRIER_DMIC.txt
  rm /home/root/data/"$audio_file".wav
else
usage
fi

