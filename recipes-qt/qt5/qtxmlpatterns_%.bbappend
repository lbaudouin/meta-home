EXTRA_OECONF += " -nomake tests -nomake examples "

do_configure_prepend(){
	bbwarn "DISTRO_FEATURES" ${DISTRO_FEATURES}
	bbwarn "PACKAGECONFIG" ${PACKAGECONFIG}
	bbwarn "PACKAGECONFIG_CONFARGS" ${PACKAGECONFIG_CONFARGS}
	bbwarn "EXTRA_OECONF" ${EXTRA_OECONF}
	bbwarn "QT_CONFIG_FLAGS" ${QT_CONFIG_FLAGS}

	echo "TEMPLATE = aux" > ${S}/tests/tests.pro
}

