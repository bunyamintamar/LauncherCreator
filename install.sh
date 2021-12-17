#!/bin/bash

sudo echo -----------------------------

# install libGL
sudo apt install libgl1-mesa-dev -y

# create application folder
cd /opt/
sudo mkdir LauncherGenerator
cd LauncherGenerator
mkdir lib

# download files to temporary folder
cd ~/Desktop
mkdir temp_LauncherGenerator
mkdir 
ico
app
launcher
libs

# change mode to executable
chmod +x LauncherGenerator

# copy launcher to /usr/share/applications/
sudo ~/Desktop/temp_LauncherGenerator/Launcher_Generator.desktop /usr/share/applications/
chmod +x Launcher_Generator.desktop

# create links
cd /opt/LauncherGenerator/lib
sudo cp ~/Desktop/temp_LauncherGenerator/lib/* .
ln -s libicudata.so.56.1      libicudata.so.56
ln -s libicudata.so.56        libicudata.so
ln -s libicui18n.so.56.1      libicui18n.so.56
ln -s libicui18n.so.56        libicui18n.so
ln -s libicuuc.so.56.1        libicuuc.so.56
ln -s libicuuc.so.56          libicuuc.so
ln -s libQt5Core.so.5.15.2    libQt5Core.so.5.15
ln -s libQt5Core.so.5.15      libQt5Core.so.5
ln -s libQt5Core.so.5         libQt5Core.so
ln -s libQt5Gui.so.5.15.2     libQt5Gui.so.5.15
ln -s libQt5Gui.so.5.15       libQt5Gui.so.5
ln -s libQt5Gui.so.5          libQt5Gui.so
ln -s libQt5Widgets.so.5.15.2 libQt5Widgets.so.5.15
ln -s libQt5Widgets.so.5.15   libQt5Widgets.so.5
ln -s libQt5Widgets.so.5      libQt5Widgets.so

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