#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  open http://localhost:3000/d/covid/covid-dashboard
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  xdg-open http://localhost:3000/d/covid/covid-dashboard
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    start http://localhost:3000/d/covid/covid-dashboard
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    start http://localhost:3000/d/covid/covid-dashboard
fi


