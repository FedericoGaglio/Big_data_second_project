#!/usr/bin/env bash

#curl -POST 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=CREATE CONTINUOUS QUERY cq_sicilia ON covid RESAMPLE EVERY 5s BEGIN SELECT count(*) INTO count_sicilia FROM contact WHERE region = 'Sicilia' GROUP BY time(1m) END"
curl -POST 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=CREATE CONTINUOUS QUERY cq_positive ON covid RESAMPLE EVERY 5s BEGIN SELECT count(distinct(user_id))  INTO count_positive FROM positive WHERE status = 'positive' GROUP BY time(10s) END"
curl -POST 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=CREATE CONTINUOUS QUERY cq_healed ON covid RESAMPLE EVERY 5s BEGIN SELECT count(distinct(user_id)) INTO count_healed FROM positive WHERE status = 'healed' GROUP BY time(10s) END"


#DROP CONTINUOS QUERY
#curl -POST 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=DROP CONTINUOUS QUERY cq_sicilia ON covid"

#SHOW CONTINUOUS QUERIES
#curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=SHOW CONTINUOUS QUERIES"