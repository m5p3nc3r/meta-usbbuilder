FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += " \
  file://usbgadget.cfg \
  file://usbgadget2.cfg \
"

#KERNEL_MODULE_AUTOLOAD += "g_ether"
