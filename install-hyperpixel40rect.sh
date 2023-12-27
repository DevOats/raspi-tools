#!/bin/bash
#Installation script for the Pimoroni hyperpixel 4.0. Tested on a raspberry pi 5
# Author Joost Haverkort 
# https://github.com/DevOats


# Disable I2C
raspi-config nonint do_i2c 1

#disable SPI
raspi-config nonint do_spi 1

#disable Single wire
raspi-config nonint do_onewire 1

# Disable UART pin
raspi-config nonint do_serial_hw 1

# serial console
raspi-config nonint do_serial_cons 1
