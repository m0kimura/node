#!/bin/bash
#
##
  key=$1
  table=(web test)
##
  flag=false
  for i in "${table[@]}"; do
    if [[ $i = $key ]]; then
      flag=true
    fi
  done
  if [[ ${flag} = true ]]; then
    hub=github
  else
    hub=bitbucket
  fi
##
  cd $HOME/${hub}/$1-project/nodejs/application
  if [[ $2 != "$null" ]]; then
    if  [[ $3 = "d" ]]; then
      forever $2.js
echo forever $2.js
    else
echo "## $1 $2 $3 "
      node $2.js
    fi
  fi
##
