#!/usr/bin/env python

'''
Example of reading the 5V and input voltages
on the Pi-Connect board

Requires the spidev package

'''

# Importing modules
import spidev # To communicate with SPI devices
from time import sleep  # To add delay

# Read MCP3008 data
def analogInput(channel):
    spi.max_speed_hz = 1350000
    adc = spi.xfer2([1,(8+channel)<<4,0])
    data = ((adc[1]&3) << 8) + adc[2]
    return data

# Below function will convert data to voltage
def Volts(data):
    volts = (data * 3.3) / float(1023)
    volts = round(volts, 2) # Round off to 2 decimal places
    return volts

if __name__ == '__main__':
    # Start SPI connection
    spi = spidev.SpiDev() # Created an object
    spi.open(0,0) #MCP3008 is on SPI bus 0, CS 0

    while True:
        rail_output = Volts(analogInput(0)) # Reading from CH0
        vin_output = Volts(analogInput(1)) #  Reading from CH1
        rail = rail_output*2
        vin = (vin_output*(1100/100))+0.42

        print("5V rail: {} V".format(rail))
        print("Input: {} V".format(vin))
        sleep(5)
