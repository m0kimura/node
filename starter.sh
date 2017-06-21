#!/bin/bash
#
##
  key=$1
  table=(web test)
  app=${PWD##*/}
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
  while getopts dti OPT; do
    case $OPT in
      "d" ) op=forever ;;
      "t" ) op=test ;;
      "i" ) op=init ;;
    esac
  done
##
  echo $1, $2, $3
  echo HUB=${hub}, FLAG=${flag}, OP=${op} 
##
  if [[ $2 = "$null" ]]; then
    echo *ERROR Specify the Apli Name
    exit 1
  fi
##
  if  [[ $3 = "-d" ]]; then
    cd $HOME/${hub}/$1-project/nodejs/$2
    forever app.js --id $2
  elif [[ $3 = "-t" ]]; then
    cd $HOME/${hub}/$1-project/nodejs/$2
    npm test
  elif [[ $3 = "-i" ]]; then
    cd $HOME/${hub}/$1-project/nodejs
    mkdir $2
    cd $2
    touch app.js
    echo -e "{\n" \
      "  \"name\": \"${app}\",\n" \
      "  \"version\": \"1.0.0\",\n" \
      "  \"description\": \"\",\n" \
      "  \"main\": \"app.js\",\n" \
      "  \"scripts\": {\n" \
      "    \"test\": \"echo Error: no test specified && exit 1\"\n" \
      "  },\n" \
      "  \"author\": \"M.Kimura\",\n" \
      "  \"license\": \"MIT\",\n" \
      "  \"readme\": \"ERROR: No README data found!\"\n" \
      "}" > package.json
  else
    cd $HOME/${hub}/$1-project/nodejs/$2
    node app.js
  fi
##
