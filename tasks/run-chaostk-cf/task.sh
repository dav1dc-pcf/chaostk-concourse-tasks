#!/usr/bin/env bash

# DEBUG
set -x

# Ensure some Py variables are present
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# DO IT!
chaos run ${CHAOSTK_CMD_FLAGS} ${EXPERIMENT_FILE}

# CAT expierment log file for posterity sake
cat chaostoolkit.log

# FIN
