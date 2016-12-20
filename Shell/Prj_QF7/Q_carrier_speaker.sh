echo "INFO, test carrier_speaker"
#mixer set Master 65536
audio_file=noise_1s

channel="$1"
usage()
{
echo "Enter  left / right"
}
rm Q_CARRIER_SPEAKER.txt

if [ "$channel" == "left" ]; then
  aplay -q -c 2 -f S16_LE -r 44100 /home/root/data/"$audio_file"_"$channel".wav
  echo CARRIER_SPEAKER_LEFT=PASS >>Q_CARRIER_SPEAKER.txt
elif [ "$channel" == "right" ]; then
  aplay -q -c 2 -f S16_LE -r 44100 /home/root/data/"$audio_file"_"$channel".wav
  echo CARRIER_SPEAKER_RIGHT=PASS >>Q_CARRIER_SPEAKER.txt
else
usage
fi
