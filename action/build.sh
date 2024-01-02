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
npm create qwik@latest empty qwik

# change directory
cd qwik

# delete files
rm -r src/routes/index.tsx src/routes/layout.tsx

# install dependencies
npm install

# copy the docs files
cp -r ../$DIRECTORY/* src/routes

# Add static page integration
npm run qwik add static --skipConfirmation=true

# build
npm run build

# deploy
npm run deploy