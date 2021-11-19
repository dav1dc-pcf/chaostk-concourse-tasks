#!/usr/bin/env bash

# DEBUG
set -x

whoami

# DO IT!
chaos run ${CHAOSTK_CMD_FLAGS} ${EXPERIMENT_FILE}

# FIN
exit 0
