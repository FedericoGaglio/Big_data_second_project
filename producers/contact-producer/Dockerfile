FROM python:3

ENV REGION=${REGION}

COPY contact-producer.py entrypoint.sh data/* ./

RUN pip install kafka-python

CMD ["sh", "-c",  "bash entrypoint.sh $REGION"]