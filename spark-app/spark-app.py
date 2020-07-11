from __future__ import print_function

import sys

from pyspark import SparkContext
from influxdb import InfluxDBClient
from pyspark.streaming import StreamingContext
from pyspark.streaming.kafka import KafkaUtils
import json


def read_json_file(x):
    print('LEGGO')
    print(json.dumps(json.loads(x[1]), indent=4))
    # print(json.loads(x[1])["city"])
    return x


# def reduce_json(x,y):
# return (y[0],y[1],y[2]+x[2], y[3]+x[3], y[4]+x[4], y[5]+x[5], y[6]+x[6])

def map_save_influx(x):
    # data = x[1]
    data = json.loads(x[1])
    json_body = [
        {
            "measurement": "CovidInfo",
            "tags": {
                "city": data["city"],
                "region": data["region"],
                "user_1": data["user_1"],
                "user_2": data["user_2"]
            },
            "fields": {
                "user_1": data["user_1"],
                "user_2": data["user_2"],
                "timestamp": data["timestamp"],
                "country": data["country"],
                "region": data["region"],
                "city": data["city"],
                "cap": data["cap"],
                "latitude": data["latitude"],
                "longitude": data["longitude"]
            }
        }
    ]
    client.write_points(json_body)
    return x


if __name__ == "__main__":
    sc = SparkContext(appName="PythonStreamingDirectKafkaWordCount")
    sc.setLogLevel("ERROR")
    ssc = StreamingContext(sc, 10)

    kvs = KafkaUtils.createDirectStream(ssc, ["lombardia", "sicilia", "toscana"], {"metadata.broker.list": "kafka:9092"})
    # kafkaRDD = KafkaUtils.createRDD(ssc,  kafkaParams, offsetRanges, leaders)

    client = InfluxDBClient(host='influx', port=8086)
    client.switch_database('covid')

    # lines = kvs.map(lambda x: read_json_file(x))
    # lines = kvs.map(lambda x: read_json_file(x)).reduceByKey(lambda x,y: reduce_json(x,y)).map(lambda x: map_save_influx(x))
    lines = kvs.map(lambda x: read_json_file(x)).map(lambda x: map_save_influx(x))

    # print(lines.count())
    lines.pprint()

    ssc.start()
    ssc.awaitTermination()
