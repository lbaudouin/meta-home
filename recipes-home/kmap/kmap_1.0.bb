DESCRIPTION = "Files for keyboard" 
SECTION = "miscellaneous" 
LICENSE = "MIT" 
LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d41d8cd98f00b204e9800998ecf8427e" 
PR = "r0"
S = "${WORKDIR}"

SRC_URI = "file://fr-latin9.bmap \
	   file://kmap \
	   file://COPYRIGHT" 

CONFFILES_${PN} += "${sysconfdir}/init.d/kmap"


do_install () {
	install -d ${D}/usr/share/kmap/
	install -p -m 644 fr-latin9.bmap ${D}/usr/share/kmap/

        install -d ${D}${sysconfdir}/init.d
        cat ${WORKDIR}/kmap | \
          sed -e 's,/etc,${sysconfdir},g' \
              -e 's,/usr/sbin,${sbindir},g' \
              -e 's,/var,${localstatedir},g' \
              -e 's,/usr/bin,${bindir},g' \
              -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/kmap
        chmod a+x ${D}${sysconfdir}/init.d/kmap

        install -d ${D}${sysconfdir}/rc5.d
	ln -sf ../init.d/kmap ${D}${sysconfdir}/rc5.d/S85kmap
}

