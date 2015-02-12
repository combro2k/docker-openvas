FROM ubuntu-debootstrap:14.04
MAINTAINER Martijn van Maurik <docker@vmaurik.nl>

ENV DEBIAN_FRONTEND noninteractive
ENV LIBRARIES_VERSION 8.0+beta6
ENV SCANNER_VERSION 5.0+beta6
ENV MANAGER_VERSION 6.0+beta6
ENV ASSISTANT_VERSION 6.0+beta6

RUN apt-get update && apt-get dist-upgrade -yq && \
    apt-get install curl build-essential -yq && \
    apt-get clean

RUN mkdir -p /usr/src/build/libraries && cd /usr/src/build/libraries && \
    curl http://wald.intevation.org/frs/download.php/1922/openvas-libraries-${LIBRARIES_VERSION}.tar.gz | tar zxv --strip-components=1 && \
    ./configure --prefix=/usr && make && make install && \
    mkdir -p /usr/src/build/scanner && cd /usr/src/build/scanner && \
    curl http://wald.intevation.org/frs/download.php/1926/openvas-scanner-${SCANNER_VERSION}.tar.gz | tar zxv --strip-components=1 && \
    ./configure --prefix=/usr && make && make install && \
    mkdir -p /usr/src/build/manager && cd /usr/src/build/manager && \
    curl http://wald.intevation.org/frs/download.php/1930/openvas-manager-${MANAGER_VERSION}.tar.gz | tar zxv --strip-components=1 && \
    ./configure --prefix=/usr && make && make install && \
    mkdir -p /usr/src/build/assistant && cd /usr/src/build/assistant && \
    curl http://wald.intevation.org/frs/download.php/1934/greenbone-security-assistant-${ASSISTANT_VERSION}.tar.gz | tar zxv --strip-components=1 && \
    ./configure --prefix=/usr && make && make install

CMD bash