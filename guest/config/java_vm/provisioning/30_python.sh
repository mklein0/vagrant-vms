#!/usr/bin/env false

apt-get install ${APT_GET_OPTS} python-pip

# Get latest release of pip 
pip install --upgrade pip setuptools wheel
