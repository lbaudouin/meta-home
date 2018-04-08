FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " file://mpd.init "

RDEPENDS_${PN} += " alsa-utils "

INITSCRIPT_NAME = "mpd"
INITSCRIPT_PARAMS = "defaults 10"

inherit update-rc.d

do_install_append () {
	install -d ${D}${sysconfdir}/init.d
	cat ${WORKDIR}/mpd.init | \
	  sed -e 's,/etc,${sysconfdir},g' \
	      -e 's,/usr/sbin,${sbindir},g' \
	      -e 's,/var,${localstatedir},g' \
	      -e 's,/usr/bin,${bindir},g' \
	      -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/mpd
	chmod a+x ${D}${sysconfdir}/init.d/mpd
}
