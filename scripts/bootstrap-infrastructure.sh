#!/usr/bin/env bash


echo -e '\n\n################# START INFRASTRUCTURE BOOTSTRAP #################\n\n' &&
docker-compose up -d kafka zookeeper spark-master spark-worker-1 influx grafana &&

#echo -e '\n\n################# CONFIG INFLUX #################' &&
#bash config-influx.sh &&

echo -e '\n\n################# INFRASTRUCTURE IS RUNNING #################'


