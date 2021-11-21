#!/usr/bin/env bash

# DEBUG
set -x
whoami


export LC_ALL=C.UTF-8
export LANG=C.UTF-8

#source /root/.bashrc


# DO IT!
chaos run ${CHAOSTK_CMD_FLAGS} ${EXPERIMENT_FILE}

# FIN
exit 0
