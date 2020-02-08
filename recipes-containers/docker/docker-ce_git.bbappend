FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://daemon.json"

do_install_append () {
  # Copy over the configuration
  install -m 0755 ${WORKDIR}/daemon.json ${D}${sysconfdir}/docker/daemon.json
}
