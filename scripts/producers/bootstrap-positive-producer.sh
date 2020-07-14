#!/usr/bin/env bash

echo -e '################# BUILD POSITIVE PRODUCER #################\n\n\n' &&
docker-compose build positive-producer &&

echo -e '\n\n\n################# START POSITIVE PRODUCER #################\n\n\n' &&
docker-compose up -d positive-producer