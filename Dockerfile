FROM docker.io/library/debian:stable

COPY entrypoint.sh /
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install netcat postgresql-client -y && \
    apt-get clean && \
    chmod 555 /entrypoint.sh

USER 1000

ENTRYPOINT ["/entrypoint.sh"]
