#!/bin/bash
#
  project=${PWD##*/}
##
  if [[ $1 = "build" ]]; then
    if [[ $2 = "$null" ]]; then
      echo "*ERROR Specify Project"; exit 1
    fi
    if [[ $3 = "$null" ]]; then
      echo "*ERROR Specify Module"; exit 1
    fi
    docker build -t ${project} .
    prj=$2
    moj=$3
  elif [[ $1 = "push" ]]; then
    dex push ${project}
    exit
  else
    if [[ $1 = "$null" ]]; then
      echo "*ERROR Specify Project"; exit 1
    fi
    if [[ $2 = "$null" ]]; then
      echo "*ERROR Specify Module"; exit 1
    fi
    prj=$1
    moj=$2
  fi
  docker run --rm \
    -v $HOME:/home/docker \
    -e PRJ=${prj} \
    -e MODULE=${moj} \
    ${project}
#

