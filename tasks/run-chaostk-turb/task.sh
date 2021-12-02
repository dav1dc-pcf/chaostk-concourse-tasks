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
echo
echo
cat chaostoolkit.log

# Could we extract a Turbulence Attack ID from the chaostoolkit.log file??
CHECK=$(grep "attack submitted sucessfully" chaostoolkit.log | wc -l)

if [[ "${CHECK}" -eq "1" ]]; then
  ID=$(grep '"ID"' chaostoolkit.log | grep "-" | uniq | awk '{print $2}' | tr -d ',' | sed 's/"//g')

  echo "Sleeping for 60 seconds before fetching attack log from Turbulence API Server..."
  sleep 60

  if [[ ! -z "${ID}" ]]; then
    URL_TO_CURL="${TURBULENCE_URL}/incidents/${ID}"
    curl -k ${URL_TO_CURL}
  fi
fi

# FIN
