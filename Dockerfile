FROM node:5

MAINTAINER Fred Cox "mcfedr@gmail.com"

RUN apt-get update && apt-get install -y \
        libfreetype6 \
        libfontconfig \
        wget \
        bzip2 \
    && apt-get autoremove -y \
    && apt-get clean all

ENV PHANTOMJS_VERSION 2.1.1

RUN mkdir -p /srv/var \
    && wget -q -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 \
    && tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp \
    && rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 \
    && mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /srv/var/phantomjs \
    && ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs
