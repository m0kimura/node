#!/bin/bash
##
  cd $DIR
  if [[ $MODULE = "$null" ]]; then
    /bin/bash
  else
    node $MODULE
  fi
##
