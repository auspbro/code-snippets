echo "INFO, test carrier_speaker"

audio_file=noise_1s

for channel in left right; do
  echo "INPT, About to test $channel channel, press Enter to continue..."
  read keyboard
  aplay -q -c 2 -f S16_LE -r 44100 data/"$audio_file"_"$channel".wav
  echo "INPT, Did $channel channel play sound, y/n..."
  read result
  if [ "$result" = "y" ]; then
    echo "PASS, Speaker $channel channel working"
  else
    echo "FAIL, Speaker $channel channel NOT working"
  fi
done
