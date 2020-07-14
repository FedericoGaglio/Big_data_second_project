#!/usr/bin/env bash

echo -e '################# BUILD PRODUCER #################\n\n\n' &&
docker-compose build positive-producer &&

echo -e '\n\n\n################# START PRODUCER #################\n\n\n' &&
docker-compose up -d positive-producer