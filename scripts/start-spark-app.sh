#!/usr/bin/env bash

echo -e '\n\n\n################# START SPARK CONTACT APP #################\n\n\n' &&

PYTHON_FILE='spark-app.py'

docker cp ../spark-app/$PYTHON_FILE spark-master:/$PYTHON_FILE
docker exec -it spark-master pip install influxdb
docker exec -it spark-master /spark/bin/spark-submit --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.2.0 $PYTHON_FILE