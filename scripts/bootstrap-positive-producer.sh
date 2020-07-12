#!/usr/bin/env bash

echo -e '################# BUILD PRODUCER #################\n\n\n' &&
docker-compose build producer-positive &&

echo -e '\n\n\n################# START PRODUCER #################\n\n\n' &&
docker-compose up -d producer-positive