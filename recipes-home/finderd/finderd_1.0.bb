SUMMARY = "Finder daemon"
SECTION = "base"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d41d8cd98f00b204e9800998ecf8427e"

DEPENDS += " qtbase "
RDEPENDS_${PN} = "initscripts qtbase"

PR = "r0"
S = "${WORKDIR}"

SRC_URI = "file://finderd \
		file://finderd.pro \
	   	file://finderd.cpp \
	   	file://COPYRIGHT \
	   "

INITSCRIPT_NAME = "finderd"
INITSCRIPT_PARAMS = "defaults 10"

inherit qmake5 update-rc.d

do_install () {
	install -d ${D}${sysconfdir}/init.d
	cat ${WORKDIR}/finderd | \
	  sed -e 's,/etc,${sysconfdir},g' \
	      -e 's,/usr/sbin,${sbindir},g' \
	      -e 's,/var,${localstatedir},g' \
	      -e 's,/usr/bin,${bindir},g' \
	      -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/finderd
	chmod a+x ${D}${sysconfdir}/init.d/finderd

	install -d ${D}${sbindir}
	install -m 0755 ${WORKDIR}/build/finderd ${D}${sbindir}/
}

