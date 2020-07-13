#!/usr/bin/env bash


echo -e '\n\n################# WAIT INFRASTRUCTURE BOOTSTRAP #################' &&
docker-compose up -d kafka zookeeper spark-master spark-worker-1 influx grafana &&
echo -e '\n\n################# INFRASTRUCTURE IS RUNNING #################'

#xdg-open http://localhost:3000/d/covid/covid-dashboard
open http://localhost:3000/d/covid/covid-dashboard

#echo -e '\n\n################# CONFIG INFLUX #################' &&
#bash config-influx.sh &&