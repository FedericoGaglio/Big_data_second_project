import json
from time import sleep, time
from kafka import KafkaProducer
from influxdb import InfluxDBClient
import random

TOPIC = 'positive'


def create_kafka_producer(hostname, port):
    producer_endpoint_formatter = '{}:{}'
    return KafkaProducer(bootstrap_servers=producer_endpoint_formatter.format(hostname, port))


def send_data(producer, data):
    producer.send(TOPIC, data.encode('UTF-8'))
    print('SENT MESSAGE: ')
    print(json.dumps(json.loads(data), indent=4))
    print()
    return


def main():
    producer = create_kafka_producer('kafka', '9092')

    client = InfluxDBClient(host='influx', port=8086)
    client.switch_database('covid')

    while True:
        num_user = random.randint(1, 5)
        result_set = client.query("SELECT sample(user_1,"+str(num_user)+"), country, region FROM covid.autogen.contact")
        result_list = list(result_set.get_points(measurement='contact'))
        final = [{'id': x['sample'], 'country': x['country'], 'region': x['region']} for x in result_list]
        x = {"positive_users": final}
        send_data(producer, json.dumps(x))
        sleep(random.uniform(1, 5))


if __name__ == "__main__":
    main()
