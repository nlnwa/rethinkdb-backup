FROM rethinkdb:2.3.5

LABEL maintainer="marius.beck@nb.no"

RUN apt-get update && \
    apt-get -y install python-pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip install rethinkdb

COPY docker-entrypoint.sh /usr/local/bin

USER rethinkdb

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["--help"]
