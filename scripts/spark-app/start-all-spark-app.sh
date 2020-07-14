#!/usr/bin/env bash

echo -e '\n\n################# START ALL SPARK APP #################' &&

bash spark-app/start-contact-spark-app.sh &&
sleep 5 &&

echo -e '\n\n\n################# CONTACT SPARK APP RUNNING #################' &&

bash spark-app/start-positive-spark-app.sh &&
sleep 5 &&

echo -e '\n################# POSITIVE SPARK APP RUNNING #################' &&

bash spark-app/start-healed-spark-app.sh &&

echo -e '\n################# HEALED SPARK APP RUNNING #################' &&

echo -e '\n\n\n################# ALL SPARK APP ARE RUNNING #################'

