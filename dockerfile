FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install python python-pip -y
RUN mkdir /opt/app
COPY src/* /opt/app/
COPY requirements.txt /opt/app
RUN pip install -r /opt/app/requirements.txt

EXPOSE 5000

ENTRYPOINT FLASK_APP=/opt/app/main.py flask run
