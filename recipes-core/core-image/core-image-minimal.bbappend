# Add the additional packages to the core image

IMAGE_INSTALL_append += " docker bash rng-tools resolvconf e2fsprogs-resize2fs"

IMAGE_INSTALL_append_odroid-c2 += ""

IMAGE_INSTALL_append_raspberrypi4-64 += " init-usbgadget"
