# Documentation for Pi-Connect (V1)

## Introduction

The Pi-Connect is a HAT addon board for the Raspberry Pi that allows easy and reliable interfacing with
popular flight controllers used in unmanned vehicles.

It removes the complexity and risk of wiring up the telemetry and power connectors between the Pi and the 
vehicle systems.

It has been designed with reliability and a small form factor at the forefront, allowing for it to be used in
both the smallest and largest of vehicles.

## Features

The Pi-Connect features:
* Pi power supply
    * Wide input voltage (7 - 30V)
    * Reverse input protection
    * ESD protected
    * Supplies a full 5V at 3A for the Pi and accessories
    * Overcurrent protection
* 3x Telemetry (serial) ports
    * 2x ports use the JST-GH 6-pin Dronecode standard connector
    * 1x port in the "FTDI" 6-pin layout
    * 1 of the JST-GH and the FTDI ports are powered at 5V (0.5A max)
    * 1 of the JST-GH and the FTDI ports are 5V/3.3V compliant
* Analog input ports
    * 1 port for Input voltage monitoring
    * 1 port for Pi 5C rail voltage monitoring
    * 3 user ports for connection to analog sensors (3.3V max)

It is 100% compliant with the Raspberry Pi HAT spec (using the uHAT size) and is
compatible with the Raspberry Pi 2, 3 and Zero

The board also features a power switch which safely switches off the Pi via issuing a shutdown
signal. This ensures the Pi is cleanly shutdown and reduces the risk of system corruption.

## Requirements

The Pi-Connect requires the following equipment:

* Power source of 7-30V, capable of supplying at least 15W
* Raspberry Pi 2, 3, Zero, Zero W with Raspian.
* Flight controller with JST-GH telemetry connector (and cable). Examples include the 
  The Cube, Pixracer, Pixhawk 4 and others.

## Setup
* Run the UART install script
* Run the general script
* Reboot

## Using
* Power switch
* UARTS - name and types
* Analog ports - python or bash
* Voltage montoring, resistor scaling

## Software examples
* Some sort of WebGUI?
* Analog Port python example