#!/usr/bin/env bash

set -euo pipefail

function dt_log {
  local __MSG="$(date +'%d.%m.%Y %H:%M:%S %Z(UTC%z)'): $1"
  echo "${__MSG}"
  ## Add message also to `/var/log/syslog`
  logger "${__MSG}"
}

# -------------------------------------------------
WORD=$1
LOG=$2

if grep -i "${WORD}" "${LOG}" &> /dev/null; then
  dt_log "I found word ${WORD} in file ${LOG}!"
else
  exit 0
fi
