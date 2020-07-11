#!/usr/bin/env bash

echo -e '################# BUILD PRODUCER #################\n\n\n' &&
docker-compose build &&

echo -e '\n\n\n################# START PRODUCER #################\n\n\n' &&
docker-compose up -d producer-lombardia producer-sicilia producer-toscana