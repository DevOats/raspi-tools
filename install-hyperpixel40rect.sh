#!/bin/bash
#Installation script for the Pimoroni hyperpixel 4.0. Tested on a raspberry pi 5
# Author Joost Haverkort 
# https://github.com/DevOats

# Disable I2C
echo "Disabling I2C"
sudo raspi-config nonint do_i2c 1

#disable SPI
echo "Disabling SPI"
sudo raspi-config nonint do_spi 1

#disable Single wire
echo "Disabling OneWire"
sudo raspi-config nonint do_onewire 1

# Disable UART pin
echo "Disabling UART HW"
sudo raspi-config nonint do_serial_hw 1

# serial console
echo "Disabling Serial Console"
sudo raspi-config nonint do_serial_cons 1

echo "Prepending HyperPixel 4.0 config to /boot/config.txt:"
sudo sed '1i# For HyperPixel 4.0:' -i /boot/config.txt
sudo sed '2idtoverlay=vc4-kms-dpi-hyperpixel4' -i /boot/config.txt
sudo sed '3idtparam=rotate=270,touchscreen-swapped-x-y,touchscreen-inverted-y' -i /boot/config.txt
sudo sed '4i\ ' -i /boot/config.txt


echo "Adding HyperPixel 4.0 config to the WayFire config file:"
echo -e "" >> ~/.config/wayfire.ini
echo -e "## For HyperPixel 4.0:" >> ~/.config/wayfire.ini
echo -e "[output:DPI-1]" >> ~/.config/wayfire.ini
echo -e "mode = 480x800@60061" >> ~/.config/wayfire.ini
echo -e "position = 0,0" >> ~/.config/wayfire.ini
echo -e "transform = 270" >> ~/.config/wayfire.ini

echo "Done. Note that this script is not idempotent. Manually removes changes from the following files before rerunning:"
echo "~/.config/wayfire.ini  (Bottom)"
echo "/boot/config.txt (top)"
echo "Please reboot the Raspberri Pi for the changes to take effect."
