#!/usr/bin/env bash

echo -e '\n\n\n################# START CONTACT SPARK APP #################\n\n\n' &&

PYTHON_FILE='contact-spark-app.py'

docker cp ../spark-app/$PYTHON_FILE spark-master:/$PYTHON_FILE
docker exec -d spark-master pip install influxdb
docker exec -d spark-master /spark/bin/spark-submit --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.2.0 $PYTHON_FILE