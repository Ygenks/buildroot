#!/bin/sh

# Kernel is built without devpts support
sed -i '/^devpts/d' ${TARGET_DIR}/etc/fstab

# Kernel is built without network support
rm -f ${TARGET_DIR}/etc/init.d/S40network
rm -rf ${TARGET_DIR}/etc/network/

local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

support/scripts/genimage.sh -c ${GENIMAGE_CFG}

rm -f ${GENIMAGE_CFG}
