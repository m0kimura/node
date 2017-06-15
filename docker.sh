#!/bin/bash
#
  project=${PWD##*/}
##
  if [[ $1 = "build" ]]; then
    docker build -t ${project} --build-arg user=$USER .
    source=$2
    object=$3
    forever=$4
  elif [[ $1 = "push" ]]; then
    dex push
    exit
  else
    source=$1
    object=$2
    forever=$3
  fi
  if [[ ${source} = "$null" ]]; then
    docker run -it --rm \
      ${project} /bin/bash
  else
    docker run -it --rm \
      -v $HOME:/home/$USER \
      -e PRJ=${source} \
      -e OBJ=${object} \
      -e D=${forever} \
      ${project}
  fi
##

