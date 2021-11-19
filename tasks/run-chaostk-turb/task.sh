#!/usr/bin/env bash

# DEBUG
set -x

# DO IT!
chaos run ${CHAOSTK_CMD_FLAGS} ${EXPERIMENT_FILE}

# FIN
exit 0
