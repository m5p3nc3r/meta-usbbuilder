#!/bin/sh

# Load the composite driver
modprobe libcomposite


# Create the default configfs structure
mkdir -p /sys/kernel/config/usb_gadget/g1
cd /sys/kernel/config/usb_gadget/g1

echo 0x1d6b > idVendor # Linux Foundation
echo 0x0104 > idProduct # Multifunction Composite Gadget

# 0x409 is the language code for English
mkdir -p strings/0x409
echo "fedcba9876543210" > strings/0x409/serialnumber
echo "spustick" > strings/0x409/manufacturer 
echo "builder" > strings/0x409/product 

mkdir -p configs/c.1/strings/0x409
echo "Config 1: ECM network" > configs/c.1/strings/0x409/configuration 

# Create the serial endpoint
mkdir -p functions/acm.usb0
ln -s functions/acm.usb0 configs/c.1/

# Create the network endpoint
mkdir -p functions/ecm.usb0
HOST="48:6f:73:74:50:43" # "HostPC"
SELF="42:61:64:55:53:42" # "BadUSB"
echo $HOST > functions/ecm.usb0/host_addr
echo $SELF > functions/ecm.usb0/dev_addr
ln -s functions/ecm.usb0 configs/c.1/


# This device name comes from /sys/class/udc
echo fe980000.usb > UDC
