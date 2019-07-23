
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://interfaces._patch"

do_install_append () {
  patch ${D}${sysconfdir}/network/interfaces < ${WORKDIR}/interfaces._patch
}
