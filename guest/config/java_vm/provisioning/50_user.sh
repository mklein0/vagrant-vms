#!/usr/bin/env false

install -do ${UUSER} -g ${UUSER} ${UHOME}/.bashrc.d
install -m 0444 -o ${UUSER} -g ${UUSER} ${ASSETS_DIR}/home/vagrant/bashrc.d/* ${UHOME}/.bashrc.d/

if [ ! -f ${UHOME}/.bashrc ]; then
	touch ${UHOME}/.bashrc
fi

if ! grep bashrc.d ${UHOME}/.bashrc 1>/dev/null 2>/dev/null; then
	cat >>${UHOME}/.bashrc <<EOL

# Source user environment configuration files
if [ -f "\${HOME}/.bashrc.d/00__start.sh" ]; then
	. \${HOME}/.bashrc.d/00__start.sh
fi
EOL
fi
