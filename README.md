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
