#!/usr/bin/env bash

echo -e '\n\n\n################# START ALL PRODUCER #################\n\n\n' &&

bash bootstrap-contact-producer.sh &&
sleep 6 &&

echo -e '\n\n\n################# CONTACT PRODUCER RUNNING #################\n\n\n' &&

bash bootstrap-positive-producer.sh &&
sleep 6 &&

echo -e '\n\n\n################# POSITIVE PRODUCER RUNNING #################\n\n\n' &&

bash bootstrap-healed-producer.sh &&

echo -e '\n\n\n################# HEALED PRODUCER RUNNING #################\n\n\n'
