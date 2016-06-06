#!/bin/false

# Numberspace
#
# 00 - This runner and other runner configurations.
# 10 - Shell Environment variables
# 20 - APT Configuration
# 30 - System Package installation
# 40 - System Package configuration
# 50 - Custom Package installation
# 60 - Custom Package configuration

# Loop through all shell setup scripts in this directory.  Skip stub script.
for f in $(LC_COLLATE=C command ls -1 $(command dirname ${BASH_SOURCE[0]})/*.sh |
    command grep -ve "${BASH_SOURCE[0]}"
); do
    echo "**** Running $f ***"
    . $f
done
