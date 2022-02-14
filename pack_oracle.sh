  GNU nano 4.8                                                                                             pack_oracle.sh
#!/bin/bash
set -e

echo "{" > oracleIDs.json

for FOLDER in $(echo */)
do
cd $FOLDER
  if [ -f "requirementss.txt" ]
  then
    mkdir -p pip_wheels
    pip3 install wheel
    pip3 wheel  --prefer-binary --wheel-dir pip_wheels -r requirements.txt
    tar -czvf - pip_wheels | split -b 32M - pip_wheels.tar.gz
    rm -rf ./pip_wheels
  fi
  if [ -f "oracle.py" ]
  then
    NAME=$(echo $FOLDER | grep -Eo [^/]*)
    ID=$(cat $(find . -type f | sort) | sha256sum | awk '{print $1}')
    echo  '    "'$NAME'": "0x'$ID'",' >> ../oracleIDs.json
  fi
cd ..
done
sed -i '$ s/.$//' oracleIDs.json
echo "}" >> oracleIDs.json
echo ""
echo "Success! Created oracleIDs.json:"
cat oracleIDs.json
















