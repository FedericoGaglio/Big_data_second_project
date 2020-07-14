#!/usr/bin/env bash


echo -e '\n\n################# WAIT INFRASTRUCTURE BOOTSTRAP #################\n\n' &&
docker-compose up -d kafka zookeeper spark-master spark-worker-1 influx grafana &&

#echo -e '\n\n################# CONFIG INFLUX #################' &&
#bash config-influx.sh &&

echo -e '\n\n################# INFRASTRUCTURE IS RUNNING #################' &&

if [ "$(uname)" == "Darwin" ]; then
  open http://localhost:3000/d/covid/covid-dashboard
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  xdg-open http://localhost:3000/d/covid/covid-dashboard
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    start http://localhost:3000/d/covid/covid-dashboard
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    start http://localhost:3000/d/covid/covid-dashboard
fi


