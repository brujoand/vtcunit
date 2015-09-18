FROM        ubuntu:14.04.2
MAINTAINER  Anders Brujordet "anders@brujordet.no"

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV TERM xterm

RUN apt-get update -qq && apt-get upgrade -yqq
RUN apt-get install apt-transport-https curl vim bc -yqq

# Ditching dash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -
RUN echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list
RUN apt-get update -yqq && apt-get install varnish -yqq

EXPOSE 6081
ADD vtcunit /vtcunit
ADD run_tests /run_tests
CMD ["/run_tests"]
