#!/usr/bin/env false

if [ -z "${BOOTSTRAP_D}" ]; then
	pushd $(dirname ${BASH_SOURCE[0]})/.. 1>/dev/null
	BOOTSTRAP_D=$(pwd)
	popd 1>/dev/null
fi

# Environment can be one of
#ENVIRONMENT=$(dmidecode -s baseboard-product-name)

[ -n "${VM_NAME}" ] || VM_NAME=$(basename ${BOOTSTRAP_D} | sed -e 's/_/-/')
[ -n "${UUSER}" ] || UUSER=vagrant
[ -n "${UHOME}" ] || UHOME=/home/${UUSER}
[ -n "${SHARED_DIR}" ] || SHARED_DIR=/vagrant
[ -n "${CONFIG_DIR}" ] || CONFIG_DIR=/config
[ -n "${PROJECTS_DIR}" ] || PROJECTS_DIR=/projects
[ -n "${ASSETS_DIR}" ] || ASSETS_DIR=${CONFIG_DIR}/assets
[ -n "${CACHE_DIR}" ] || CACHE_DIR=${CONFIG_DIR}/.cache.${VM_NAME}

[ -n "${VE_BASE_DIR}" ] || VE_BASE_DIR=/opt/virtualenv

[ -n "${APT_CACHE}" ] || APT_CACHE=${CACHE_DIR}/apt
[ -n "${XDG_CACHE_HOME}" ] || XDG_CACHE_HOME=${CACHE_DIR}
[ -n "${DEBIAN_FRONTEND}" ] || DEBIAN_FRONTEND=noninteractive
[ -n "${APT_GET_OPTS}" ] || APT_GET_OPTS="-y --force-yes -o dir::cache::archives=${APT_CACHE}"

export DEBIAN_FRONTEND
export XDG_CACHE_HOME
