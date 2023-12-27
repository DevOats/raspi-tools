#!/bin/bash
#Installation script for the Pimoroni hyperpixel 4.0. Tested on a raspberry pi 5
# Author Joost Haverkort 
# https://github.com/DevOats


# Disable I2C
raspi-config nonint do_i2c 1


#disable SPI

#disable Single wire

# Disable UART pin

# serial console
sudo rpi-serial-console disable
