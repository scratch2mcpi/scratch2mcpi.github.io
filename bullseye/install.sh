#!/bin/sh

desktop_dir=`xdg-user-dir DESKTOP`
home_dir=`xdg-user-dir HOME`

cd $home_dir

if [ ! -d /opt/minecraft-pi-reborn-client ]; then
    echo "\n\033[33m\033[1mMinecraft Pi Reborn Client is not installed in your computer. Please install it first from https://github.com/MCPI-Revival/minecraft-pi-reborn.\033[00m\n"
else
    # Install scratch2mcpi
    echo "\n\033[36m\033[1mInstalling scratch2mcpi...\033[00m\n"
    sudo pip2 install scratchpy
    wget -P /tmp https://github.com/scratch2mcpi/scratch2mcpi/archive/master.zip
    unzip /tmp/master.zip
    if [ -d $home_dir/scratch2mcpi ]; then
        cp -rf scratch2mcpi-master/* scratch2mcpi/
        rm -rf scratch2mcpi-master
    else
        mv scratch2mcpi-master scratch2mcpi
    fi
    rm /tmp/master.zip

    cp -rf /opt/minecraft-pi-reborn-client/api/python/mcpi scratch2mcpi/

    # Install Minecraft Graphics Turtle
    echo "\n\033[36m\033[1mInstalling MinecraftGraphicsTurtle...\033[00m\n"
    wget -P /tmp https://github.com/scratch2mcpi/minecraft-turtle/archive/master.zip
    unzip /tmp/master.zip
    if [ -d $home_dir/scratch2mcpi/minecraft-turtle/ ]; then
        rm -rf scratch2mcpi/minecraft-turtle/
    fi
    mv minecraft-turtle-master scratch2mcpi/mcturtle
    rm /tmp/master.zip

    # Install Minecraft Stuff
    echo "\n\033[36m\033[1mInstalling MinecraftStuff...\033[00m\n"
    wget -P /tmp https://github.com/scratch2mcpi/minecraft-stuff/archive/master.zip
    unzip /tmp/master.zip
    if [ -d $home_dir/scratch2mcpi/minecraft-stuff/ ]; then
        rm -rf scratch2mcpi/minecraft-stuff/
    fi
    mv minecraft-stuff-master scratch2mcpi/mcstuff
    rm /tmp/master.zip

    # Download sample Scratch projects
    echo "\n\033[36m\033[1mDownloading sample Scratch projects...\033[00m\n"
    files="mcpi_template mcpi_sphere mcpi_stagescanner"
    for file in $files
    do
      if [ -f "$home_dir/Documents/Scratch Projects/$file.sb" ]; then
          echo "\n\033[33m\033[1m$file.sb exists. Skipped downloading.\033[00m\n"
      else
          wget -P "$home_dir/Documents/Scratch Projects" http://scratch2mcpi.github.io/scratch_projects/$file.sb
      fi
    done

    # Download MinecraftGraphicsTurtle and Stuff sample Scratch projects
    echo "\n\033[36m\033[1mDownloading MinecraftGraphicsTurtle and MinecraftStuff sample Scratch projects...\033[00m\n"
    files="3dnautilus AdventuresInRasPi buildBoxHouse pattern3 star stuff_face wallbox_ans colorcircle drawcircle_color drawsphere_color stuff_line"
    for file in $files
    do
      if [ -f "$home_dir/Documents/Scratch Projects/turtle_$file.sb" ]; then
          echo "\n\033[33m\033[1mturtle_$file.sb exists. Skipped downloading.\033[00m\n"
      else
          wget -P "$home_dir/Documents/Scratch Projects" http://naominix.github.io/scratch2mcpi_projects/turtle_$file.sb
      fi
    done

    # Copy Scratch2MCPI shortcut on Desktop
    if [ -f $desktop_dir/scratch2mcpi.desktop ]; then
        echo "\n\033[33m\033[1mScratch2MCPI shortcut on Desktop exists. Skipped copying.\033[00m\n"
    else
        echo "\n\033[36m\033[1mCopying Scratch2MCPI shortcut on Desktop...\033[00m\n"
        wget -P "$desktop_dir" http://scratch2mcpi.github.io/bullseye/scratch2mcpi.desktop
    fi

    # Copy Scratch2MCPI Terminal shortcut on Desktop
    if [ -f $desktop_dir/scratch2mcpi_terminal.desktop ]; then
        echo "\n\033[33m\033[1mScratch2MCPI Terminal shortcut on Desktop exists. Skipped copying.\033[00m\n"
    else
        echo "\n\033[36m\033[1mCopying Scratch2MCPI Terminal shortcut on Desktop...\033[00m\n"
        wget -P "$desktop_dir" http://scratch2mcpi.github.io/bullseye/scratch2mcpi_terminal.desktop
    fi

    echo "\n\033[32m\033[1mInstallation of scratch2mcpi is completed.\033[00m\n"
fi
