#!/bin/bash

# install dependencies
dpkg --add-architecture armhf;
apt update;
apt upgrade -y;
apt install build-essential cmake gcc-arm-linux-gnueabihf git libasound2:armhf libc6:armhf libcups2:armhf libgssapi-krb5-2:armhf libkrb5-3:armhf libfontconfig1:armhf libfreetype6:armhf libgnutls30:armhf libpulse0:armhf python3 wget -y;

# compile and install box86
git clone https://github.com/ptitSeb/box86;
cd box86;
mkdir build;
cd build;
cmake .. -D ARM64=1 -DCMAKE_C_COMPILER=gcc -DBAD_SIGNAL=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo;
make -j$(nproc);
make install;
cd;

# compile and install box64
git clone https://github.com/ptitSeb/box64;
cd box64;
mkdir build;
cd build;
cmake .. -D ARM64=1 -DCMAKE_C_COMPILER=gcc -DBAD_SIGNAL=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo;
make -j$(nproc);
make install;
cd;

# install steamcmd
mkdir steamcmd;
cd steamcmd;
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip;
unzip steamcmd.zip;
rm steamcmd.zip;
cd;

# install wine
wget https://github.com/GloriousEggroll/wine-ge-custom/releases/download/GE-Proton8-26/wine-lutris-GE-Proton8-26-x86_64.tar.xz;
tar -xf wine-lutris-GE-Proton*.tar.xz;
rm wine-lutris-GE-Proton*.tar.xz;
mv lutris-GE-Proton* wine;
