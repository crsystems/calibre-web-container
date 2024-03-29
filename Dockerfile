FROM ubuntu:latest

RUN apt-get update && apt-get -y install git wget python python3 python-pip python-dev python3-dev libsasl2-dev libldap2-dev libssl-dev unzip && mkdir /build && mkdir /calibre && mkdir /library

RUN cd /build && wget https://github.com/janeczku/calibre-web/archive/master.zip && unzip master.zip

RUN cd /build/calibre-web-master && pip install -r requirements.txt && pip install -r optional-requirements.txt

EXPOSE 8083

ENTRYPOINT cp -r /build/calibre-web-master/* /calibre && cd /calibre && python cps.py

#ENTRYPOINT cd /calibre && python cps.py   
