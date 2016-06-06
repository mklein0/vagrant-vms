#!/bin/false

# Configure location for virtualenvs
[ -n "${WORKON_HOME}" ] || WORKON_HOME=${HOME}/VirtualEnvs
export WORKON_HOME

# Setup virtualenv wrapper if present.
_VE_SETUP=$(type -p virtualenvwrapper.sh 2>/dev/null)
if [ -r "${_VE_SETUP}" ]; then
	#VIRTUALENVWRAPPER_HOOK_DIR=${HOME}/Repository/git/scripts/virtualenvwrapper
  source ${_VE_SETUP}
fi
unset _VE_SETUP
