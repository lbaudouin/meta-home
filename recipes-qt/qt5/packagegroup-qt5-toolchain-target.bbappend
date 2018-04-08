
RDEPENDS_${PN} = " \
    packagegroup-core-standalone-sdk-target \
    libsqlite3-dev \
    qtbase-dev \
    qtbase-mkspecs \
    qtconnectivity-dev \
    qtconnectivity-mkspecs \
    qtserialport-dev \
    qtserialport-mkspecs \
    qtwebsockets-dev \
    qtwebsockets-mkspecs \
    qttools \
    "
    
do_configure_prepend() {
	bbwarn "RDEPENDS_${PN}: $RDEPENDS_${PN}"
}
