#!/bin/bash
#script to install rtl-sdr


#Update your distribution.
sudo apt-get update

# Install the tools needed to retrieve (git),
# compile (cmake) and build (build-essential)


sudo apt-get install git cmake build-essential

#install libusb-1.0-0-dev which is a C library

# that provides generic access to USBdevices


sudo apt-get install libusb-1.0-0-dev

#Retrieve, build and compile the RTL2832U
# Osmocom drivers from the source

git clone https://git.osmocom.org/rtl-sdr
cd rtl-sdr/
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/



#Blacklist the default driver that is automatically 
#loaded for using the dongle as a TV device as it
#doesn't work for SDR purposes and clashes with the new Osmocom drivers we just installed.




cd /etc/modprobe.d

sudo touch blacklist-rtl.conf


 echo "blacklist dvb_usb_rtl28xxu" >> sudo tee /etc/modprobe.d/blacklist-rtl.conf

echo "restart your machine"

echo "after restarting, Test that the dongle is working by opening a terminal and typing:
rtl_test -t "

#prompt to restart the machine


echo "Do you wish to restart now?"
echo "1:yes 2:no"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) shutdown -r now; break;;
        No ) exit;;
    esac
done
