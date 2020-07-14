#!/usr/bin/env bash

echo -e '################# BUILD HEALED PRODUCER #################\n\n\n' &&
docker-compose build healed-producer &&

echo -e '\n\n\n################# START HEALED PRODUCER #################\n\n\n' &&
docker-compose up -d healed-producer