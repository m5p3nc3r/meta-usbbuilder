## USB Gadget

This project aims to create a Docker backend builder for [buildkit](https://github.com/moby/buildkit) that can be used to create a USB Gadget that is capable of building Arm32 and Arm64 container images natively.

At present, this is just a pet project that is backed by a series of posts on my [blog site](https://m5p3nc3r.github.io/).

## Instructions

This has currently only been tested on the [ODrdoid C2](https://www.hardkernel.com/shop/odroid-c2/), and built on a [Fedora 30](https://getfedora.org/) distro.  Your mileage on any other configuration may vary but any help getting this working on other SoC's is greatly appreciated.

Depends on
- meta-odroid
- meta-openembedded
- meta-virtualization
- poky

````
bitbake build core-image-minimal
````



This is my current local.conf additions
```
MACHINE = "raspberrypi4-64"
ENABLE_UART = "1"
RPI_EXTRA_CONFIG = "dtoverlay=pi3-disable-bt"
ENABLE_DWC2_PERIPHERAL = "1"
ENABLE_KGDB = "1"
# Ensure the kernel modules are added (for test/debug purposes - can remove later)
CORE_IMAGE_EXTRA_INSTALL += " kernel-modules"

# I think there is a bug in the u_serial driver where its not showing up in 
# /proc/consoles with the version of the kernel used by the RPI.
# Hopefully can remove this when we move to 5.5?
SYSVINIT_ENABLED_GETTYS = "GS0"
#SERIAL_CONSOLES = "115200;ttyGS0 115200;ttyAMA0"
SERIAL_CONSOLES = "115200;ttyAMA0"
```