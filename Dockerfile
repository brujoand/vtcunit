FROM alpine
MAINTAINER  Anders Brujordet "anders@brujordet.no"

RUN apk --update add varnish bash coreutils bc

EXPOSE 6081
ADD vtcunit /vtcunit
ADD run_tests /run_tests
CMD ["/run_tests"]
