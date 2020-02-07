# Add the additional packages to the core image

IMAGE_INSTALL_append_odroid-c2 += " docker bash rng-tools resolvconf"

IMAGE_INSTALL_append_raspberrypi4-64 += " docker bash rng-tools resolvconf init-usbgadget"
