#!/usr/bin/env bash

docker exec -it kafka kafka-topics.sh --list --bootstrap-server kafka:9092