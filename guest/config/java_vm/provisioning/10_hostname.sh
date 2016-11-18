#!/usr/bin/false

if [ "$(hostname)" != "${VM_NAME}" ]; then
	echo ${VM_NAME} > /etc/hostname
	hostname -F /etc/hostname
	cat >> /etc/hosts <<EOL
127.0.1.1	${VM_NAME}.localdomain	${VM_NAME}
EOL
fi
