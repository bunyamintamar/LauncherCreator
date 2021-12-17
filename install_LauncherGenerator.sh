#!/bin/bash

# wget https://github.com/bunyamintamar/LauncherGenerator.git ~/Desktop/temp_LauncherGenerator
# cd ~/Desktop/temp_LauncherGenerator
# chmod +x install_LauncherGenerator.sh
# ./install_LauncherGenerator.sh

sudo echo -----------------------------

# install libGL
sudo apt install libgl1-mesa-dev -y

# create application folder
cd /opt/
sudo rm -r LauncherGenerator
sudo mkdir LauncherGenerator
cd LauncherGenerator
sudo mkdir lib

# go into the temporary folder
cd ~/Desktop/temp_LauncherGenerator

# change mode to executable
chmod +x ~/Desktop/temp_LauncherGenerator/BUILD/LauncherGenerator

# copy launcher to /usr/share/applications/
chmod +x ~/Desktop/temp_LauncherGenerator/Launcher_Generator.desktop
sudo  cp ~/Desktop/temp_LauncherGenerator/Launcher_Generator.desktop /usr/share/applications/

# create links
cd /opt/LauncherGenerator/lib
sudo cp ~/Desktop/temp_LauncherGenerator/lib/* .
sudo ln -s libicudata.so.56.1      libicudata.so.56
sudo ln -s libicudata.so.56        libicudata.so
sudo ln -s libicui18n.so.56.1      libicui18n.so.56
sudo ln -s libicui18n.so.56        libicui18n.so
sudo ln -s libicuuc.so.56.1        libicuuc.so.56
sudo ln -s libicuuc.so.56          libicuuc.so
sudo ln -s libQt5Core.so.5.15.2    libQt5Core.so.5.15
sudo ln -s libQt5Core.so.5.15      libQt5Core.so.5
sudo ln -s libQt5Core.so.5         libQt5Core.so
sudo ln -s libQt5Gui.so.5.15.2     libQt5Gui.so.5.15
sudo ln -s libQt5Gui.so.5.15       libQt5Gui.so.5
sudo ln -s libQt5Gui.so.5          libQt5Gui.so
sudo ln -s libQt5Widgets.so.5.15.2 libQt5Widgets.so.5.15
sudo ln -s libQt5Widgets.so.5.15   libQt5Widgets.so.5
sudo ln -s libQt5Widgets.so.5      libQt5Widgets.so

# remove temporary folder
sudo rm -r ~/Desktop/temp_LauncherGenerator

# update applications
sudo apt install update -y

####
echo
echo 'OK'
echo
echo '-----------------------------'
echo 'Bunyamin TAMAR'
echo 'linkedin.com/in/bunyamintamar'
echo 'December 2021'
echo '-----------------------------'
echo
sleep 2
read