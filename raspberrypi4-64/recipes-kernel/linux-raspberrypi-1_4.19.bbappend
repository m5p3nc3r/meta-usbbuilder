FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += " \
  file://usbgadget.cfg \
"

#KERNEL_MODULE_AUTOLOAD += "g_ether"
