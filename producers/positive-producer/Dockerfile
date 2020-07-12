FROM python:3

COPY positive-producer.py entrypoint.sh ./

RUN pip install kafka-python
RUN pip install influxdb

CMD ["sh", "-c",  "bash entrypoint.sh"]