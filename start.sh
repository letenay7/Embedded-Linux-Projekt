#!/bin/bash


git clone git://git.buildroot.net/buildroot

#copy config files
cp qemu_arm_versatile_mediaplayer_defconfig buildroot/configs/qemu_arm_versatile_mediaplayer_defconfig
cp mediaplayer.config buildroot/board/qemu/arm-versatile/mediaplayer.config

cd buildroot
make qemu_arm_versatile_mediaplayer_defconfig
make

cd ..
cp S10music.sh buildroot/output/target/etc/init.d/S10music.sh
chmod 775 buildroot/output/target/etc/init.d/S10music.sh

#handle music

MUSIC_DIR="buildroot/output/target/usr/share/music"
mkdir $MUSIC_DIR
cp starwars.mp3 $MUSIC_DIR
cd buildroot
make
