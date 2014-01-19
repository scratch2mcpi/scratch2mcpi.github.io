#!/bin/sh

cd /home/pi

# Install Minecraft Pi
echo "\n\033[36m\033[1mInstalling Minecraft Pi...\033[00m\n"
wget -P /tmp https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz
tar zxvf /tmp/minecraft-pi-0.1.1.tar.gz
rm /tmp/minecraft-pi-0.1.1.tar.gz

# Copy Minecraft Pi shortcut on Desktop
if [ -f /home/pi/Desktop/mcpi.desktop ]
then
	echo "\n\033[33m\033[1mMinecraft Pi shortcut on Desktop exists. Skipped copying.\033[00m\n"
else
	echo "\n\033[36m\033[1mCopying Minecraft Pi shortcut on Desktop...\033[00m\n"
	wget -P "/home/pi/Desktop" http://scratch2mcpi.github.io/mcpi.desktop
fi

# Download Python samples
echo "\n\033[36m\033[1mDownloading Python samples...\033[00m\n"
wget -P "/home/pi/mcpi/api/python" http://scratch2mcpi.github.io/python_samples/sphere.py
chmod a+x /home/pi/mcpi/api/python/sphere.py

echo "\n\033[32m\033[1mInstallation of minecraft-pi is completed.\033[00m\n"

