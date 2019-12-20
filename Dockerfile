FROM ubuntu:latest

RUN apt-get update && apt-get -y install wget python python-pip unzip && mkdir /build && mkdir /calibre && mkdir /library

RUN cd /build && wget https://github.com/janeczku/calibre-web/archive/master.zip && unzip master.zip

RUN cd /build/calibre-web-master && pip install -r requirements.txt && pip install -r optional-requirements.txt

EXPOSE 8083

ENTRYPOINT cp -r /build/calibre-web-master/* /calibre && cd /calibre && python cps.py

#ENTRYPOINT cd /calibre && python cps.py   
