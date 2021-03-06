#!/bin/bash

sudo echo -----------------------------

# install libGL
echo -----------------------------
echo 'STEP 1: install libGL'
echo
sudo apt install libgl1-mesa-dev -y

# create application folder
echo -----------------------------
echo 'STEP 2: create application folder'
echo
cd /opt/
sudo rm -r LauncherGenerator
sudo mkdir LauncherGenerator
cd LauncherGenerator
sudo mkdir lib

# go into the temporary folder
cd ~/Desktop/temp_LauncherGenerator

# change mode to executable
chmod +x ~/Desktop/temp_LauncherGenerator/BUILD/LauncherGenerator
chmod +x ~/Desktop/temp_LauncherGenerator/uninstall_LauncherGenerator.sh

# copy files to application folder
echo -----------------------------
echo 'STEP 3: copy files application folder'
echo
sudo cp ~/Desktop/temp_LauncherGenerator/BUILD/LauncherGenerator         /opt/LauncherGenerator
sudo cp ~/Desktop/temp_LauncherGenerator/LauncherGenerator/rocket.ico    /opt/LauncherGenerator
sudo cp ~/Desktop/temp_LauncherGenerator/currentVersion                  /opt/LauncherGenerator
sudo cp ~/Desktop/temp_LauncherGenerator/uninstall_LauncherGenerator.sh  /opt/LauncherGenerator
sudo cp ~/Desktop/temp_LauncherGenerator/lib/*                           /opt/LauncherGenerator/lib/

# create links
echo -----------------------------
echo 'STEP 4: create links for lib'
echo
cd /opt/LauncherGenerator/lib
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

# copy launcher to /usr/share/applications/
echo -----------------------------
echo 'STEP 5: copy launcher'
echo
chmod +x ~/Desktop/temp_LauncherGenerator/Launcher_Generator.desktop
sudo  cp ~/Desktop/temp_LauncherGenerator/Launcher_Generator.desktop /usr/share/applications/

# remove temporary folder
echo -----------------------------
echo 'STEP 6: remove temporary folder'
echo
sudo rm -r ~/Desktop/temp_LauncherGenerator

# update applications
echo -----------------------------
echo 'STEP 7: update applications'
echo
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
sleep 5
/opt/LauncherGenerator/LauncherGenerator
exit