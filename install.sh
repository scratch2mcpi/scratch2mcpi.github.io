#!/bin/sh

cd /home/pi

# Install Minecraft Pi
echo "\n\033[36m\033[1mInstalling Minecraft Pi...\033[00m\n"
wget -P /tmp https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz
tar zxvf /tmp/minecraft-pi-0.1.1.tar.gz
rm /tmp/minecraft-pi-0.1.1.tar.gz

# Install scratch2mcpi
echo "\n\033[36m\033[1mInstalling scratch2mcpi...\033[00m\n"
sudo apt-get -y install python-setuptools
sudo easy_install scratchpy
wget -P /tmp https://github.com/scratch2mcpi/scratch2mcpi/archive/master.zip
unzip /tmp/master.zip
mv scratch2mcpi-master scratch2mcpi
rm /tmp/master.zip
cp -r /home/pi/mcpi/api/python/mcpi scratch2mcpi/

# Download sample Scratch projects
echo "\n\033[36m\033[1mDownloading sample Scratch projects...\033[00m\n"
wget -P "/home/pi/Documents/Scratch Projects" http://scratch2mcpi.github.io/scratch_projects/mcpi_template.sb
wget -P "/home/pi/Documents/Scratch Projects" http://scratch2mcpi.github.io/scratch_projects/mcpi_sphere.sb
wget -P "/home/pi/Documents/Scratch Projects" http://scratch2mcpi.github.io/scratch_projects/mcpi_tower.sb
wget -P "/home/pi/Documents/Scratch Projects" http://scratch2mcpi.github.io/scratch_projects/mcpi_wall.sb

# Copy Scratch2MCPI shortcut on Desktop 
echo "\n\033[36m\033[1mCopying Scratch2MCPI shortcut on Desktop...\033[00m\n"
wget -P "/home/pi/Desktop" http://scratch2mcpi.github.io/scratch2mcpi.desktop
wget -P "/home/pi/Desktop" http://scratch2mcpi.github.io/scratch2mcpi_terminal.desktop

echo "\n\033[32m\033[1mInstallation of scratch2mcpi is completed.\033[00m\n"

