EXTRA_OECONF="\
-dbus \
-no-gui \
-no-widgets \
-no-opengl \
-no-accessibility \
-no-eglfs \
-nomake tests \
-nomake examples \
-no-linuxfb \
-no-xvideo \
-no-xrender \
-no-gtkstyle \
-no-xrandr \
-no-xcursor \
-no-xinerama \
-no-xinput \
-no-xinput2 \
-no-xfixes \
-no-xsync \
-no-tslib \
-no-qpa-platform-guard \
-no-freetype \
-no-fontconfig \
-nomake tools \
"

PACKAGECONFIG = "release dbus udev libs openssl zlib "

PACKAGECONFIG_remove = " accessibility examples "
PACKAGECONFIG_remove = " linuxfb tslib "

PACKAGECONFIG_remove = "widgets"
PACKAGECONFIG_remove = "jpeg"
PACKAGECONFIG_remove = "libpng"
PACKAGECONFIG_remove = "gl"
PACKAGECONFIG_remove = "tools"

PACKAGECONFIG[gl] = ""
PACKAGECONFIG[gles2] = ""
PACKAGECONFIG[tslib] = ""

PACKAGECONFIG += " sql-mysql "

PACKAGECONFIG_CONFARGS_append = " -no-qpa-platform-guard -no-freetype -no-fontconfig -no-gui -no-widgets -no-opengl -no-eglfs "

QT_CONFIG_FLAGS_remove = " -eglfs "

do_configure_prepend(){
	bbwarn "DISTRO_FEATURES" ${DISTRO_FEATURES}
	bbwarn "PACKAGECONFIG" ${PACKAGECONFIG}
	bbwarn "PACKAGECONFIG_CONFARGS" ${PACKAGECONFIG_CONFARGS}
	bbwarn "EXTRA_OECONF" ${EXTRA_OECONF}
	bbwarn "QT_CONFIG_FLAGS" ${QT_CONFIG_FLAGS}
}
