FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://daemon.json"

do_install_append () {
  # Remove the symlink to the /run directory and replace with a directory
  rm ${D}${sysconfdir}/docker
  mkdir -p ${D}${sysconfdir}/docker

  # Copy over the configuration
  install -m 0755 ${WORKDIR}/daemon.json ${D}${sysconfdir}/docker/daemon.json
}
