#!/bin/bash
#Installation script for the Pimoroni hyperpixel 4.0. Tested on a raspberry pi 5
# Author Joost Haverkort 
# https://github.com/DevOats

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Script needs to be executed with Sudo"
    exit
fi


# Disable I2C
echo "Disabling I2C"
raspi-config nonint do_i2c 1

#disable SPI
echo "Disabling SPI"
raspi-config nonint do_spi 1

#disable Single wire
echo "Disabling OneWire"
raspi-config nonint do_onewire 1

# Disable UART pin
echo "Disabling UART HW"
raspi-config nonint do_serial_hw 1

# serial console
echo "Disabling Serial Console"
raspi-config nonint do_serial_cons 1

echo "Prepending HyperPixel 4.0 config to /boot/config.txt:"
sed -i '# For HyperPixel 4.0:' /boot/config.txt
sed -i 'dtoverlay=vc4-kms-dpi-hyperpixel4' /boot/config.txt
sed -i 'dtparam=rotate=270,touchscreen-swapped-x-y,touchscreen-inverted-y' /boot/config.txt
sed -i '' /boot/config.txt


echo "Adding HyperPixel 4.0 config to the WayFire config file:"
echo $WAYFIRE_CONFIG_FILE
echo -e "\n" > $WAYFIRE_CONFIG_FILE
echo -e "## For HyperPixel 4.0:\n" > $WAYFIRE_CONFIG_FILE
echo -e "[output:DPI-1]\n" > $WAYFIRE_CONFIG_FILE
echo -e "mode = 480x800@60061\n" > $WAYFIRE_CONFIG_FILE
echo -e "position = 0,0\n" > $WAYFIRE_CONFIG_FILE
echo -e "transform = 270\n" > $WAYFIRE_CONFIG_FILE
