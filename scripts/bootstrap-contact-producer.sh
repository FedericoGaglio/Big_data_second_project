#!/usr/bin/env bash

echo -e '################# BUILD CONTACT PRODUCER #################\n\n\n' &&
docker-compose build sicilia-producer lombardia-producer toscana-producer &&

echo -e '\n\n\n################# START CONTACT PRODUCER #################\n\n\n' &&
docker-compose up -d sicilia-producer lombardia-producer toscana-producer