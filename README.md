# USB Gadget

This project aims to create a Docker backend builder for [buildkit](https://github.com/moby/buildkit) that can be used to create a USB Gadget that is capable of building Arm32 and Arm64 container images natively.

At present, this is just a pet project that is backed by a series of posts on my [blog site](https://m5p3nc3r.github.io/).

## Instructions

This has currently only been tested on the [ODrdoid C2](https://www.hardkernel.com/shop/odroid-c2/), and built on a [Fedora 30](https://getfedora.org/) distro.  Your mileage on any other configuration may vary but any help getting this working on other SoC's is greatly appreciated.

Depends on

- meta-odroid or meta-raspberrypi
- meta-openembedded
- meta-virtualization
- poky

```bash
bitbake build core-image-minimal
```

## Some pointers to help me remember stuff

### Hacking the kernel

```bash
bitbake virtual/kernel -c kernel_configme -f
bitbake virtual/kernel -c menuconfig
bitbake virtual/kernel -c diffconfig
```

This is my current local.conf additions

```bash
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

This is the contents of my layers.conf, change meta-raspberrypi for meta-odroid
if building for the odroid-c2

```bash
BBLAYERS ?= " \
  /home/matt/projects/yocto/yocto/meta \
  /home/matt/projects/yocto/yocto/meta-poky \
  /home/matt/projects/yocto/yocto/meta-yocto-bsp \
  /home/matt/projects/yocto/meta-raspberrypi \
  /home/matt/projects/yocto/meta-usbbuilder \
  /home/matt/projects/yocto/meta-openembedded/meta-oe \
  /home/matt/projects/yocto/meta-openembedded/meta-multimedia \
  /home/matt/projects/yocto/meta-openembedded/meta-networking \
  /home/matt/projects/yocto/meta-openembedded/meta-python \
  /home/matt/projects/yocto/meta-openembedded/meta-filesystems \
  /home/matt/projects/yocto/meta-virtualization \
  "
  ```
