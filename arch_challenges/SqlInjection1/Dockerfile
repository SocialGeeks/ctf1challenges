FROM ubuntu:14.04
MAINTAINER Ian Laird <en0@mail.com>
ENV DEBIAN_FRONTEND noninteractive

#apt-get install -y python python-pip python-dev gunicorn && \
RUN \
    apt-get update --fix-missing && \
    apt-get install -y python python-pip python-dev && \
    apt-get install -y supervisor  mysql-server libmysqlclient-dev && \
    mkdir -p /srv/http

RUN \
    rm -rf /var/lib/apt/lists/*

ADD app.conf /etc/supervisor/conf.d/
ADD requirements.txt /tmp/requirements.txt

RUN \
    pip install -r /tmp/requirements.txt && \
    mkdir -p /opt/CTFd/CTFd/logs

ADD bootstrap.sh /bin/bootstrap
ADD dbinit.sql /root/
ADD run.py /srv/http/

CMD bootstrap
