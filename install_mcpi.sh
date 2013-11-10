#!/bin/sh

cd /home/pi

# Install Minecraft Pi
echo "\n\033[36m\033[1mInstalling Minecraft Pi...\033[00m\n"
wget -P /tmp https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz
tar zxvf /tmp/minecraft-pi-0.1.1.tar.gz
rm /tmp/minecraft-pi-0.1.1.tar.gz

# Copy Minecraft Pi shortcut on Desktop
echo "\n\033[36m\033[1mCopying Minecraft Pi shortcut on Desktop...\033[00m\n"
wget -P "/home/pi/Desktop" http://scratch2mcpi.github.io/mcpi.desktop

