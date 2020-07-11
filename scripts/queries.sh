#!/usr/bin/env bash

echo 'STAMPO TUTTA LA TABELLA'
#STAMPO TUTTA LA TABELLA
#curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=SELECT * FROM CovidInfo"
#echo 'SELEZIONO LE VARIE CITY DEL DB'
#curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=SELECT city FROM CovidInfo"
#echo 'SELEZIONO TIMESTAMP'
#curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=SELECT timestamp FROM CovidInfo"
#echo 'SELEZIONO SULLA B ASE DEL TAG ALTRIMENTI NON SI VEDE NULLA'
#curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=show tag values from CovidInfo with key=region"
#echo 'VEDO LE CHIAVI'
#curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=SHOW TAG KEYS ON covid"
#curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=SHOW TAG VALUES ON covid WITH KEY = region"
##curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=SELECT * FROM CovidInfo WHERE time< '2020-07-10 14:15:30.3622456Z'"
#curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=SELECT user_1 FROM covid WHERE time >= '2020-07-10T00:00:00Z' AND time <= '2020-07-10T14:15:10.4472916Z'"

#curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=SELECT user_1, user_2 FROM CovidInfo WHERE time > '14:15:00'"

#DROP CONTINUOS QUERY
#curl -POST 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=DROP CONTINUOUS QUERY cq_1 ON covid"

#SHOW CONTINUOUS QUERIES
#curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=SHOW CONTINUOUS QUERIES"

curl -POST 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=CREATE CONTINUOUS QUERY cq ON covid RESAMPLE EVERY 5s BEGIN SELECT count(*) INTO count_sicilia FROM CovidInfo WHERE region = 'Sicilia' GROUP BY time(1m) END"
#curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=covid" --data-urlencode "q=SELECT * FROM covid.autogen.count_sicilia"
