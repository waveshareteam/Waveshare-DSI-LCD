#Set up the script to run the interpreter
#!/bin/bash

#Appends the second parameter string to the end of the first parameter file
Data_Insertion() {
	if grep -w -q ^$2 $1; then
		echo "It already exists and does not need to be added"
	else
		echo $2 >>$1
	fi
}

#Driver Start Settings
echo "Driver Start Settings"

#Jump to the driver package directory
cd ./Driver_package
ko_filenames=()
for file in *.ko; do
  filename=$(basename -- "$file")
  ko_filenames+=("${filename%.*}")
done

#Move driver file
sudo cp *.ko /lib/modules/$(uname -r)
sudo cp *.dtbo /boot/overlays

#Jump to the driver installation directory
cd /lib/modules/$(uname -r)

#Install driver
sudo depmod
for name in "${ko_filenames[@]}"; do
  echo "Modprobing $name"
  sudo modprobe "$name"
done

#Jump to the config configuration directory
cd /boot/firmware

#set config
Data_Insertion config.txt "ignore_lcd=1"
Data_Insertion config.txt "dtoverlay=vc4-kms-v3d"
Data_Insertion config.txt "dtparam=i2c_vc=on"
Data_Insertion config.txt "dtparam=i2c_arm=on"
Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Screen,$1,$2"

if [ "SCREEN_type=0" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2,invertedy,swappedxy"
fi
if [ "SCREEN_type=1" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2,invertedx,swappedxy"
fi
if [ "SCREEN_type=2" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2"
fi
if [ "SCREEN_type=3" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2"
fi
if [ "SCREEN_type=4" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2"
fi
if [ "SCREEN_type=5" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2,invertedx,swappedxy"
fi
if [ "SCREEN_type=6" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2,invertedx,swappedxy"
fi
if [ "SCREEN_type=7" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2"
fi
if [ "SCREEN_type=8" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2,invertedx,swappedxy"
fi
if [ "SCREEN_type=9" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2"
fi
if [ "SCREEN_type=10" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2"
fi
if [ "SCREEN_type=13" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=ilitek,$2"
fi
if [ "SCREEN_type=14" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2,invertedx,invertedy"
fi
if [ "SCREEN_type=15" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2,invertedx,invertedy"
fi
if [ "SCREEN_type=16" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=WS_xinchDSI_Touch,$2"
fi
if [ "SCREEN_type=17" = "$1" ]; then
	Data_Insertion config.txt "dtoverlay=ilitek,$2"
fi
#Driver end Settings
echo "Driver end Settings"
