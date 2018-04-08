do_deploy_append() {
	echo "dtoverlay=w1-gpio,gpiopin=4" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "# Enable UART" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "enable_uart=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "dtparam=audio=on" >> ${DEPLOYDIR}/bcm2835-bootfiles//config.txt
}
