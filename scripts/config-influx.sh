#!/usr/bin/env bash

curl -POST 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=CREATE CONTINUOUS QUERY cq_sicilia ON covid RESAMPLE EVERY 5s BEGIN SELECT count(*) INTO count_sicilia FROM contact WHERE region = 'Sicilia' GROUP BY time(1m) END"