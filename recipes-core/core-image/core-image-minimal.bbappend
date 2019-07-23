# Add the additional packages to the core image

IMAGE_INSTALL_append = " docker bash rng-tools strace resolvconf"
KERNEL_MODULE_AUTOLOAD += "g_ether"
