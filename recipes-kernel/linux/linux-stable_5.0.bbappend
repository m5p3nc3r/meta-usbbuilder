FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += " \
  file://usbgadget.cfg \
  file://docker.cfg \
  file://tpm.cfg \
  file://usbgadget.patch \
"

KERNEL_MODULE_AUTOLOAD += "g_ether"
