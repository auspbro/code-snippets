echo "INFO, test carrier_dmic"

audio_file=test_recording

found=`arecord -l | grep "card 0: CX20921"`
if [ -z "$found" ]; then
  hw_dev="hw:1,0"
else
  hw_dev="hw:0,0"
fi

for channel in left right; do
  echo "INPT, Begin tapping $channel DMIC, press Enter to continue..."
  read keyboard
  arecord -q -c 2 -f S16_LE -r 16000 -d 2 -D $hw_dev data/"$audio_file".wav
  echo "INPT, Audio captured, press Enter to playback..."
  read keyboard
  aplay -q -c 2 -f S16_LE -r 16000 data/"$audio_file".wav
  echo "INPT, Is tapping audible, y/n..."
  read result
  if [ "$result" = "y" ]; then
    echo "PASS, DMIC $channel channel working"
  else
    echo "FAIL, DMIC $channel channel NOT working"
  fi
  rm data/"$audio_file".wav
done
