#!/usr/bin/false

if [ "$(hostname)" != "${VM_NAME}" ]; then
	echo ${VM_NAME} > /etc/hostname
	hostname -F /etc/hostname
fi
