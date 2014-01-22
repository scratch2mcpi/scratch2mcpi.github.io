#!/bin/sh

cd /home/pi

if [ ! -d /home/pi/mcpi ]; then
    # Install Minecraft Pi
    echo "\n\033[36m\033[1mInstalling Minecraft Pi...\033[00m\n"
    wget -P /tmp https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz
    tar zxvf /tmp/minecraft-pi-0.1.1.tar.gz
    rm /tmp/minecraft-pi-0.1.1.tar.gz
fi

# Install scratch2mcpi
echo "\n\033[36m\033[1mInstalling scratch2mcpi...\033[00m\n"
sudo apt-get -y install python-setuptools
sudo easy_install scratchpy
wget -P /tmp https://github.com/scratch2mcpi/scratch2mcpi/archive/master.zip
unzip /tmp/master.zip
if [ -d /home/pi/scratch2mcpi ]; then
    cp -rf scratch2mcpi-master/* scratch2mcpi/
    rm -rf scratch2mcpi-master
else
    mv scratch2mcpi-master scratch2mcpi
fi
rm /tmp/master.zip
cp -rf /home/pi/mcpi/api/python/mcpi scratch2mcpi/

# Download sample Scratch projects
echo "\n\033[36m\033[1mDownloading sample Scratch projects...\033[00m\n"
if [ -f "/home/pi/Documents/Scratch Projects/mcpi_template.sb" ]; then
    echo "\n\033[33m\033[1mmcpi_template.sb exists. Skipped downloading.\033[00m\n"
else
    wget -P "/home/pi/Documents/Scratch Projects" http://scratch2mcpi.github.io/scratch_projects/mcpi_template.sb
fi

if [ -f "/home/pi/Documents/Scratch Projects/mcpi_sphere.sb" ]; then
    echo "\n\033[33m\033[1mmcpi_sphere.sb exists. Skipped downloading.\033[00m\n"
else
    wget -P "/home/pi/Documents/Scratch Projects" http://scratch2mcpi.github.io/scratch_projects/mcpi_sphere.sb
fi

# Copy Scratch2MCPI shortcut on Desktop
if [ -f /home/pi/Desktop/scratch2mcpi.desktop ]; then
    echo "\n\033[33m\033[1mScratch2MCPI shortcut on Desktop exists. Skipped copying.\033[00m\n"
else
    echo "\n\033[36m\033[1mCopying Scratch2MCPI shortcut on Desktop...\033[00m\n"
    wget -P "/home/pi/Desktop" http://scratch2mcpi.github.io/scratch2mcpi.desktop
fi

# Copy Scratch2MCPI Terminal shortcut on Desktop
if [ -f /home/pi/Desktop/scratch2mcpi_terminal.desktop ]; then
    echo "\n\033[33m\033[1mScratch2MCPI Terminal shortcut on Desktop exists. Skipped copying.\033[00m\n"
else
    echo "\n\033[36m\033[1mCopying Scratch2MCPI Terminal shortcut on Desktop...\033[00m\n"
    wget -P "/home/pi/Desktop" http://scratch2mcpi.github.io/scratch2mcpi_terminal.desktop
fi

echo "\n\033[32m\033[1mInstallation of scratch2mcpi is completed.\033[00m\n"

