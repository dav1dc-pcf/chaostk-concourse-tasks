#!/usr/bin/env bash

# DEBUG
set -x

# Ensure some Py variables are present
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# Add logic for selecting random JOB_NAME & LIMIT
job_arr=( $(echo ${RANDOM_JOB_NAME_ARR} | jq -r .[]) )
# Over-write any values passed in for JOB_NAME & LIMIT with the randomly selected ones
export JOB_NAME=${job_arr[$RANDOM % ${#job_arr[@]} ]}
export LIMIT=$(( ( $RANDOM % ${RANDOM_LIMIT_RANGE} )  + 1 ))

# DO IT!
chaos run ${CHAOSTK_CMD_FLAGS} ${EXPERIMENT_FILE}

# CAT expierment log file for posterity sake
echo
echo
cat chaostoolkit.log

# FIN