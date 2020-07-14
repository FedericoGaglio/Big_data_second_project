#!/usr/bin/env bash


bash bootstrap-infrastructure.sh &&

sleep 6 &&

bash spark-app/start-all-spark-app.sh &&

sleep 10 &&

bash producers/bootstrap-all-producer.sh &&

sleep 5 &&

if [ "$(uname)" == "Darwin" ]; then
  open http://localhost:3000/d/covid/Home
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  xdg-open http://localhost:3000/d/covid/Home
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    start http://localhost:3000/d/covid/Home
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    start http://localhost:3000/d/covid/Home
fi


