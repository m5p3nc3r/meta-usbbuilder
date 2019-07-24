

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://disable_jitter._patch"

RDEPENDS_rng-tools += "libgcc"

do_install_append () {

  sed -i \
    -e 's,@SYSCONFDIR@,${sysconfdir},g' \
    -e 's,@SBINDIR@,${sbindir},g' \
    ${D}${sysconfdir}/init.d/rng-tools \
    ${D}${systemd_system_unitdir}/rngd.service


  patch ${D}${sysconfdir}/default/rng-tools < ${WORKDIR}/disable_jitter._patch
}
