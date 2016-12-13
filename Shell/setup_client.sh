#!/bin/sh
echo "Installing openssh-server..."
apt-get -y -q install openssh-server
echo 
echo
echo "Installing vim..."
apt-get -y -q install vim 
echo
echo
echo "Installing expect..."
apt-get -y -q install expect
echo
echo
echo "Installing g++..."
apt-get -y -q install g++ 
echo
echo
echo "Installing libboost-dev..."
apt-get -y -q install libboost-dev 
echo
echo
echo "Installing libssh-dev..."
apt-get -y -q install libssl-dev
echo
echo
echo "Installing cgbd..."
apt-get -y -q install cgdb
echo
echo
echo "Installing subversion..."
apt-get -y -q install subversion
echo
echo
echo "Installing fop..."
apt-get -y -q install fop
echo
echo
echo "Installing patch..."
apt-get -y -q install patch
echo
echo
echo "Installing xsltproc..."
apt-get -y -q install xsltproc
echo
echo
echo "Removing friendly-recovery..."
apt-get -y -q remove friendly-recovery
echo
echo
## install mingw build env
#echo "Downloading mswin-mingw-4.5.4-amd64.deb..."
##wget http://svn.amd.com/files/gpg/mswin-mingw-4.5.4-amd64.deb
#wget http://diag-buildserver64/system/mswin-mingw-4.5.4-amd64.deb
#echo
#echo "Installing mswin-mingw-4.5.4-amd64.deb..."
#dpkg --install mswin-mingw-4.5.4-amd64.deb
#echo
#echo
echo "Installing librpc-xml-perl..."
apt-get -y -q install librpc-xml-perl
echo
echo

# update toolchain
echo "Installing nfs-common..."
apt-get -y -q install nfs-common

echo "Writing configration to /etc/fstab..."
echo "diag-buildserver64:/tools /tools nfs rsize=8192,wsize=8192,timeo=14,intr" >> /etc/fstab

echo 
echo 
# config bootloader
echo "Writing configration to /etc/default/grub..."
GRUB=/etc/default/grub
cp $GRUB ./$GRUB.bak
perl -pi -e "s/^GRUB_DEFAULT=.*/GRUB_DEFAULT=saved/" $GRUB
perl -pi -e "s/GRUB_SAVEDEFAULT=.*//" $GRUB
echo "GRUB_SAVEDEFAULT=true" >> $GRUB
perl -pi -e "s/^(GRUB_HIDDEN_TIMEOUT=.*)/#\1/" $GRUB
perl -pi -e "s/^GRUB_HIDDEN_TIMEOUT_QUIET=.*/GRUB_HIDDEN_TIMEOUT_QUIET=false/" $GRUB
perl -pi -e "s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet text mem=1024M iommu=off\"/" $GRUB
perl -pi -e "s/GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX=\"mem=1024M iommu=off\"/" $GRUB

update-grub
echo
echo
# disable graphic driver
echo "Writing configration to disable graphic driver..."
echo "editing /etc/modprobe.d/blacklist.conf"
#echo "blacklist radeon" >> /etc/modprobe.d/blacklist.conf
echo "blacklist fbcon
blacklist vga16fb
blacklist radeon
blacklist snd
blacklist snd_hda_codec
blacklist snd_hda_codec_hdmi
blacklist snd_hda_intel
blacklist snd_hwdep
blacklist snd_page_alloc
blacklist snd_pcm
blacklist snd_rawmidi
blacklist snd_seq
blacklist snd_seq_device
blacklist snd_seq_midi
blacklist snd_seq_midi_event
blacklist snd_timer
blacklist soundcore
blacklist shpchp
blacklist sp5100_tco
" >> /etc/modprobe.d/blacklist-framebuffer.conf
reboot
