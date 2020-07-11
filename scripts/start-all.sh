#!/usr/bin/env bash

#docker-compose up -d kafka zookeeper spark-master spark-worker-1 influx &&
docker-compose up -d kafka zookeeper spark-master spark-worker-1 influx grafana &&

echo -e '\n\n################# WAIT KAFKA BOOTSTRAP #################' &&
sleep 5 &&

echo -e '\n\n################# CONFIG INFLUX #################' &&
bash config-influx.sh &&

echo -e '\n\n\n################# START SPARK APP #################\n\n\n' &&
bash start-spark-app.sh