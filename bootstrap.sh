#!/bin/bash

echo switching node to version $NODE_VERSION
n $NODE_VERSION --quiet

echo node version: `node --version`

git clone $GIT_URL app
cd app

if [ "$USE_YARN" = "yes" ]; then
  yarn install --production --silent
else
  npm install --production --silent
fi

npm run $NPM_SCRIPT
