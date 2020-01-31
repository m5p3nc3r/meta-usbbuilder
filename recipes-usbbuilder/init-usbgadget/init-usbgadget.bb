SUMMARY = "USB Gadget configuration and init script for libcomposite"
DESCRIPTION = "Configuration for the libcomposite driver"
HOMEPAGE = "https://m5p3nc3r.github.io/"
SECTION = "base"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=6e065e63d1100480b3fc61962bc4f517"
PR = "r1"

inherit update-rc.d

INITSCRIPT_NAME = "usbgadget"
INITSCRIPT_PARAMS = "start 00 2 3 4 5 . stop 80 0 6 1 ."


SRC_URI += "file://usbgadget.sh \
            file://LICENSE"

S = "${WORKDIR}"

do_install() {
   	install -d ${D}${sysconfdir}/init.d
   	install -m 0755 ${WORKDIR}/usbgadget.sh ${D}${sysconfdir}/init.d/usbgadget
}




