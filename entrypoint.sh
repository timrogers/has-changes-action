#!/bin/bash
set -e

STATUS_ARGS=$1
PATHSPEC=$2
WORKING_DIRECTORY=$3

function check() {
  if [[ -z "$(cd $WORKING_DIRECTORY && git status --porcelain $STATUS_ARGS $PATHSPEC)" ]];
  then
    echo "0"
  else
    echo "1"
  fi
}

echo ::set-output name=changed::$(check)
