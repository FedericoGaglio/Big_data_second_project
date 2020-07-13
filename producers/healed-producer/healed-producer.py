import json
from time import sleep, time
from kafka import KafkaProducer
from influxdb import InfluxDBClient
import random

TOPIC = 'healed'


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
        num_user = random.randint(1, 3)
        result_set = client.query("SELECT sample(user_id,"+str(num_user)+"), country, region FROM covid.autogen.positive")
        result_list = list(result_set.get_points(measurement='positive'))
        final = [{'id': x['sample'], 'country': x['country'], 'region': x['region']} for x in result_list]
        x = {"healed_users": final}
        send_data(producer, json.dumps(x))
        sleep(random.uniform(1, 5))


if __name__ == "__main__":
    main()
