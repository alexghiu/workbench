FROM ubuntu:bionic
RUN apt-get -qqy update && apt-get install -qqy \
        git \
        vim
