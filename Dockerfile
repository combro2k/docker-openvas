FROM ubuntu-debootstrap:14.04
MAINTAINER Martijn van Maurik <docker@vmaurik.nl>

ENV DEBIAN_FRONTEND noninteractive
ENV LIBRARIES_VERSION 8.0+beta5
ENV SCANNER_VERSION 5.0+beta5
ENV MANAGER_VERSION 6.0+beta5
ENV GSA_VERSION 6.0+beta5

RUN apt-get update && apt-get dist-upgrade -yq
