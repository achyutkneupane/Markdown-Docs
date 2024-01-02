#!/bin/bash

DIRECTORY=""
BRANCH=""
TARGET=""

#get args
while getopts d:b:t: flag
do
case "${flag}"
in
d) DIRECTORY=${OPTARG};;
b) BRANCH=${OPTARG};;
t) TARGET=${OPTARG};;
esac
done

# checkout branch
git checkout $BRANCH

# create Qwik Instance
npm create qwik@latest empty docs/$DIRECTORY

# change directory
cd docs/$DIRECTORY

# install dependencies
npm install

# build
npm run build

# deploy
npm run deploy