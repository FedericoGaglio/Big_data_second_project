from __future__ import print_function

from time import sleep

from influxdb import InfluxDBClient
import random
import json

if __name__ == "__main__":
    client = InfluxDBClient(host='influx', port=8086)
    client.switch_database('covid')

    for i in range (100):
        random_id = str(random.randint(1, 1000000))
        l_id = 'L'+random_id
        s_id = 'S'+random_id
        t_id = 'T'+random_id
        result = client.query("SELECT user_1 FROM autogen.contact WHERE (user_1 = l_id) ")
        #result = client.query('SELECT user_1 from contact WHERE random_id = ' + str(random.uniform(1, 100)))
        print("Result: {0}".format(result))
        sleep(1)
