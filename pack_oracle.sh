#!/bin/bash

set -e
echo "select the oracle folder: (enter a number)"
select FOLDER in $(echo */)
do
FOLDER=${FOLDER%?}

if [ "$FOLDER" = "" ]; then
  echo "Enter a number."
else
  cd $FOLDER

  echo "should I also download the pip requirements? (enter a number)"
  select DL in yes no
  do
  if [ "$DL" = "yes" ]; then
    mkdir -p pip_wheels
    pip3 install wheel
    pip3 wheel  --prefer-binary --wheel-dir pip_wheels -r requirements.txt
    tar -czvf - pip_wheels | split -b 32M - pip_wheels.tar.gz
    rm -rf ./pip_wheels
    echo 0x$(cat $(find . -type f | sort) | sha256sum | awk '{print $1}') | tee ../oracleID_$FOLDER.txt
    break
  elif [ "$DL" = "" ]; then
    echo "Enter a number."
  else
    echo 0x$(cat $(find . -type f | sort) | sha256sum | awk '{print $1}') | tee ../oracleID_$FOLDER.txt
    break
  fi
  done
  break
fi
done
