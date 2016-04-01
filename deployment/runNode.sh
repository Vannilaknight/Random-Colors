#!/usr/bin/env bash

if [ $(dpkg-query -W -f='${Status}' nodejs 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

node --version
npm -v

sudo npm install -g forever

cd deployment/

tar -xvf project.tar.gz

npm install
forever start index.js --color