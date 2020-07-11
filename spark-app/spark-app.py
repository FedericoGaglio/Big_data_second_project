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
    return x

def map_save_influx(x):
    data = json.loads(x[1])

    json_body = [
        {
            "measurement": "contact",
            "tags": {
                "country": data["country"],
                "region": data["region"],
                "city": data["city"],
                "user_1": data["user_1"],
                "user_2": data["user_2"]
            },
            "fields": {
                "user_1": data["user_1"],
                "user_2": data["user_2"],
                "country": data["country"],
                "timestamp": data["timestamp"],
                "region": data["region"],
                "city": data["city"],
                "cap": data["cap"],
                "latitude": str(data["latitude"]),
                "longitude": str(data["longitude"])
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

    client = InfluxDBClient(host='influx', port=8086)
    client.switch_database('covid')

    lines = kvs.map(lambda x: read_json_file(x)).map(lambda x: map_save_influx(x))

    lines.pprint()

    ssc.start()
    ssc.awaitTermination()
