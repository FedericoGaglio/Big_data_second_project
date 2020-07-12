import csv
import json
import sys
from time import sleep, time
from kafka import KafkaProducer
import random

TOPIC_FORMATTER = '{}'
CSV_FILE_NAME_FORMATTER = 'contact_{}.csv'


def create_kafka_producer(hostname, port):
    producer_endpoint_formatter = '{}:{}'
    return KafkaProducer(bootstrap_servers=producer_endpoint_formatter.format(hostname, port))


def send_data(producer, topic_name, data):
    producer.send(topic_name, data.encode('UTF-8'))
    print('SENT MESSAGE: ')
    print(json.dumps(json.loads(data), indent=4))
    print()
    return


def main():
    producer_id = sys.argv[1]
    topic = TOPIC_FORMATTER.format(producer_id)
    csv_file = CSV_FILE_NAME_FORMATTER.format(producer_id)

    producer = create_kafka_producer('kafka', '9092')

    with open(csv_file) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        first_line = True

        for row in csv_reader:
            if not first_line:
                user_id_1, user_id_2, country, region, city, cap, latitude, longitude = row
                x = {
                    "user_1": user_id_1,
                    "user_2": user_id_2,
                    "country": country,
                    "region": region,
                    "city": city,
                    "cap": cap,
                    "latitude": latitude,
                    "longitude": longitude,
                    "timestamp": time()
                }
                send_data(producer, topic, json.dumps(x))
                sleep(random.uniform(1,5))
            else:
                first_line = False


if __name__ == "__main__":
    main()
